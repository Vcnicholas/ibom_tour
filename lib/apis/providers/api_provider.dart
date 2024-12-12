import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ibom_tour/constants/enums.dart';

import '../../app_services/network_controlle.dart';
import '../../app_services/route_service.dart';
import '../../constants/urls.dart';
import '../../helpers/exceptions.dart';
import '../../utils/app_utility.dart';


class ResponseData {
  ResponseData({
    required this.data,
    required this.isSuccessful,
  });

  dynamic data;
  bool isSuccessful;
}

class ApiProvider{
  ApiProvider(this._client, {this.baseUrl}) {
    baseUrl ??= AppUrls.baseUrl;
  }

   String? baseUrl;

  final http.Client _client;
  final _networkService = NetworkController.instance;

  /// --------------------------------------------------------------------------

  /// Server -------------------------------------------------------------------

  /// Check Server Health
  
  
  /// Auth ---------------------------------------------------------------------

  /// Validate Token
  Future<ResponseData> validateToken(String token) async {
    final response = await _catchAsyncApiError(
      endPoint: AppUrls.validateTokenEndpoint,
      method: 'GET',
      feature: 'Validate Token',
      headers: {'authorization': 'Bearer $token'},
      queryParams: {'token': token},
    );

    return response;
  }
  
   /// Register
  Future<ResponseData> register(Map<String, dynamic> body) async {
    final response = await _catchAsyncApiError(
      endPoint: AppUrls.registerEndpoint,
      method: 'POST',
      feature: 'Register',
      body: body,
    );

    return response;
  }

  /// This is the method that is called from the service class.
  Future<dynamic> _catchAsyncApiError({
    String? baseUrl,
    required String endPoint,
    required String method,
    required String feature,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    AppUtility.log('$feature Request');

    if (_networkService.isConnected == false) {
      AppUtility.log('Error: No network connection', tag: 'error');
      RouteService.set(RouteStatus.noNetwork);
      return;
    }

    var url = Uri.parse((baseUrl ?? this.baseUrl!) + endPoint);

    if (queryParams != null && queryParams.isNotEmpty) {
      url = url.replace(queryParameters: queryParams);
    }

    AppUtility.log('URL: $url');

    var headersWithContentType = {
      "content-type": "application/json",
    };

    if (headers != null) {
      headersWithContentType.addAll(headers);
    }

    try {
      switch (method) {
        /// GET request
        case "GET":
          var response = await _client.get(
            url,
            headers: headersWithContentType,
          );

          var decodedData = jsonDecode(utf8.decode(response.bodyBytes));

          if (response.statusCode == 200 || response.statusCode == 201) {
            AppUtility.log('$feature Request Success');
            return ResponseData(data: decodedData, isSuccessful: true);
          } else {
            AppUtility.log('$feature Request Error', tag: 'error');
            AppUtility.log(
                'Error: ${response.statusCode} ${response.reasonPhrase} ${response.body}');
            return ResponseData(data: decodedData, isSuccessful: false);
          }

        /// POST request
        case "POST":
          var response = await _client.post(
            url,
            body: jsonEncode(body),
            headers: headersWithContentType,
          );

          var decodedData = jsonDecode(utf8.decode(response.bodyBytes));

          if (response.statusCode == 200 || response.statusCode == 201) {
            AppUtility.log('$feature Request Success');
            return ResponseData(data: decodedData, isSuccessful: true);
          } else {
            AppUtility.log('$feature Request Error', tag: 'error');
            AppUtility.log(
                'Error: ${response.statusCode} ${response.reasonPhrase} ${response.body}');
            return ResponseData(data: decodedData, isSuccessful: false);
          }

        /// PUT request
        case "PUT":
          var response = await _client.put(
            url,
            body: jsonEncode(body),
            headers: headersWithContentType,
          );

          var decodedData = jsonDecode(utf8.decode(response.bodyBytes));

          if (response.statusCode == 200 || response.statusCode == 201) {
            AppUtility.log('$feature Request Success');
            return ResponseData(data: decodedData, isSuccessful: true);
          } else {
            AppUtility.log('$feature Request Error', tag: 'error');
            AppUtility.log(
                'Error: ${response.statusCode} ${response.reasonPhrase} ${response.body}');
            return ResponseData(data: decodedData, isSuccessful: false);
          }

        /// DELETE request
        case "DELETE":
          var response = await _client.delete(
            url,
            headers: headersWithContentType,
          );

          var decodedData = jsonDecode(utf8.decode(response.bodyBytes));

          if (response.statusCode == 200 || response.statusCode == 201) {
            AppUtility.log('$feature Request Success');
            return ResponseData(data: decodedData, isSuccessful: true);
          } else {
            AppUtility.log('$feature Request Error', tag: 'error');
            AppUtility.log(
                'Error: ${response.statusCode} ${response.reasonPhrase} $decodedData');
            return ResponseData(data: decodedData, isSuccessful: false);
          }
      }
    } on SocketException {
      AppUtility.log('$feature Request Error', tag: 'error');
      AppUtility.log('Error: No Internet Connection', tag: 'error');
      throw AppException('No Internet Connection');
    } on TimeoutException {
      AppUtility.log('$feature Request Error', tag: 'error');
      AppUtility.log('Error: Request Timeout', tag: 'error');
      throw AppException('Request Timeout');
    } on FormatException catch (e) {
      AppUtility.log('$feature Request Error', tag: 'error');
      AppUtility.log('Format Exception: $e', tag: 'error');
      throw AppException('Format Exception: $e');
    } catch (exc) {
      AppUtility.log('$feature Request Error', tag: 'error');
      AppUtility.log('Error: $exc', tag: 'error');
      throw AppException(exc.toString());
    }
  }
}
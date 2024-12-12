import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constants/hive_type_id.dart';

part 'user.g.dart';

@CopyWith()
@JsonSerializable()
@HiveType(typeId: HiveTypeId.user)
class User {
  User({
    this.id,
    this.email,
    this.phone,
    this.emailVerified,
    this.role,
    this.username,
    this.fullName,
    this.bio,
    this.profilePhoto,
    this.interests,
    this.wallet,
    this.isGoogleAuth,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.refreshToken,
    this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;

  @JsonKey(name: 'fullName')
  @HiveField(1)
  final String? fullName;

  @JsonKey(name: 'email')
  @HiveField(2)
  final String? email;

  @JsonKey(name: 'username')
  @HiveField(3)
  final String? username;

  @JsonKey(name: 'profilePhoto')
  @HiveField(4)
  String? profilePhoto;

  @JsonKey(name: 'phone')
  @HiveField(5)
  String? phone;

  @JsonKey(name: 'wallet')
  @HiveField(6)
  final int? wallet;

  @JsonKey(name: 'role')
  @HiveField(7)
  final String? role;

  @JsonKey(name: 'emailVerified')
  @HiveField(8)
  final bool? emailVerified;

  @JsonKey(name: 'accessToken')
  @HiveField(9)
 final String? accessToken;

  @JsonKey(name: 'createdAt')
  @HiveField(10)
  final DateTime? createdAt;

  @JsonKey(name: 'updatedAt')
  @HiveField(11)
  final DateTime? updatedAt;

  @JsonKey(name: 'interests')
  @HiveField(12)
  List<dynamic>? interests;

  @JsonKey(name: 'refreshToken')
  @HiveField(13)
  final String? refreshToken;

  @JsonKey(name: 'v')
  @HiveField(14)
  final int? v;

  @JsonKey(name: 'isGoogleAuth')
  @HiveField(15)
  final bool? isGoogleAuth;

  @JsonKey(name: 'bio')
  @HiveField(16)
  final String? bio;
}

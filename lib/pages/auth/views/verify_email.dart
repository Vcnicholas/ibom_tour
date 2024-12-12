// import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/app_widgets/app_texts.dart';
import 'package:ibom_tour/constants/colors.dart';
import 'package:ibom_tour/pages/auth/controllers/register_controller.dart';
import 'package:ibom_tour/routes/routes_management.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../app_widgets/unfocus_widget.dart';
import '../../../constants/styles.dart';
import '../../../constants/widget_extension.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<RegisterController>(
      builder: (model) => UnFocusWidget(
            child: Container(
              margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                    right: 10,
                  ),
              child: Scaffold(
                body: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                    right: 10,
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              RouteManagement.goToBack();
                            },
                            child: Icon(
                              Icons.close,
                            ),
                          ),
                          AppText(
                            'Login',
                            color: ColorValues.primaryColor,
                          ),
                        ],
                      ),
                      Gap(20.sp),
                      AppText(
                        'Verify your account',
                        size: 26.sp,
                        style: AppStyles.style28Bold,
                      ),
                      Gap(10.sp),
                      AppText(
                          'A verification code willl e sent to vcnicholas982@gmail.com'),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text:
                                'A verification code will bes sent to +23490466389647')
                      ])),
                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        backgroundColor: ColorValues.grayColor.withOpacity(.8),
                        pinTheme: PinTheme(
                          fieldHeight: 48.sp,
                          fieldWidth: 48.sp,
                          borderRadius: BorderRadius.circular(10.sp),
                          activeColor: ColorValues.lightGrayColor,
                          activeFillColor: ColorValues.grayColor.withOpacity(.6),
                          inactiveColor: ColorValues.grayColor,
                          shape: PinCodeFieldShape.box,
                        ),
                      ),
                      Container(
                          height: 58,
                          width: width(context),
                          decoration: BoxDecoration(
                              color: ColorValues.grayColor.withOpacity(
                                .4,
                              ),
                              borderRadius: BorderRadius.circular(7.r)),
                          child: Center(child: AppText('Resend in 10s', size : 16.sp)))
                    ],
                  ),
                ),
              ),
            ),
          ));
}

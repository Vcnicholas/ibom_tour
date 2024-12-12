import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/pages/auth/controllers/register_controller.dart';
import 'package:ibom_tour/routes/routes_management.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../app_widgets/app_button.dart';
import '../../../app_widgets/app_texts.dart';
import '../../../app_widgets/unfocus_widget.dart';
import '../../../constants/colors.dart';
import '../../../constants/styles.dart';

class VerifyAccount extends StatelessWidget {
  VerifyAccount({super.key, required this.number});
  final String number;

  @override
  Widget build(BuildContext context) => GetBuilder<RegisterController>(
        builder: (model) => UnFocusWidget(
          child: Scaffold(
            body: Container(
              margin: const EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
              ),
              child: ListView(
                children: [
                  Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                RouteManagement.goToBack();
                              },
                              child: const Icon(
                                Icons.close,
                              ),
                            ),
                            Container(
                              width: 75.sp,
                              height: 48.sp,decoration: BoxDecoration(color: ColorValues.grayColor.withOpacity(.1), borderRadius: BorderRadius.circular(70.sp)),
                              child: Center(
                                child: AppText(
                                  'Login',
                                  color: ColorValues.grayColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(20.sp),
                        AppText(
                          'Verify your phone \nnumber',
                          align: TextAlign.center,
                          size: 26.sp,
                         weight: FontWeight.w600 ,
                        ),
                        Gap(10.sp),
                        Text.rich(textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                               TextSpan(
                                  text: 'We have sent an SMS with an activation code to your phone ', style: AppStyles.style14Normal),
                              TextSpan(
                                text: number,
                                style: AppStyles.style14Bold,
                              ),
                            ],
                          ),
                        ),
                        Gap(30.sp),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: PinCodeTextField(
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            appContext: context,
                            length: 4,
                            pinTheme: PinTheme(
                              fieldHeight: 48.sp,
                              fieldWidth: 48.sp,
                              borderRadius: BorderRadius.circular(10.sp),
                              activeColor: ColorValues.lightGrayColor,
                              activeFillColor:
                                  ColorValues.grayColor.withOpacity(.6),
                              inactiveColor: ColorValues.grayColor,
                              shape: PinCodeFieldShape.box,
                            ),
                            onChanged: (value) {
                              // Handle the input changes
                              print('PinCode Input: $value');
                            },
                          ),
                        ),
                        Gap(30.sp),

                      ],
                    ),
                  ),
   
                  Gap(10.sp),
                 
                  Gap(40.sp)
                ],
              ),
            ),
          ),
        ),
      );
}

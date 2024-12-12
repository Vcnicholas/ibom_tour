import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/app_widgets/app_button.dart';
import 'package:ibom_tour/app_widgets/app_texts.dart';
import 'package:ibom_tour/constants/colors.dart';
import 'package:ibom_tour/constants/styles.dart';
import 'package:ibom_tour/pages/auth/controllers/register_controller.dart';
import 'package:ibom_tour/pages/auth/views/verify_account.dart';
import 'package:ibom_tour/routes/routes_management.dart';

import '../../../app_widgets/app_input.dart';
import '../../../app_widgets/snackBar.dart';
import '../../../app_widgets/unfocus_widget.dart';
import '../../../constants/assets.dart';
import '../../../constants/widget_extension.dart';

class RegisterView extends StatelessWidget {
  RegisterView({
    super.key,
  });
  String pNumber = 'null';
  String countryCode = '+234';

  @override
  Widget build(BuildContext context) => GetBuilder<RegisterController>(
      builder: (model) => UnFocusWidget(
            child: Container(
              child: Scaffold(
                body: Form(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 15,
                      right: 15,
                    ),
                    child: ListView(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      RouteManagement.goToBack();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: ColorValues.grayColor,
                                    ),
                                  ),
                                  Container(
                                    width: 75.sp,
                                    height: 48.sp,
                                    decoration: BoxDecoration(
                                        color: ColorValues.grayColor
                                            .withOpacity(.1),
                                        borderRadius:
                                            BorderRadius.circular(70.sp)),
                                    child: Center(
                                      child: AppText(
                                        'Login',
                                        color: ColorValues.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(20.sp),
                              AppText(
                                'Create your account',
                                size: 26.sp,
                                  weight: FontWeight.w600,
                              ),
                              Gap(10.sp),
                              AppText(
                                'A verification code will be sent to your entered number',
                                align: TextAlign.start,
                              ),
                              Gap(10.sp),
                              Gap(5.sp),
                              AppInputField(
                                hintText: 'Input your full name',
                                topLabel: 'Full Name',
                                controller: model.fNameTextController,
                              ),

                              Gap(10.sp),
                              AppInputField(
                                keyBoardType: TextInputType.number,
                                topLabel: 'Phone Number',
                                prefixIcon: Container(width: 100.sp, child: Row(
                                  children: [
                                    Gap(10.sp),
                                    Image.asset(AssetValues.country, height: 25.sp,),
                                    AppText('  +234', size: 16.sp, weight: FontWeight.w500,)
                                  ],
                                )),
                                controller: model.phoneNumberController,
                                onChanged: (value) {
                                  if (value.length > 10) {
                                     pNumber =
                                        '${countryCode}${model.phoneNumberController.text.substring(1)}';
                                    //
                                    print('${pNumber}');
                                  }else{
                                    pNumber = '${countryCode}${model.phoneNumberController.text}';
                                  }
                                },
                              ),
                              Gap(10.sp),
                              AppInputField(
                                topLabel: 'Email',
                                hintText: 'Input your Email',
                                controller: model.lNameTextController,
                              ),
                              Gap(10.sp),
                              AppText('How did you hear about us', size: 16.sp,
                              weight: FontWeight.w500,),

                              Gap(10.sp),_buildDropdown(
                                  context,
                                  value: model.selectedAwareness,
                                  items: model.awarenessMethod,
                                  onChanged: (value){
                                    model.selectedAwareness = value!;
                                    model.update();
                                    print(value);
                                  }),
                              if(model.selectedAwareness == 'Other')
                                Column(
                                  children: [
                                    Gap(10.sp),
                                    AppInputField(topLabel:
                                      'If others please specify ',),
                                  ],
                                ),
                              Gap(10.sp),
                              AppInputField(
                                topLabel: 'Password',
                                hintText: 'Input your password',
                                obscureText: model.showPassword,
                                controller: model.passwordTextController,
                                // validator: (value) {
                                //   model.validatePassword(
                                //       model.passwordTextController.text);
                                // },
                                onChanged: (value) {
                                  model.validatePassword(value);
                                },
                                suffixIcon: InkWell(
                                    onTap: () {
                                      model.toggleViewPassword();
                                    },
                                    child: Icon(
                                      model.showPassword
                                          ? CupertinoIcons.eye
                                          : CupertinoIcons.eye_slash,
                                    )),
                              ),

                              Gap(10.sp),
                              Row(children: [Icon( model.hasCapital? Icons.check: Icons.close, size: 20.sp,
                                  color: model.hasCapital
                                      ? ColorValues.successColor
                                      : ColorValues.grayColor),
                                Gap(5.sp),
                                AppText(
                                    'Password Should contain capital letters', size: 12.sp,
                                    color: model.hasCapital
                                        ? ColorValues.successColor
                                        : ColorValues.grayColor)
                              ]),
                              Gap(10.sp),
                              Row(
                                children: [
                                  Icon( model.hasNumbers? Icons.check: Icons.close, size: 20.sp,
                                      color: model.hasNumbers
                                          ? ColorValues.successColor
                                          : ColorValues.grayColor),
                                  Gap(5.sp),
                                  AppText(
                                      'Password Should contain numbers (12345689)',size: 12.sp,
                                      color: model.hasNumbers
                                          ? ColorValues.successColor
                                          : ColorValues.grayColor)
                                ],
                              ),
                              Gap(10.sp),
                              Row(children: [
                                Icon( model.hasPecialCharacters? Icons.check: Icons.close, size: 20.sp,
                                    color: model.hasPecialCharacters
                                        ? ColorValues.successColor
                                        : ColorValues.grayColor),
                                Gap(5.sp),
                                AppText(
                                    'Password Should contain special characters (@%\$)',size: 12.sp,
                                    color: model.hasPecialCharacters
                                        ? ColorValues.successColor
                                        : ColorValues.grayColor)
                              ]),
                              Gap(10.sp),
                              Row(children: [
                                Icon( model.has8? Icons.check: Icons.close, size: 20.sp,
                                    color: model.has8
                                        ? ColorValues.successColor
                                        : ColorValues.grayColor),
                                Gap(5.sp),
                                AppText(
                                    'Password Should be at least eight characters',size: 12.sp,
                                    color: model.has8
                                        ? ColorValues.successColor
                                        : ColorValues.grayColor)
                              ]),
                            ],
                          ),
                        ),
                        Gap(30.sp),

                        AppButton(
                          text: 'Next',
                          onTap: () {
                            Get.to(() => VerifyAccount(
                                  number: pNumber,
                                ));



                          },
                        ),
                        Gap(40.sp)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
}
Widget _buildDropdown(
    BuildContext context, {
      required String? value, // Make value nullable
      required List<String> items,
      required ValueChanged<String?> onChanged,
    }) {
  // Ensure that value is in items, otherwise provide a default
  String? selectedValue = items.contains(value)
      ? value
      : items.isNotEmpty
      ? items.first
      : null;

  return Padding(
    padding: EdgeInsets.all(0.sp),
    child: Container(
      height: 55.sp,
      width: width(context),
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 6.sp),
      decoration: BoxDecoration(
        color: ColorValues.grayColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          items: items
              .map((item) => DropdownMenuItem(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: AppText(
                item,
              ),
            ),
            value: item,
          ))
              .toList(),
          onChanged: onChanged,
          icon: Icon(Icons.arrow_drop_down),
          elevation: 0,
          selectedItemBuilder: (BuildContext context) {
            return items.map((String value) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.sp),
                child: AppText(
                  value,
                  style: AppStyles.style14Normal,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList();
          },
        ),

      ),
    ),
  );
}
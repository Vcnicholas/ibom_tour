import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/constants/colors.dart';
import 'package:ibom_tour/pages/auth/controllers/kyc_controller.dart';
import 'package:ibom_tour/routes/routes_management.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../app_widgets/app_texts.dart';
import '../../../../../../app_widgets/unfocus_widget.dart';


class Notifications extends StatelessWidget {
  Notifications({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<KycController>(
    builder: (model) => UnFocusWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText('Notifications', size: 14.sp, weight: FontWeight.w500
              ),
              AppText('Mark all as read')
            ],
          ),
          centerTitle: true
          ,
        ),
        body: Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15,
          ),
          child: ListView(
            children: [
              Container(
                height: 656.sp,
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
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).brightness == Brightness.dark ?
                            ColorValues.whiteColor: ColorValues.blackColor,
                          ),
                        ),
                      ],
                    ),
                   Column(children: List.generate(8, (index) => Container(
                     decoration: BoxDecoration(border: 
                     Border(bottom: 
                     BorderSide(
                         color: ColorValues.blackColor20)),),
                     child: Row(
                       children: [
                       CircleAvatar(radius: 15.sp,),
                       Column(children: [AppText('Samantha Bell initiated to trade with you')],)],),
                   )),),
                Gap(30.sp),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

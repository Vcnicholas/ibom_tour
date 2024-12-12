import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ibom_tour/app_widgets/app_filled_btn.dart';
import 'package:ibom_tour/app_widgets/app_texts.dart';
import 'package:ibom_tour/constants/colors.dart';
import 'package:ibom_tour/constants/dimens.dart';
import 'package:ibom_tour/constants/strings.dart';
import 'package:ibom_tour/constants/styles.dart';
import 'package:ibom_tour/pages/onboarding/onboarding_controller.dart';
import 'package:ibom_tour/routes/routes_management.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (con) {
      return Scaffold(
        extendBody: true,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: Dimens.screenHeight,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (
                      index,
                      reason,
                    ) {
                      con.changeCarouselIndexValue(index);
                    },
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          con.onBoardingObjects[index].image),
                                      fit: BoxFit.fitWidth))),
                        ),
                        SizedBox(
                          height: 6,
                          child: AnimatedSmoothIndicator(
                            activeIndex: con.sliderIndex,
                            count: 3,
                            axisDirection: Axis.horizontal,
                            effect: ScrollingDotsEffect(
                              spacing: 10,
                              activeDotColor: ColorValues.primaryColor,
                              activeDotScale: 1,
                              dotColor: ColorValues.primaryColor10,
                              dotHeight: 6,
                              dotWidth: index == realIndex ? 22 : 9,
                            ),
                          ),
                        ),
                        Dimens.boxHeight32,
                        Padding(
                          padding: Dimens.edgeInsets16,
                          child: AppText(
                            con.onBoardingObjects[index].details,
                            style: AppStyles.style20Bold,
                          ),
                        ),
                        Dimens.boxHeight10,
                        Padding(
                          padding: Dimens.edgeInsets16,
                          child: AppText(
                            con.onBoardingObjects[index].subtitle,
                            style: AppStyles.style11Normal,
                            align: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                padding: Dimens.edgeInsets0_16,
                child: Column(
                  children: [
                    Dimens.boxHeight48,
                    BxFilledButton(
                      width: Dimens.screenWidth,
                      label: StringValues.getStarted,
                      onTap: RouteManagement.goToSelectOption,
                      margin: Dimens.edgeInsetsOnlyBottom12,
                    ),
                    Dimens.boxHeight20,
                    // AppButton(
                    //   isTransparent: true,
                    //   onTap: con.gotoLoginView,
                    //   text: "Log In",
                    // ),
                    // Dimens.boxHeight32,
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

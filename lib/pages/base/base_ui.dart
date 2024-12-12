import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibom_tour/constants/colors.dart';
import 'package:ibom_tour/constants/widget_extension.dart';
import 'package:ibom_tour/locator.dart';
import 'package:ibom_tour/pages/base/base.vm.dart';
import 'package:get_it/get_it.dart';


// The BaseView controls all the states of all the UIs
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final bool notDefaultLoading;
  final Widget Function(BuildContext context, T model)? builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;
  final Color color;
  

  const BaseView({
    Key? key,
    this.builder,
    this.onModelReady,
    this.color = ColorValues.whiteColor,
    this.onModelDispose,
    this.notDefaultLoading = false,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  
  final T model = Get.put(getIt<T>());

  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  void dispose() {
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          widget.builder!(context, model),
          widget.notDefaultLoading
              ? 0.0.sbH
              : model.isLoading.value
                  ? Stack(
                      children: [
                        ModalBarrier(
                          color: Colors.black12.withOpacity(0.5),
                          dismissible: false,
                        ),
                        Center(child: Container()),
                      ],
                    )
                  : const SizedBox(),
        ],
      );
    });
  }
}

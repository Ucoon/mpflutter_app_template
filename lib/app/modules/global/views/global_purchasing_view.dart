import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widget/widget.dart';
import '../index.dart';

class GlobalPurchasingPage extends GetView<GlobalPurchasingController> {
  const GlobalPurchasingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayoutPage<GlobalPurchasingController>(
      _buildBodyWidget,
      canBack: false,
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    return Center(
      child: Text(
        'global'.tr,
      ),
    );
  }
}

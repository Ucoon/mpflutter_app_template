import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widget/widget.dart';
import '../index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayoutPage<HomeController>(
      _buildBodyWidget,
      canBack: false,
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    return Center(
      child: Text(
        'home'.tr,
      ),
    );
  }
}

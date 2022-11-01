import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widget/widget.dart';
import '../index.dart';

class ClassifyPage extends GetView<ClassifyController> {
  const ClassifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayoutPage<ClassifyController>(
      _buildBodyWidget,
      canBack: false,
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    return Center(
      child: Text(
        'classify'.tr,
      ),
    );
  }
}

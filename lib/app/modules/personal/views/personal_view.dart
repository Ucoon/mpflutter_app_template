import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widget/widget.dart';
import '../index.dart';

class PersonalPage extends GetView<PersonalController> {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayoutPage<PersonalController>(
      _buildBodyWidget,
      canBack: false,
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    return Center(
      child: Text(
        'personal'.tr,
      ),
    );
  }
}

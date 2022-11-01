import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpcore/mpkit/mpkit.dart';
import '../../../../widget/widget.dart';
import '../index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayoutPage<WelcomeController>(
      _buildBodyWidget,
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    return Container(
      color: const Color(0xFFFF584F),
      child: Stack(
        children: [
          Center(
            child: _buildImage(),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return MPIcon(
      MaterialIcons.settings_applications_outlined,
      size: 48,
      color: Colors.white54,
    );
  }
}

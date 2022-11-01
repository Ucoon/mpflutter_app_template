import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mpcore/mpkit/mpkit.dart';
import '../../../../common/values/values.dart';

MPAppBar buildAppBar(
  BuildContext context,
  String text, {
  double fontSize = 18.0,
  Widget? subTitle,
  Widget? leading,
  Widget? titleIcon,
  Widget? trailing,
  Color backgroundColor = Colors.white,
  Color titleColor = const Color(0xFF373737),
  bool canBack = true,
  double appBarHeight = 48,
  VoidCallback? onBackClick,
}) {
  return MPAppBar(
    context: context,
    appBarHeight: appBarHeight,
    backgroundColor: backgroundColor,
    leading: canBack
        ? leading ?? DefaultAppBarLeadingWidget(onBackClick: onBackClick)
        : null,
    trailing: trailing,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        titleIcon ?? const SizedBox(),
        Flexible(
          child: Padding(
            padding:
                titleIcon == null ? EdgeInsets.zero : EdgeInsets.only(left: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: titleColor,
                    fontWeight: boldFont,
                  ),
                ),
                subTitle ?? const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class DefaultAppBarLeadingWidget extends StatelessWidget {
  final VoidCallback? onBackClick;
  const DefaultAppBarLeadingWidget({
    Key? key,
    this.onBackClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 44,
      width: 44,
      child: GestureDetector(
        child: MPIcon(
          MaterialIcons.arrow_forward_ios_round,
          size: 16,
          color: const Color(0xFFA3A3A3),
        ),
        onTap: () {
          onBackClick != null ? onBackClick!.call() : Get.back();
        },
      ),
    );
  }
}

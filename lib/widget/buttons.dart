import 'package:flutter/material.dart';
import '../common/values/values.dart';

/// 灰色边框按钮
class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? prefix;
  final Color? color;
  final double fontSize;
  final EdgeInsets? padding;
  final Color textColor;
  final Color textColorDisabled;
  final BorderRadiusGeometry? borderRadius;
  final Color borderColor;
  const SecondaryButton(
    this.label,
    this.onPressed, {
    Key? key,
    this.prefix,
    this.color,
    this.fontSize = fontSize14,
    this.textColor = const Color(0xFF40414C),
    this.textColorDisabled = const Color(0xFFACACAC),
    this.borderColor = const Color(0xFFD2D2D2),
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: borderRadius ?? borderRadius6,
        border: Border.all(color: borderColor, width: 1),
      ),
      child: GestureDetector(
        onTap: () {
          onPressed?.call();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            prefix ?? Container(),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                color: color ??
                    (onPressed == null ? textColorDisabled : textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

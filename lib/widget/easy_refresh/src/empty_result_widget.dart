import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget.dart';

class EmptyResultWidget extends StatelessWidget {
  final String icon;
  final String text;
  final double? iconWidth;
  final double? iconHeight;
  final bool showReload;
  final VoidCallback? onReload;

  const EmptyResultWidget({
    Key? key,
    required this.icon,
    this.text = '',
    this.iconWidth = 142,
    this.iconHeight = 110,
    this.showReload = false,
    this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            getIconPngWithSize(
              icon,
              width: iconWidth,
              height: iconHeight,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 30.5,
            ),
            Text(
              showReload ? 'reload_hint'.tr : text,
              style: TextStyle(
                color: const Color(0xFF999999),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            showReload
                ? SizedBox(
                    width: 124,
                    height: 44,
                    child: SecondaryButton(
                      'reload'.tr,
                      onReload,
                      padding: EdgeInsets.zero,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

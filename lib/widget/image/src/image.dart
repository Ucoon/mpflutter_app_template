import 'package:flutter/material.dart';

///图片加载工具类

Widget getDefaultPlaceHolderWidget({
  double width = 64,
  double height = 64,
  String placeholder = 'icon_place_logo',
}) {
  return Container(
    width: width,
    height: height,
    color: const Color(0xFFE0E2E6),
    alignment: Alignment.center,
    child: Image.asset(
      'assets/images/$placeholder.png',
    ),
  );
}

Widget getIconByPackageName(
  url, {
  double width = 64,
  double height = 64,
  String suffix = 'png',
  String? packageName,
}) {
  return Image.asset(
    'assets/images/$url.$suffix',
    width: width,
    height: height,
    fit: BoxFit.cover,
    package: packageName,
  );
}

Widget getIconPng(
  String url, {
  double iconSize = 64.0,
}) {
  return getIcon(url, "png", iconSize: iconSize);
}

Widget getIconJpg(String url, {double iconSize = 64.0}) {
  return getIcon(url, "jpg", iconSize: iconSize);
}

Widget getIcon(String url, String suffix, {double iconSize = 64.0}) {
  return Image.asset(
    'assets/images/$url.$suffix',
    width: iconSize,
    height: iconSize,
    // fit: BoxFit.cover,
  );
}

Widget getIconPngWithSize(String url,
    {double? width = 64, double? height = 64, BoxFit? fit}) {
  return getIconWithSize(url, 'png', width: width, height: height, fit: fit);
}

Widget getIconWithSize(String url, String suffix,
    {double? width = 64, double? height = 64, BoxFit? fit}) {
  return Image.asset(
    'assets/images/$url.$suffix',
    width: width,
    height: height,
    fit: fit,
    // fit: BoxFit.cover,
  );
}

AssetImage getAssetImage(
  String url, {
  String suffix = 'png',
}) {
  return AssetImage('assets/images/$url.$suffix');
}

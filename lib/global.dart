import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiver/strings.dart';
import 'common/utils/utils.dart';
import 'common/values/values.dart';

/// 全局静态数据
class Global {
  /// 是否离线登录
  static bool isOfflineLogin = true;

  /// 是否第一次打开
  static bool isFirstOpen = true;

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    // 本地存储初始化
    await StorageUtil().init();
    // 读取设备第一次打开
    isFirstOpen =
        StorageUtil().getBool(storageDeviceFirstOpenKey, defValue: true);

    var _token = StorageUtil().getJSON(storageTokenKey);
    if (!isBlank(_token)) {
      isOfflineLogin = false;
    }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    print('Global.init saveAppLocale');
    var _locale = LocaleUtil.getAppLocale();
    if (isBlank(_locale)) {
      LocaleUtil.saveAppLocale(const Locale('zh', 'HK'));
    }
  }

  ///保存token
  static saveUserToken(String token) async {
    StorageUtil().putJSON(storageTokenKey, token);
    isOfflineLogin = isBlank(token);
  }

  static String getUserToken() {
    return StorageUtil().getJSON(storageTokenKey) ?? '';
  }

  /// 保存用户已打开APP
  static saveAlreadyOpen() {
    StorageUtil().putBool(storageDeviceFirstOpenKey, false);
  }

  ///用户退出
  static void logout() {}
}

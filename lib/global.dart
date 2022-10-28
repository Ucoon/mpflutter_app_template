import 'package:quiver/strings.dart';
import 'common/utils/utils.dart';
import 'common/values/values.dart';

/// 全局静态数据
class Global {
  /// 是否离线登录
  static bool isOfflineLogin = true;

  ///保存token
  static saveUserToken(String token) async {
    StorageUtil().putJSON(storageTokenKey, token);
    isOfflineLogin = isBlank(token);
  }

  static String getUserToken() {
    return StorageUtil().getJSON(storageTokenKey) ?? '';
  }

  ///用户退出
  static void logout() {}
}

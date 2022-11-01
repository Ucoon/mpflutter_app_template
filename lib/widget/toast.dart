import 'package:mpcore/mpcore.dart';

void toastInfo({
  required String msg,
  Duration duration = const Duration(milliseconds: 1500),
  bool dismissOnTap = false,
}) async {
  MPWebDialogs.showToast(
    title: msg,
    mask: dismissOnTap,
    duration: duration,
  );
}

void dismiss() {
  MPWebDialogs.hideToast();
}

void showLoading({String status = '加载中...'}) {
  MPWebDialogs.showLoading(title: status);
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'app/routes/app_pages.dart';
import 'common/utils/utils.dart';
import 'global.dart';
import 'initial_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  //强制竖屏
  StatusBarKit.setPortrait().then((_) {
    runApp(const MyApp());
    MPCore().connectToHostChannel();
  });
}

Future<void> initServices() async {
  debugPrint('starting services ...');
  await Global.init();
  debugPrint('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMPApp(
      title: '开发模板',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      enableLog: true, // 日志
      logWriterCallback: Logger.write,
      getPages: AppPages.routes, // 路由
      navigatorObservers: [MPCore.getNavigationObserver()],
      initialRoute: AppPages.initial, // 启动页面
      initialBinding: InitialBinding(),
      builder: (context, widget) {
        return MediaQuery(
          ///设置文字大小不随系统设置改变
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget ?? SizedBox(),
        );
      },
    );
  }
}

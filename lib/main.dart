import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'app/routes/app_pages.dart';
import 'common/langs/translation_service.dart';
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
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      enableLog: true, // 日志
      logWriterCallback: Logger.write,
      getPages: AppPages.routes, // 路由
      navigatorObservers: [MPCore.getNavigationObserver()],
      initialRoute: AppPages.initial, // 启动页面
      initialBinding: InitialBinding(),
      // locale: TranslationService.locale, //刚进入App时，默认显示语言
      // fallbackLocale: TranslationService.fallbackLocale, //语言选择无效时，备用语言
      // translations: TranslationService(), //配置显示国际化内容
      builder: (context, widget) {
        return MediaQuery(
          ///设置文字大小不随系统设置改变
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget ?? SizedBox(),
        );
      },
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   //一定要配置,否则iphone手机长按编辑框有白屏卡着的bug出现
      // ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
    );
  }
}

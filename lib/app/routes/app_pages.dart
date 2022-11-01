import 'package:get/get.dart';
import '../modules/tab/index.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = Routes.initial;

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.initial,
      page: () => const TabHomePage(),
      binding: TabHomeBinding(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:mpcore/mpkit/mpkit.dart';
import '../../../../global.dart';
import '../index.dart';

class TabHomeController extends GetxController {
  final state = TabState();

  late MPMainTabController pageController;

  handleNavBarTap(int index) {
    if (index == state.page) return;
    // if (Global.isOfflineLogin && index != 0) {
    //   // Get.toNamed(Routes.login('tab'));
    //   return;
    // }
    handlePageChanged(index);
    pageController.jumpToPage(index);
  }

  handlePageChanged(int page) {
    state.page = page;
  }

  @override
  void onInit() {
    super.onInit();
    pageController = MPMainTabController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

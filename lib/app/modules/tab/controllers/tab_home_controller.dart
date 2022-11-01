import 'package:get/get.dart';
import 'package:mpcore/mpkit/mpkit.dart';
import '../index.dart';

class TabHomeController extends GetxController {
  final state = TabState();

  late MPMainTabController pageController;

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

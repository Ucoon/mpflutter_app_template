import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpcore/mpkit/mpkit.dart';
import '../../classify/index.dart';
import '../../global/index.dart';
import '../../home/index.dart';
import '../../personal/index.dart';
import '../index.dart';

class TabHomePage extends StatefulWidget {
  const TabHomePage({Key? key}) : super(key: key);
  @override
  State<TabHomePage> createState() => TabHomePageState();
}

class TabHomePageState extends State<TabHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TabHomeController get controller => Get.find<TabHomeController>();

  @override
  Widget build(BuildContext context) {
    return MPMainTabView(
      tabs: _createMPMainTabItems(),
      controller: controller.pageController,
      keepAlive: true,
      tabBarBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _createTabBarWidget(
            index,
            onTap: controller.handleNavBarTap,
          ),
        );
      },
    );
  }

  List<MPMainTabItem> _createMPMainTabItems() {
    return <MPMainTabItem>[
      MPMainTabItem(
        activeTabWidget: _buildTabWidget(
          icon: MaterialIcons.home,
          title: 'tab_home'.tr,
          active: true,
        ),
        inactiveTabWidget: _buildTabWidget(
          icon: MaterialIcons.home,
          title: 'tab_home'.tr,
          active: false,
        ),
        builder: (context) => HomePage(),
      ),
      MPMainTabItem(
        activeTabWidget: _buildTabWidget(
          icon: MaterialIcons.settings_outlined,
          title: 'tab_global_purchasing'.tr,
          active: true,
        ),
        inactiveTabWidget: _buildTabWidget(
          icon: MaterialIcons.settings_outlined,
          title: 'tab_global_purchasing'.tr,
          active: false,
        ),
        builder: (context) => GlobalPurchasingPage(),
      ),
      MPMainTabItem(
        activeTabWidget: _buildTabWidget(
          icon: MaterialIcons.add_alarm,
          title: 'tab_cash'.tr,
          active: true,
        ),
        inactiveTabWidget: _buildTabWidget(
          icon: MaterialIcons.add_alarm,
          title: 'tab_cash'.tr,
          active: false,
        ),
        builder: (context) => ClassifyPage(),
      ),
      MPMainTabItem(
        activeTabWidget: _buildTabWidget(
          icon: MaterialIcons.person_outline,
          title: 'tab_personal'.tr,
          active: true,
        ),
        inactiveTabWidget: _buildTabWidget(
          icon: MaterialIcons.person_outline,
          title: 'tab_personal'.tr,
          active: false,
        ),
        builder: (context) => PersonalPage(),
      ),
    ];
  }

  List<Widget> _createTabBarWidget(
    int index, {
    Function? onTap,
  }) {
    return <Widget>[
      _buildTabWidget(
        icon: MaterialIcons.home,
        title: 'tab_home'.tr,
        active: index == 0,
        onTap: () {
          onTap?.call(0);
        },
      ),
      _buildTabWidget(
        icon: MaterialIcons.settings_outlined,
        title: 'tab_global_purchasing'.tr,
        active: index == 1,
        onTap: () {
          onTap?.call(1);
        },
      ),
      _buildTabWidget(
        icon: MaterialIcons.add_alarm,
        title: 'tab_cash'.tr,
        active: index == 2,
        onTap: () {
          onTap?.call(2);
        },
      ),
      _buildTabWidget(
        icon: MaterialIcons.person_outline,
        title: 'tab_personal'.tr,
        active: index == 3,
        onTap: () {
          onTap?.call(3);
        },
      ),
    ];
  }

  Widget _buildTabWidget({
    required String icon,
    required String title,
    bool active = false,
    GestureTapCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          MPIcon(
            icon,
            color: active ? Colors.blue : Colors.grey,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: active ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

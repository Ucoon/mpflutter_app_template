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
    );
  }

  List<MPMainTabItem> _createMPMainTabItems() {
    return <MPMainTabItem>[
      MPMainTabItem(
        activeTabWidget: _buildTabWidget(
          icon: MaterialIcons.home,
          title: 'HOME',
          active: true,
        ),
        inactiveTabWidget: _buildTabWidget(
          icon: MaterialIcons.home,
          title: 'HOME',
          active: false,
        ),
        builder: (context) => HomePage(),
      ),
      MPMainTabItem(
        activeTabWidget: _buildTabWidget(
          icon: MaterialIcons.settings_outlined,
          title: '全球购',
          active: true,
        ),
        inactiveTabWidget: _buildTabWidget(
          icon: MaterialIcons.settings_outlined,
          title: '全球购',
          active: false,
        ),
        builder: (context) => GlobalPurchasingPage(),
      ),
      MPMainTabItem(
        activeTabWidget: _buildTabWidget(
          icon: MaterialIcons.add_alarm,
          title: '领现金',
          active: true,
        ),
        inactiveTabWidget: _buildTabWidget(
          icon: MaterialIcons.add_alarm,
          title: '领现金',
          active: false,
        ),
        builder: (context) => ClassifyPage(),
      ),
      MPMainTabItem(
        activeTabWidget: _buildTabWidget(
          icon: MaterialIcons.person_outline,
          title: '我的',
          active: true,
        ),
        inactiveTabWidget: _buildTabWidget(
          icon: MaterialIcons.person_outline,
          title: '我的',
          active: false,
        ),
        builder: (context) => PersonalPage(),
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

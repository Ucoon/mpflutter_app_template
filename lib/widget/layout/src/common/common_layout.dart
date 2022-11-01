import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpcore/mpkit/mpkit.dart';
import '../../../../app/base/base_body_widget.dart';
import '../../../../app/base/controller/base_controller.dart';
import 'app_bar.dart';

class CommonLayoutPage<T extends BaseController> extends StatelessWidget {
  const CommonLayoutPage(
    this.body, {
    Key? key,
    this.title = '',
    this.canBack = true,
    this.fontSize = 18,
    this.appBarHeight = 48,
    this.margin = EdgeInsets.zero,
    this.backgroundColor = Colors.white,
    this.appBarBackgroundColor = Colors.white,
    this.titleColor = const Color(0xFF373737),
    this.bottomBarWithSafeArea = true,
    this.subTitle,
    this.titleIcon,
    this.trailing,
    this.appBarLeading,
    this.onBack,
    this.bottomBar,
    this.onLeaveConfirm,
    this.emptyIcon,
    this.emptyText,
    this.netErrorIcon,
    this.onReload,
    this.appBarHintColor,
    this.onRefresh,
    this.onPageScroll,
    this.onReachBottom,
    this.onWechatMiniProgramShareAppMessage,
    this.floatingBody,
    this.bottomBarSafeAreaColor,
  }) : super(key: key);

  final String title;
  final Color titleColor;
  final Color? appBarHintColor;
  final Color backgroundColor;
  final Color appBarBackgroundColor;
  final Color? bottomBarSafeAreaColor;
  final Widget Function(BuildContext ctx) body;
  final Widget Function()? appBarLeading;
  final Widget? trailing;
  final Widget? bottomBar;
  final EdgeInsetsGeometry margin;
  final VoidCallback? onBack;
  final WillPopCallback? onLeaveConfirm;
  final Widget? subTitle;
  final Widget? titleIcon;
  final bool canBack;
  final String? emptyIcon;
  final String? emptyText;
  final String? netErrorIcon;
  final VoidCallback? onReload;
  final bool bottomBarWithSafeArea;
  final Widget? floatingBody;
  final double appBarHeight;
  final double fontSize;
  final Function? onRefresh;
  final Function(double)? onPageScroll;
  final Function? onReachBottom;
  final Future<MPWechatMiniProgramShareInfo> Function(
    MPWechatMiniProgramShareRequest request,
  )? onWechatMiniProgramShareAppMessage;

  Widget _buildBody(BuildContext context, {VoidCallback? onBackConfirm}) {
    return MPScaffold(
      name: title,
      appBarColor: appBarBackgroundColor,
      appBarTintColor: appBarHintColor,
      backgroundColor: backgroundColor,
      bottomBar: bottomBar,
      bottomBarSafeAreaColor: bottomBarSafeAreaColor,
      bottomBarWithSafeArea: bottomBarWithSafeArea,
      floatingBody: floatingBody,
      onRefresh: onRefresh,
      onPageScroll: onPageScroll,
      onReachBottom: onReachBottom,
      onWechatMiniProgramShareAppMessage: onWechatMiniProgramShareAppMessage,
      appBar: buildAppBar(
        context,
        title,
        subTitle: subTitle,
        titleIcon: titleIcon,
        trailing: trailing,
        leading: canBack ? appBarLeading?.call() : null,
        onBackClick: onBack ?? onBackConfirm,
        backgroundColor: appBarBackgroundColor,
        canBack: canBack,
        appBarHeight: appBarHeight,
        titleColor: titleColor,
        fontSize: fontSize,
      ),
      body: SafeArea(
        bottom: bottomBarWithSafeArea,
        child: Container(
          color: backgroundColor,
          margin: margin,
          child: BaseBodyWidget<T>(
            body(context),
            emptyIcon: emptyIcon,
            emptyText: emptyText,
            netErrorIcon: netErrorIcon,
            onReload: onReload,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (onLeaveConfirm == null) {
      return _buildBody(context);
    }
    return WillPopScope(
      child: _buildBody(
        context,
        onBackConfirm: () async {
          final confirm = await onLeaveConfirm!();
          if (confirm) {
            Get.back();
          }
        },
      ),
      onWillPop: onLeaveConfirm,
    );
  }
}

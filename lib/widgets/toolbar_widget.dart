import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/util/app_colors.dart';
import 'package:flutter_template/util/scale_ui_utils.dart';

import '../router.dart';
import 'text_widget.dart';

enum ThemeColor { white, black }

class ToolbarWidget extends StatelessWidget {
  ThemeColor themeColor;
  String title;
  double opacity;
  bool showBackBtn;
  bool isImageLocal;
  bool isWhiteScreen;
  bool isSettingsPage;
  bool showIcons;

  ToolbarWidget(
      {this.themeColor = ThemeColor.white,
      this.showBackBtn = true,
      this.title = "",
      this.isSettingsPage = false,
      this.showIcons = true,});

  @override
  Widget build(BuildContext context) {
    return Container(
        //margin: EdgeInsets.only(top: 10),
        color: (themeColor == ThemeColor.white)
            ? AppColors.primaryLightColor
            : Colors.transparent,
        width: double.infinity,
        height: ScreenUtil().setHeight(ScreenUtil.toolbarHeight),
        child: Stack(
          children: <Widget>[
            if (showBackBtn)
              IconButton(
                icon: ImageIcon(
                  AssetImage("assets/images/back_btn.png"),
                  color: getColor(),
                  size: ScreenUtil().setHeight(21),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    TextWidget(
                      title,
                      styles: TextStyles.toolbar,
                      color: (themeColor == ThemeColor.white)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ],
                )),
            if(showIcons)
            Container(
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Padding(
                          padding:
                              EdgeInsets.only(right: ScreenUtil().setWidth(15)),
                          child: SvgPicture.asset(
                            "assets/images/svg/icons/toolbar_alarm.svg",
                            color: getColor(),
                            width: ScreenUtil().setWidth(21),
                          )),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Padding(
                          padding:
                              EdgeInsets.only(right: ScreenUtil().setWidth(15)),
                          child: SvgPicture.asset(
                            "assets/images/svg/icons/toolbar_ask.svg",
                            color: getColor(),
                            width: ScreenUtil().setWidth(21),
                          )),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Padding(
                          padding:
                              EdgeInsets.only(right: ScreenUtil().setWidth(15)),
                          child: SvgPicture.asset(
                            "assets/images/svg/icons/toolbar_menu.svg",
                            color: getColor(),
                            width: ScreenUtil().setWidth(21),
                          )),
                      onTap: () {
//                        if (!isSettingsPage)
//                          Router.showSettingsScreen(context);
                      },
                    ),
                  ],
                )),
          ],
        ));
  }

  Color getColor() {
    if (themeColor == ThemeColor.white)
      return Colors.white;
    else
      return Colors.black;
  }
}

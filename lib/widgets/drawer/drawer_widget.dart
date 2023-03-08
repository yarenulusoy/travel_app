import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/view/home_view.dart';
import '../../core/app/application_constant.dart';
import '../../core/base/base_state.dart';
import '../../core/widget/listtile/drawer_listtile.dart';
import '../auto_size_text/auto_size_text_widget.dart';
import '../constant/icons/icon_path.dart';

class DrawerWidget extends StatelessWidget with BaseState {
  DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: context.dynamicWidth(0.65),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeTextWidget(
                      title: AppConstant.APP_NAME,
                      maxLines: 1,
                      style: textThemeLight.headline4.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
              DrawerListTileWidget(title: "Anasayfa", iconPath: _tabBarIcon[0],page: "/home"),
              DrawerListTileWidget(title: "Profilim", iconPath: _tabBarIcon[1],page: "/profile"),
              DrawerListTileWidget(title: "Gezdiğim Yerler", iconPath: _tabBarIcon[2],page: "/my_post",),
              DrawerListTileWidget(title: "Favorilerim", iconPath: _tabBarIcon[3],page: "/favorite",)
            ],
          ),
        ));
  }
}

class DrawerListTileWidget extends StatelessWidget with BaseState {
  DrawerListTileWidget({super.key, required this.title,  required this.page, required this.iconPath});
  String page;
  String title;
  IconData iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.dynamicWidth(0.5),
        decoration:
            BoxDecoration(color: colorThemeLight.periwinkle, borderRadius: context.radiusNormal),
        margin: paddingConstants.paddingAll10,
        child: DrawerListTile(
          contentPadding: paddingConstants.paddingHorizontal15,
          title: AutoSizeTextWidget(title: title),
          leading: Icon(iconPath, size: context.dynamicWidth(0.055)),
          onTap: () {
            Navigator.pushNamed(context,page);
          },
          selectedColor: Colors.white,
          selectedTileColor: Colors.white,
        ));
  }
}

var _tabBarIcon = [
  IconsConstant.HOME_ICON,
  IconsConstant.PROFILE_ICON,
  IconsConstant.SAVE_ICON,
  IconsConstant.FAVORITE_ICON
];

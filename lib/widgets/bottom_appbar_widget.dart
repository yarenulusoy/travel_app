import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'constant/icons/icon_path.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 0,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 70,
        child: TabBar(
          tabs: TabBarIcon.values
              .map((e) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Icon(
                          _tabBarIcon[e.index],
                          size: context.dynamicWidth(0.045),
                        ),
                      )),
                      Expanded(
                          child: Tab(
                        text: e.name,
                      )),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

enum TabBarIcon {Anasayfa ,Paylas, Favorilerim , Profil }

var _tabBarIcon = [
  IconsConstant.HOME_ICON,
  IconsConstant.LOCATION_ADD_ICON,
  IconsConstant.HEART_ICON,
  IconsConstant.PROFILE_ICON,
];

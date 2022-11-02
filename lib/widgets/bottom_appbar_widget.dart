import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _TabBarIcon.values.length,
      child: Scaffold(
        extendBody: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(onPressed: () {},child: Icon(Icons.add),),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 0,
          color: Colors.blueGrey,
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 80,
            child: TabBar(
              tabs: _TabBarIcon.values
                  .map((e) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Icon(_tabBarIcon[e.index]),
                          )),
                          Expanded(
                              child: Tab(
                            text: '${e.name}',
                          )),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.white,
            ),
            Text("Deneme"),
            Container(
              color: Colors.red,
            ),
            Text("Deneme"),
          ],
        ),
      ),
    );
  }
}

enum _TabBarIcon { Home, Search, Save, Profile }

var _tabBarIcon = [
  Icons.add,
  Icons.account_balance,
  Icons.add_business,
  Icons.account_box
];

final List<Widget> _screens = [
  Container(
    color: Colors.white,
  ),
  Text("Deneme"),
  Container(
    color: Colors.red,
  ),
  Text("Deneme")
];

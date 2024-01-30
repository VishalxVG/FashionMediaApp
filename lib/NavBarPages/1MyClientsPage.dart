// ignore_for_file: file_names

import 'package:fashion_app/Modules/gridInfo.dart';
import 'package:fashion_app/components/gridTile.dart';
import 'package:flutter/material.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  List<GridInfo> gridInfo = [];

  void _getGridInfo() {
    gridInfo = GridInfo.getGrids();
  }

  @override
  Widget build(BuildContext context) {
    _getGridInfo();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            _userInfoBox(),
            const SizedBox(
              height: 20,
            ),
            _userConfigBox(),
          ],
        ),
      ),
    );
  }

  Expanded _userConfigBox() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: GridView.builder(
          itemCount: gridInfo.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return MyGridTile(
              index: index,
              title: gridInfo[index].title,
              iconPath: gridInfo[index].iconPath,
            );
          },
        ),
      ),
    );
  }

  SafeArea _userInfoBox() {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[400],
        ),
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/account.png",
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "UserName",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 60, top: 20, right: 30, bottom: 50),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Closet",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        size: 50,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Add Now",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

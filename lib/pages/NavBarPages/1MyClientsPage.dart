// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:fashion_app/Modules/gridInfo.dart';
import 'package:fashion_app/components/UI%20components/gridTile.dart';
import 'package:fashion_app/components/utils/UserData.dart';
import 'package:fashion_app/components/utils/provider/UserProvider.dart';
import 'package:fashion_app/services/auth/authServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  final authService = AuthServices();
  List<GridInfo> gridInfo = [];

  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

  void _getGridInfo() {
    gridInfo = GridInfo.getGrids();
  }

  @override
  Widget build(BuildContext context) {
    UserData? userData = Provider.of<UserProvider>(context).getUser;

    _getGridInfo();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Closet'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
              onPressed: () {
                authService.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(userData!.photoUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 40),
                      child: Text(
                        "Hi ${userData.userName}",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    )
                  ],
                ),
                collapseMode: CollapseMode.pin,
                expandedTitleScale: 2,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.all(8)),
            const SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Closet",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.add_circle_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Add OutFit"),
                    ],
                  )
                ],
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 10, bottom: 8)),
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 3.1,
              ),
              itemBuilder: (context, index) {
                return MyGridTile(
                  index: index,
                  title: gridInfo[index].title,
                  iconPath: gridInfo[index].iconPath,
                );
              },
              itemCount: gridInfo.length,
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 10, bottom: 8)),
            // SliverToBoxAdapter(
            //   child: ListView.builder(
            //     itemBuilder: (context, index) {
            //       return MyGridTile(
            //         index: index,
            //         title: gridInfo[index].title,
            //         iconPath: gridInfo[index].iconPath,
            //       );
            //     },
            //     itemCount: gridInfo.length,
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  SafeArea _userInfoBox() {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 159, 190, 239),
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

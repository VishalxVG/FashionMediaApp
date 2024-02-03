// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:fashion_app/Modules/gridInfo.dart';

import 'package:fashion_app/components/utils/UserData.dart';

import 'package:fashion_app/pages/addImagePage.dart';
import 'package:fashion_app/services/provider/UserProvider.dart';
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
    UserProvider? _userProvider =
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
    return userData != null
        ? Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: Text(
                'Closet',
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              actions: [
                IconButton(
                    onPressed: () {
                      authService.signOut();
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.secondary,
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _userInfoBox(userData),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Your Closet",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            try {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddImagePage(),
                                ),
                              );
                            } catch (e) {
                              print('Error navigating to AddImagePage: $e');
                            }
                          },
                          style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.amber)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.add),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Add New"),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(),
                  ],
                ),
              ),
            ),
          )
        : const CircularProgressIndicator();
  }

  Container _userInfoBox(UserData? userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 239, 191, 123),
      ),
      height: 200,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 64,
            backgroundImage: NetworkImage(userData!.photoUrl),
          ),
          const SizedBox(height: 15),
          Text(
            "Hi ${userData.userName}",
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

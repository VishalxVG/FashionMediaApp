// ignore_for_file: use_key_in_widget_constructors

import 'package:fashion_app/pages/NavBarPages/5ChatPage.dart';
import 'package:fashion_app/pages/NavBarPages/3DiscoverPage.dart';
import 'package:fashion_app/pages/NavBarPages/2GroupsPage.dart';
import 'package:fashion_app/pages/NavBarPages/1MyClientsPage.dart';
import 'package:fashion_app/pages/NavBarPages/4SharedPage.dart';
import 'package:fashion_app/components/UI%20components/CustomBottomNavBar.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const ClientsPage(),
        const GroupPage(),
        const DiscoverPage(),
        const SharedPage(),
        const ChatPage(),
      ][currentPageIndex],
      bottomNavigationBar: CustomNavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        currentPageIndex: currentPageIndex,
      ),
    );
  }
}

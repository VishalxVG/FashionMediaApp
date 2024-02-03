import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amberAccent[100],
      width: 150,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: const Text('Suggested'),
              onTap: () {
                // Handle Suggested tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Followers'),
              onTap: () {
                // Handle Followers tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Following'),
              onTap: () {
                // Handle Following tap
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}

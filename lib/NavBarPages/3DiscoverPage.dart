import 'package:fashion_app/components/UI%20components/customDrawer.dart';
import 'package:fashion_app/components/UI%20components/postCard.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.amber),
        title: const Text(
          "Discover",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: const PostCard(),
    );
  }
}

import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final Function(int) onDestinationSelected;

  const CustomNavigationBar({
    Key? key,
    required this.currentPageIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      animationDuration: const Duration(milliseconds: 1000),
      selectedIndex: currentPageIndex,
      backgroundColor: Colors.grey[300],
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(Icons.person_4),
          icon: Icon(Icons.person_4_outlined),
          label: 'My Client',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.groups_3),
          icon: Icon(Icons.groups_3_outlined),
          label: 'Groups',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Discover',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.share),
          icon: Icon(Icons.share_outlined),
          label: 'Shared',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.chat_bubble),
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chat',
        ),
      ],
    );
  }
}

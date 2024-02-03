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
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      onDestinationSelected: onDestinationSelected,
      animationDuration: const Duration(milliseconds: 1000),
      selectedIndex: currentPageIndex,
      indicatorColor: Colors.transparent,
      height: 60,
      backgroundColor: Theme.of(context).colorScheme.background,
      destinations: [
        NavigationDestination(
          selectedIcon: Icon(
            Icons.person_4,
            color: Theme.of(context).colorScheme.secondary,
          ),
          icon: const Icon(
            Icons.person_4_outlined,
            color: Colors.white,
          ),
          label: "",
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.groups_3,
            color: Theme.of(context).colorScheme.secondary,
          ),
          icon: const Icon(Icons.groups_3_outlined, color: Colors.white),
          label: 'Groups',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.secondary,
          ),
          icon: const Icon(Icons.home_outlined, color: Colors.white),
          label: 'Discover',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.share,
            color: Theme.of(context).colorScheme.secondary,
          ),
          icon: const Icon(Icons.share_outlined, color: Colors.white),
          label: 'Shared',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.chat_bubble,
            color: Theme.of(context).colorScheme.secondary,
          ),
          icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
          label: 'Chat',
        ),
      ],
    );
  }
}

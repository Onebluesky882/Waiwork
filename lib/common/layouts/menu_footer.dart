import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuFooter extends StatelessWidget {
  final String path;
  final String menuName;
  final String currentLocation;
  final IconData icon;

  const MenuFooter({
    super.key,
    required this.currentLocation,
    required this.path,
    required this.menuName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(path),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentLocation == path ? Colors.blue : Colors.grey,
          ),
          Text(menuName),
        ],
      ),
    );
  }
}

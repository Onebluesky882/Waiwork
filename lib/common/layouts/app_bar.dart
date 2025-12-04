import 'package:flutter/material.dart';
import 'package:flutter_projects/common/widgets/appBar/right_menu.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('WaiWork', style: TextStyle(fontWeight: FontWeight.normal)),
        ],
      ),

      // Left side icon (leading)
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),

      // Right menu
      actions: const [RightMenu()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/features/home/controllers/parent_child.dart';
import 'package:flutter_projects/features/home/widgets/right_menu.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('WorkDee', style: TextStyle(fontWeight: FontWeight.normal)),
          ],
        ),

        // Left side icon (leading)
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),

        // Right menu
        actions: const [RightMenu()],
      ),

      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Container(color: Colors.blue, height: 50),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(color: Colors.green, height: 50),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(width: 100, height: 100, color: Colors.red),
                    Container(width: 60, height: 60, color: Colors.green),
                    Positioned(
                      top: 70,
                      left: 50,
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const StateParent(),
              ],
            ),
          ),
          Positioned(
            left: 28,
            right: 28,
            bottom:
                MediaQuery.of(context).padding.bottom - 16, // ✅ ปลอดภัยจากขอบจอ
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      126,
                      203,
                      255,
                    ).withValues(alpha: 0.5),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () => print('Home pressed'),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () => print('Favorite pressed'),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () => print('Settings pressed'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:ui';

class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 28,
      right: 28,
      bottom: MediaQuery.of(context).padding.bottom - 16, // ✅ ปลอดภัยจากขอบจอ
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
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.white, size: 28),
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
    );
  }
}

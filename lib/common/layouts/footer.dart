import 'package:flutter/material.dart';
import 'package:flutter_projects/common/layouts/menu_footer.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.currentLocation});

  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home
          MenuFooter(
            currentLocation: currentLocation,
            menuName: 'หน้าแรก',
            path: '/',
            icon: Icons.home,
          ),
          // Soccer / Football
          MenuFooter(
            currentLocation: currentLocation,
            menuName: 'Jobs',
            path: '/job-board',
            icon: Icons.book_online,
          ),
        ],
      ),
    );
  }
}

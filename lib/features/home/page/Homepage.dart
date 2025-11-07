import 'package:flutter/material.dart';
import 'package:flutter_projects/common/constants/images.dart';
import 'package:flutter_projects/common/layouts/main.layout.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              height: 300,
              alignment: Alignment.center,
              child: Image.asset(AppImages.picTwo, fit: BoxFit.cover),
            ),
            SizedBox(width: 8), // ช่องว่างระหว่างกล่อง
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
              ),
              height: 300,
              alignment: Alignment.center,
              child: Image.asset(AppImages.picOne, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}

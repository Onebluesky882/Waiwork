import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_projects/common/constants/colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workdee')),
      body: Column(
        children: [
          Padding(
            padding: const .all(8.0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: .all(color: Colors.white),
                borderRadius: .circular(8),
                color: Theme.of(context).primaryColor,
              ),

              child: Text('data'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          color: AppColors.accentColor,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'ข้อความ',
                    hintStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              FloatingActionButton(
                onPressed: () {
                  log('adsfs');
                },
                child: Text('click'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_projects/features/home/controllers/parent_child.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          const SectionRow(),
          const SectionStack(),
          const StateParent(),
        ],
      ),
    );
  }
}

class SectionRow extends StatelessWidget {
  const SectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 3, child: Container(color: Colors.blue, height: 50)),
        Flexible(flex: 3, child: Container(color: Colors.green, height: 50)),
      ],
    );
  }
}

class SectionStack extends StatelessWidget {
  const SectionStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 100, height: 100, color: Colors.red),
        Container(width: 60, height: 60, color: Colors.green),
        Positioned(
          top: 70,
          left: 50,
          child: Container(width: 40, height: 40, color: Colors.blue),
        ),
      ],
    );
  }
}

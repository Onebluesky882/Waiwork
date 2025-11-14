import 'package:flutter/material.dart';
import 'package:flutter_projects/common/constants/colors.dart';
import 'package:flutter_projects/extensions/text_style_global.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // รอ 3 วินาที แล้วเปลี่ยนหน้า
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            AnimatedTextLine(text: 'WorkDee', delay: Duration(milliseconds: 0)),
            AnimatedTextLine(
              text: "เลือกคนที่ใช่",
              delay: Duration(milliseconds: 600),
            ),
            Center(
              child: AnimatedTextLine(
                text: 'การเงินปลอดภัย มั่นใจในระบบ',
                delay: Duration(milliseconds: 900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// AnimatedTextLine

class AnimatedTextLine extends StatefulWidget {
  final String text;
  final Duration delay;
  const AnimatedTextLine({super.key, required this.text, required this.delay});

  @override
  State<AnimatedTextLine> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AnimatedTextLine> {
  double opacity = 0;
  Offset offset = const Offset(
    0,
    0.5,
  ); // เริ่มจากล่างขึ้นบน (0.5 หมายถึงเลื่อนลงเล็กน้อย)
  @override
  void initState() {
    super.initState();

    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          opacity = 1;
          offset = Offset.zero;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 800),
      opacity: opacity,
      curve: Curves.easeIn,
      child: Text(widget.text).h1.color(Colors.white),
    );
  }
}

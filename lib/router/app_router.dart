import 'package:flutter/material.dart';
import 'package:flutter_projects/features/home/page/Homepage.dart';
import 'package:flutter_projects/features/intro.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const Splash()),
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const Homepage(),
        transitionsBuilder: slide,
        transitionDuration: const Duration(milliseconds: 800),
      ),
    ),
  ],
);

Widget slide(context, animation, secondaryAnimation, child) {
  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOutQuart, // ใช้ curve ที่นุ่มและเป็นธรรมชาติ
  );

  final offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 0.25), // เลื่อนขึ้นจากล่างเล็กน้อย (ไม่กระโดด)
    end: Offset.zero,
  ).animate(curvedAnimation);
  return FadeTransition(
    opacity: curvedAnimation,
    child: SlideTransition(position: offsetAnimation, child: child),
  );
}

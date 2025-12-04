import 'package:flutter/material.dart';
import 'package:flutter_projects/common/constants/theme.dart';
import 'package:flutter_projects/employer/add_job/post-job.dart';
import 'package:flutter_projects/features/home/page/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'WorkDee',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => Scaffold(body: child),

      routes: [
        GoRoute(path: '/', builder: (context, state) => Homepage()),
        GoRoute(path: '/post-job', builder: (context, state) => PostJob()),
      ],
    ),
  ],
);

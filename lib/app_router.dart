import 'package:flutter/material.dart';
import 'package:flutter_projects/common/constants/theme.dart';
import 'package:flutter_projects/common/layouts/app_bar.dart';
import 'package:flutter_projects/common/layouts/footer.dart';
import 'package:flutter_projects/presentation/employee/job-board/job-board.dart';
import 'package:flutter_projects/homepage.dart';
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
      builder: (context, state, child) {
        final currentLocation = state.uri.toString();
        return Scaffold(
          appBar: CustomAppBar(),
          body: child,
          bottomNavigationBar: Footer(currentLocation: currentLocation),
        );
      },

      routes: [
        GoRoute(path: '/', builder: (context, state) => Homepage()),
        GoRoute(path: '/job-board', builder: (context, state) => Board()),
      ],
    ),
  ],
);

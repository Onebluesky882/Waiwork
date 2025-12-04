import 'package:flutter/material.dart';
import 'package:flutter_projects/common/constants/theme.dart';
import 'package:flutter_projects/common/layouts/appbar.dart';
import 'package:flutter_projects/common/layouts/menu_footer.dart';
import 'package:flutter_projects/employee/job-board/job-board.dart';
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

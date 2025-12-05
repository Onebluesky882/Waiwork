import 'package:flutter/material.dart';
import 'package:flutter_projects/common/constants/theme.dart';
import 'package:flutter_projects/common/layouts/app_bar.dart';
import 'package:flutter_projects/common/layouts/footer.dart';
import 'package:flutter_projects/features/auth/domain/repositories/auth_repo.dart';
import 'package:flutter_projects/presentation/auth/signup.dart';
import 'package:flutter_projects/presentation/employee/job-board/job-board.dart';
import 'package:flutter_projects/homepage.dart';
import 'package:go_router/go_router.dart';

class AppRouter extends StatelessWidget {
  final AuthRepo authRepo;

  const AppRouter({super.key, required this.authRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'WorkDee',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: _router(authRepo),
    );
  }
}

GoRouter _router(AuthRepo authRepo) => GoRouter(
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
        GoRoute(
          path: '/signup',
          builder: (context, state) => SignupPage(authRepo: authRepo),
        ),
        GoRoute(path: '/job-board', builder: (context, state) => Board()),
      ],
    ),
  ],
);

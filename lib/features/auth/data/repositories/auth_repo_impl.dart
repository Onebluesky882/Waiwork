import 'package:flutter_projects/features/auth/data/models/app_user.dart';
import 'package:flutter_projects/features/auth/domain/repositories/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseClient _supabase = Supabase.instance.client;
  @override
  Future<AppUser?> registerWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user != null) {
        return AppUser(email: email);
      }
      return null;
    } catch (e) {
      throw Exception('register failed $e');
    }
  }

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<String> sendPasswordResetEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccount() {
    throw UnimplementedError();
  }
}

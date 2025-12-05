import 'package:flutter/material.dart';
import 'package:flutter_projects/common/logger/logger.dart';
import 'package:flutter_projects/features/auth/data/models/app_user.dart';
import 'package:flutter_projects/features/auth/domain/repositories/auth_repo.dart';

class SignupPage extends StatefulWidget {
  final AuthRepo authRepo;
  const SignupPage({super.key, required this.authRepo});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  void _register() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      final AppUser? user = await widget.authRepo.registerWithEmailPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (!mounted) return; // ตรวจสอบ widget ยังอยู่
      if (user != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Welcome ${user.email}')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('register fail')));
      }
      if (user != null) {
        _formKey.currentState!.reset();
        _emailController.clear();
        _passwordController.clear();
      }
    } catch (e) {
      logs.e('signup failed : $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  //dispose() เป็น method ของ State ที่ถูกเรียกเมื่อ widget ถูกลบออกจาก widget tree
  // ใช้สำหรับ ทำความสะอาด resource ที่ไม่ต้องการใช้ต่อ

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // form must put key:_formKey global

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Enter email';
              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 2),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'password'),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) return 'enter password';
              if (value.length <= 6) return 'minimum 6 characters';
              return null;
            },
          ),
          const SizedBox(height: 2),
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _register,
                  child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                ),
        ],
      ),
    );
  }
}

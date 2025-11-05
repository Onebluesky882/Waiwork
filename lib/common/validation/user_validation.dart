import 'package:zard/zard.dart';

class UserValidator {
  static final _numberRegex = RegExp(r'^\d+$');

  static final userSchema = z.map({
    'name': z.string().min(3).nullable(),
    'age': z.string().min(1).refine((value) {
      if (!_numberRegex.hasMatch(value)) return false;
      final n = int.tryParse(value);
      if (n == null) return false;
      return n >= 1 && n <= 100;
    }),
    'phone': z
        .string()
        .min(10)
        .refine(
          (value) => _numberRegex.hasMatch(value),
          message: 'Phone must be digits only',
        )
        .refine(
          (value) => value.length == 10,
          message: 'Phone must be exactly 10 digits',
        ),
  });

  // method validate
  static Map<String, String?>? validate({
    required String name,
    required String age,
    required String phone,
  }) {
    final result = userSchema.safeParse({
      'name': name,
      'age': age,
      'phone': phone,
    });

    if (result.success) {
      return null; // no errors
    } else {
      // แปลง issues เป็น Map<String,String?>
      final errors = {
        for (final e in result.error!.issues)
          if (e.path != null) e.path!: e.message,
      };
      return errors;
    }
  }
}

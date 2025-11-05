import 'package:zard/zard.dart';

final userSchema = z
    .map({
      'name': z.string().min(3).nullable(),
      'age': z.int().min(1).nullable(),
      'phone': z.string().min(10),
    })
    .refine(
      (value) => (value['age'] ?? 0) > 18,
      message: 'Age must be greater than 18',
    );

final result = userSchema.safeParse({
  'name': 'John Doe',
  'age': 10,
  'email': '0123456789',
});

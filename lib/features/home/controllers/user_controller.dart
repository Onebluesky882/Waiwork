import 'package:flutter_projects/features/home/validation/validation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef UserFormState = ({
  String name,
  int age,
  String phone,
  Map<String, String?> errors,
});

class UserFormNotifier extends Notifier<UserFormState> {
  @override
  UserFormState build() => (age: 0, name: '', phone: '', errors: {});

  void update({String? name, int? age, String? phone}) {
    state = (
      name: name ?? state.name,
      age: age ?? state.age,
      phone: phone ?? state.phone,
      errors: state.errors,
    );
  }

  bool validate() {
    final result = userSchema.safeParse({
      'name': state.name,
      'age': state.age,
      'phone': state.phone,
    });

    if (result.success) {
      print('✅ Valid: ${result.data}');
    } else {
      print('❌ Errors: ${result.error!.issues}');
    }

    // ไม่มี error
    state = (name: state.name, age: state.age, phone: state.phone, errors: {});
    return true;
  }

  void reset() {
    state = (age: 0, name: '', phone: '', errors: {});
  }
}

final userFormProvider = NotifierProvider<UserFormNotifier, UserFormState>(
  UserFormNotifier.new,
);

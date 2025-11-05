import 'package:flutter_projects/common/validation/user_validation.dart';
import 'package:flutter_projects/features/home/type/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserFormNotifier extends Notifier<UserFormState> {
  @override
  UserFormState build() => (age: '', name: '', phone: '', errors: {});

  void update({String? name, String? age, String? phone}) {
    state = (
      name: name ?? state.name,
      age: age ?? state.age,
      phone: phone ?? state.phone,
      errors: state.errors,
    );
  }

  bool validate() {
    final errors = UserValidator.validate(
      age: state.age,
      name: state.name,
      phone: state.phone,
    );

    if (errors == null) {
      state = (
        name: state.name,
        age: state.age,
        phone: state.phone,
        errors: {},
      );

      return true;
    } else {
      state = (
        name: state.name,
        age: state.age,
        phone: state.phone,
        errors: errors,
      );
      return false;
    }
  }

  void reset() {
    state = (age: '', name: '', phone: '', errors: {});
  }
}

final userFormProvider = NotifierProvider<UserFormNotifier, UserFormState>(
  UserFormNotifier.new,
);

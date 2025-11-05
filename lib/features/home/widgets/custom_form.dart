import 'package:flutter/material.dart';
import 'package:flutter_projects/features/home/controllers/user_controller.dart';
import 'package:flutter_projects/features/home/type/index.dart';

class CustomForm extends StatelessWidget {
  final String hintText;
  final String errorText;
  final String formName;
  final void Function(String) onChanged;

  const CustomForm({
    super.key,
    required this.form,
    required this.notifier,
    required this.hintText,
    required this.errorText,
    required this.formName,
    required this.onChanged,
  });

  final UserFormState form;
  final UserFormNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        errorText: form.errors[errorText],
      ),
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: formName,
          selection: TextSelection.fromPosition(
            TextPosition(offset: formName.length),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}

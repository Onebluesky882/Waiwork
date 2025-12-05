import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> saveNote(String body) async {
  try {
    await Supabase.instance.client.from('notes').insert({'body': body});
  } catch (e) {
    throw Exception('$e');
  }
}

void showAddNewNoteDialog({
  required BuildContext context,
  required TextEditingController textController,
  required Function() onSaved,
}) {
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      content: TextField(controller: textController),
      actions: [
        TextButton(
          child: Text('save'),
          onPressed: () async {
            await saveNote(textController.text);
            await onSaved();

            if (dialogContext.mounted) {
              Navigator.pop(dialogContext);
            }
            textController.clear();
          },
        ),
      ],
    ),
  );
}

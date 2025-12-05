import 'package:flutter/material.dart';
import 'package:flutter_projects/features/api/supabase.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showAddNewNoteDialog(
          context: context,
          textController: textController,
          onSaved: () {},
        );
      },
      child: Icon(Icons.abc),
    );
  }
}

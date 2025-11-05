import 'package:flutter/material.dart';
import 'package:flutter_projects/features/home/controllers/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalState extends ConsumerWidget {
  final void Function(String) onChanged;
  const GlobalState({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(customStateProvider);
    return Column(
      children: [
        Text('Value :$text'),
        ElevatedButton(onPressed: () => onChanged(text), child: Text(text)),
      ],
    );
  }
}

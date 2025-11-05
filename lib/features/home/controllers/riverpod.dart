/* void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(home: StateParent()),
    ),
  );
} */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final textProvider = StateProvider<String>((ref) => '');

class GlobalState extends StatelessWidget {
  const GlobalState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

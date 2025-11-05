// สร้าง provider
import 'package:flutter_riverpod/legacy.dart';

// 1️⃣ provider
final textProvider = StateProvider<String>((ref) => '');

class CustomState extends StateNotifier<String> {
  CustomState() : super('');

  // getter
  String get text => state;

  // setter
  void setText(String value) => state = value;
}

final customStateProvider = StateNotifierProvider<CustomState, String>(
  (ref) => CustomState(),
);

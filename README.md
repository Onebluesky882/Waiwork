# learn flutter

💡 ระดับต่อไปที่คุณสามารถฝึกต่อได้

ตอนนี้คุณอยู่ในระดับ เข้าใจ Flutter UI และ Widget composition ได้ดีแล้ว
ขั้นต่อไปคือ:

# StatefulWidget StatelessWidget— เรียนรู้การจัดการ state ภายใน widget ✅

# State management — เช่น Riverpod ✅

## Layout system — ใช้ Row, Column, Stack, Expanded, Flexible อย่างคล่อง ✅

- Expanded พื้่นที่ว่าง ใช้ ขยาย widget ให้กิน “พื้นที่ว่างที่เหลือทั้งหมด”

ใช้เฉพาะใน Row หรือ Column เท่านั้น

- Flexible แต่ปรับแต่งได้ เหมือน Expanded แต่ ควบคุมได้ละเอียดกว่า

มีพารามิเตอร์ fit:

FlexFit.tight → เหมือน Expanded (ยืดเต็มที่)

FlexFit.loose → ยืดได้ “เท่าที่ลูกต้องการ”

📐 เหมาะเมื่ออยากให้ widget “ยืดได้แต่ไม่บังคับเต็ม”

- stack วาง object ทับกันได้

## Theming & styling — ใช้ Theme.of(context) หรือ MaterialStateProperty

MaterialStateProperty คือ วิธีกำหนดค่า style ตาม state เหล่านี้

```dart
ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.red; // กดปุ่ม -> สีแดง
      } else if (states.contains(MaterialState.disabled)) {
        return Colors.grey; // ปิดการใช้งาน -> สีเทา
      }
      return Colors.blue; // ปกติ -> สีฟ้า
    }),
    foregroundColor: MaterialStateProperty.all(Colors.white), // ข้อความสีขาว
  ),
  onPressed: () {},
  child: const Text('Press me'),
);

💡 Tip:

ถ้า style เดียวทุก state → ใช้ MaterialStateProperty.all(value)

ถ้าต้องการ state-specific → ใช้ MaterialStateProperty.resolveWith(...)
```

## Navigation & routes — ใช้ Navigator.push / go_router

Animations — เข้าใจ AnimatedContainer, Tween, AnimationController

CustomPainter / ClipPath — เพื่อสร้าง UI แบบเฉพาะตัว

## merge object

สรุปหลักการ:

Record with → copy + override field ของตัวเอง

Merge 2 record → ต้องสร้าง record ใหม่จาก field ของทั้งสอง หรือใช้ Map

```dart
void main() {
  // Record แรก
  var record1 = (id: 1, name: "Alice");

  // Record ที่สอง
  var record2 = (age: 25, city: "Bangkok");

  // Merge ทั้งสอง record
  var merged = (
    id: record1.id,
    name: record1.name,
    age: record2.age,
    city: record2.city
  );

  print(merged);
  // Output: (id: 1, name: Alice, age: 25, city: Bangkok)
}


void main() {
  var record1 = (id: 1, name: "Alice");
  var record2 = (age: 25, city: "Bangkok");

  // แปลงเป็น Map
  var map1 = {'id': record1.id, 'name': record1.name};
  var map2 = {'age': record2.age, 'city': record2.city};

  // Merge map
  var mergedMap = {...map1, ...map2};

  print(mergedMap);
  // Output: {id: 1, name: Alice, age: 25, city: Bangkok}
}


```

# Navigator พื้นฐานใน Flutter

Stack = หน้าจอที่เรียงซ้อนกัน

Push = เปิดหน้าใหม่

Pop = กลับหน้าก่อนหน้า

```dart

 onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DetailPage()),
            );
          },

  onPressed: () {
            Navigator.pop(context);
          },
```

### GoRouter

```dart
inal GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/details/:id', builder: (context, state) {
      final id = state.pathParameters['id']!;
      return DetailsScreen(id: id);
    }),
  ],
);

// ใน MaterialApp
MaterialApp.router(
  routerConfig: router,
)




final GoRouter _router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final bool loggedIn = /* ตรวจสอบจาก state หรือ provider */;
    final bool goingToLogin = state.location == '/login';
    if (!loggedIn && !goingToLogin) return '/login';
    if (loggedIn && goingToLogin) return '/';
    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (c,s) => const HomeScreen()),
    GoRoute(path: '/login', builder: (c,s) => const LoginScreen()),
    GoRoute(path: '/profile/:id', builder: (c,s) {
      final id = s.pathParameters['id']!;
      return ProfileScreen(userId: id);
    }),
    ShellRoute(
      builder: (c,s, child) => ScaffoldWithNavBar(child: child),
      routes: [
        GoRoute(path: '/dashboard', builder: (c,s) => const DashboardScreen()),
        GoRoute(path: '/settings', builder: (c,s) => const SettingsScreen()),
      ],
    ),
  ],
);

```

# get DATA api

```dart
1. สมมติ API คืน JSON แบบนี้:
[
  {"id": 1, "name": "Apple"},
  {"id": 2, "name": "Banana"},
  {"id": 3, "name": "Orange"}
]

2. สร้าง Model
class Fruit {
  final int id;
  final String name;

  Fruit({required this.id, required this.name});

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
      id: json['id'],
      name: json['name'],
    );
  }
}

3.  สร้าง FutureProvider (Riverpod) สำหรับดึง API
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/fruit.dart';

final fruitsProvider = FutureProvider<List<Fruit>>((ref) async {
  final response = await http.get(Uri.parse('https://example.com/fruits'));

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    return data.map((json) => Fruit.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load fruits');
  }
});


4. สร้าง Widget เพื่อ render list
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart'; // fruitsProvider
import 'models/fruit.dart';

class FruitsPage extends ConsumerWidget {
  const FruitsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fruitsAsync = ref.watch(fruitsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Fruits')),
      body: fruitsAsync.when(
        data: (fruits) {
          // map id => Widget
          return ListView(
            children: fruits.map((fruit) {
              return ListTile(
                key: ValueKey(fruit.id), // ใช้ id เป็น key
                title: Text(fruit.name),
              );
            }).toList(),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

ตัวอย่าง 2: ใช้ ListView.builder (ประหยัดเมมโมรี)

return ListView.builder(
  itemCount: fruits.length,
  itemBuilder: (context, index) {
    final fruit = fruits[index];
    return ListTile(
      key: ValueKey(fruit.id),
      title: Text(fruit.name),
    );
  },
);

✅ สรุปแนวคิด

แยก logic / API → FutureProvider (fruitsProvider)

ดึงข้อมูลใน widget → ref.watch(fruitsProvider)

render list → .map((item) => Widget) หรือ ListView.builder

ใช้ id เป็น key → เพื่อช่วย Flutter track widget เวลา rebuild

```

# Tip: ถ้าเจอ layout error

ใช้คำสั่งนี้ใน debug console:

debugPrintRenderTree();

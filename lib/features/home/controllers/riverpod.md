main.dart

/_ void main() {
runApp(
const ProviderScope(
child: MaterialApp(home: StateParent()),
),
);
} _/

/\*

------------------------ method State ------------------

### StateProvider : แบบง่ายๆๆ ธรรมดา เก็บค่าเล็ก ๆ ที่เปลี่ยนบ่อย ตัวแปรเดียว

final nameProvider = StateProvider<String>((\_) => '');

### NotifierProvider : ใช้เก็บ state + logic ที่ซับซ้อน (มี method, validation, async)

```dart
class NameNotifier extends Notifier<String> {
  @override
  String build() => ''; // ค่าเริ่มต้น

  void setName(String value) {
    state = value;
  }
}
final nameProvider = NotifierProvider<NameNotifier, String>(NameNotifier.new);
```

## AsyncNotifier

```dart
class UserNotifier extends AsyncNotifier<User> {
  @override
  Future<User> build() async {
    final id = ref.watch(userIdProvider);
    return fetchUser(id);
  }
}
```

ref Notifier มี ref ให้ใน class ทันที (ไม่ต้องประกาศเอง)

```dart
class CounterNotifier extends Notifier<int> {
@override
int build() {
final other = ref.watch(otherProvider);
return 0;
}
}
```

### FutureProvider คือ Provider สำหรับจัดการค่าที่มาจาก Future (async)

เช่น การ ดึงข้อมูลจาก API, อ่านไฟล์, หรือ หน่วงเวลา
โดย Riverpod จะช่วยจัดการ สถานะ (loading, success, error) ให้เราอัตโนมัติ ✅

```dart
final userNameProvider = FutureProvider<String>((ref) async {
await Future.delayed(const Duration(seconds: 2)); // จำลองดีเลย์
return 'WorkDee Developer';
});
```

### StreamProvider = ใช้ “ฟัง” ข้อมูลที่เปลี่ยนตลอดเวลา

เช่น ข้อมูลเรียลไทม์จาก Firestore, Sensor, WebSocket, หรือ Database subscription

มันจะ “subscribe” stream ให้อัตโนมัติ
และ “rebuild widget” ทุกครั้งที่มีค่าใหม่ไหลเข้ามาใน stream

ใช้คู่กับ websocket.io
final socketStreamProvider = StreamProvider<String>((ref) async\* {
final socket = await WebSocket.connect('wss://echo.websocket.org');})

# ------------------------ method State ------------------

// ✅ ใช้ Notifier (แทน StateNotifier)
class CounterNotifier extends Notifier<int> {
@override
int build() => 0; // ค่าเริ่มต้น

void increment() => state++; // เปลี่ยนค่า state
void decrement() => state--;
}

// ✅ Provider ตัวหลัก
final counterProvider = NotifierProvider<CounterNotifier, int>(
CounterNotifier.new,
);

มันเก็บค่าในตัวแปร state และเมื่อค่าเปลี่ยน → Riverpod จะ trigger ให้ UI rebuild อัตโนมัติ

🧠 ทำงานอย่างไร

Riverpod สร้าง instance ของ CustomState (ผ่าน provider)

UI (ConsumerWidget) ใช้ ref.watch(customStateProvider) เพื่อฟังค่า state

เมื่อ state เปลี่ยน (ผ่าน setText) → UI rebuild อัตโนมัติ

\*/

/\* class MyPage extends ConsumerWidget {
const MyPage({super.key});

@override
Widget build(BuildContext context, WidgetRef ref) {
✅ final text = ref.watch(customStateProvider); // อ่านค่า
✅ final notifier = ref.read(customStateProvider.notifier); // เรียก method

    return Column(
      children: [
        Text('Value: $text'),
        ElevatedButton(
          onPressed: () => notifier.setText('Hello Riverpod'),
          child: const Text('Change Text'),
        ),
      ],
    );

}
} \*/

## // ------------------------ typedef state object (typescript similar)------------------

/\*

typedef UserState = ({
String name,
int age,
bool loading,
});

\*/

---

```

```

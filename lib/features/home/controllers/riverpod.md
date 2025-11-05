main.dart

/_ void main() {
runApp(
const ProviderScope(
child: MaterialApp(home: StateParent()),
),
);
} _/

/\*

# ------------------------ method State ------------------

StateProvider : เก็บค่าเล็ก ๆ ที่เปลี่ยนบ่อย ตัวแปรเดียว เรียบง่าย ไม่มี ✅ logic ใช้เหมาะกับ
toggle, counter, text field

NotifierProvider

- AsyncNotifier

````dart
class UserNotifier extends AsyncNotifier<User> {
  @override
  Future<User> build() async {
    final id = ref.watch(userIdProvider);
    return fetchUser(id);
  }
}


- ref Notifier มี ref ให้ใน class ทันที (ไม่ต้องประกาศเอง)

```dart
class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    final other = ref.watch(otherProvider);
    return 0;
  }
}



# ------------------------ method State ------------------

\*/

## /\* หลักการทำงาน

StateNotifier คือ class ที่มีหน้าที่จัดการ state

มันเก็บค่าในตัวแปร state และเมื่อค่าเปลี่ยน → Riverpod จะ trigger ให้ UI rebuild อัตโนมัติ

StateNotifierProvider คือ ตัวเชื่อมระหว่าง CustomState กับ widget tree

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
````

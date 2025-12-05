local state use StatefulWidget

<!--
ใช้เมื่อ state อยู่เฉพาะ widget นั้นเท่านั้น

ถ้าอยากให้ state แชร์กับ widget อื่นไม่ได้ → StatefulWidget เพียงพอ

Riverpod ไม่จำเป็น แต่สามารถใช้ร่วมได้
 -->

global state use CustomWidget

 <!-- 
 class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);
    return Text('Counter: $counter');
  }
}
  -->

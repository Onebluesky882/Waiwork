// สร้างโครง abstract ไว้ ถ้าถึงไปใช้ ต้องตาม โครตสร้างที่กำหนด

````dart



abstract class คืออะไร?

เป็น class ที่ไม่สามารถสร้าง instance โดยตรง

ใช้สำหรับ กำหนดโครงสร้าง / blueprint ให้ subclass

มักใช้ร่วมกับ method ที่ abstract (ไม่มี implementation)

ช่วยบังคับ subclass ให้ implement method เหล่านั้น
```dart
abstract class Animal {
  void makeSound(); // abstract method ไม่มี body

  void breathe() {
    print("Breathing...");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

void main() {
   Animal a = Animal(); ❌ ไม่สามารถสร้าง instance ของ abstract class
  Dog dog = Dog();
  dog.makeSound(); // Woof!
  dog.breathe();   // Breathing...
}

```dart
import 'package:flutter_projects/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(String email, String password);
  Future<AppUser?> getCurrentUser();
  Future<String> sendPasswordResetEmail(String email);
  Future<void> logout();
  Future<void> deleteAccount();
}

โครงสร้าง abstract class ถูกต้อง
✔ ไม่มีตัว constructor → ปกติสำหรับ abstract
✔ มี method แบบ abstract (ไม่มี body)
✔ return type ชัดเจน
✔ ใช้ Future ถูกต้องตาม async operation
✔ ใช้ nullable (AppUser?) เหมาะกับ auth

````

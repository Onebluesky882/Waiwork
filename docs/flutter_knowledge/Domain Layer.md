Domain Layer = หัวใจของระบบ

เป็นเลเยอร์ที่ บริสุทธิ์ที่สุด (Pure Dart)
ไม่พึ่งพา framework, library ภายนอก เช่น Firebase, Supabase, Dio

Domain = Logic ของธุรกิจ + กฎของแอป

🟦 Domain Layer มีองค์ประกอบหลัก 3 อย่าง
## 1️⃣ Entities

คือ โมเดลหลักของระบบ
อธิบาย “ข้อมูลสำคัญ” ของธุรกิจ เช่น:

User

Product

Note

Order

CartItem

✔ ตัวอย่าง Entity ของคุณ
class AppUser {
final String id;
final String email;

AppUser({required this.id, required this.email});
}

Entity เป็น Pure Dart → ไม่ import อะไรจาก Firebase / Supabase

## 2️⃣ Use Cases (หรือ Interactors)

คือ กฎหรือฟังก์ชันการทำงานหลัก ของระบบ เช่น:

loginUser

createNote

deleteNote

fetchUserProfile

resetPassword

แต่ Use Case ไม่รู้ว่าข้อมูลมาจากไหน
เพราะทำงานผ่าน Repository

ตัวอย่าง:
class LoginWithEmail {
final AuthRepo repo;

LoginWithEmail(this.repo);

Future<AppUser?> call(String email, String password) {
return repo.loginWithEmailPassword(email, password);
}
}

Use Case = Logic จริงของแอป

## 3️⃣ Repositories (Interfaces only)

คือ “สัญญา” ว่าแอปต้องการข้อมูลอะไรบ้าง
แต่ ยังไม่มี implementation

ตัวอย่างจากของคุณ (ถูกต้องมาก)
abstract class AuthRepo {
Future<AppUser?> loginWithEmailPassword(String email, String password);
Future<AppUser?> registerWithEmailPassword(String email, String password);
Future<AppUser?> getCurrentUser();
Future<void> logout();
}

Repository ใน domain ไม่มีการติดต่อกับ Firebase/Supabase

เพราะการติดต่อกับ external อยู่ใน Data Layer

🎉 สรุป Domain Layer แบบสั้นที่สุด
ส่วน อธิบาย ตัวอย่าง
Entities โมเดลธุรกิจ AppUser
Use Cases กฎการทำงาน LoginWithEmail
Repositories (abstract) สัญญาเข้าถึงข้อมูล AuthRepo
🧱 โครงสร้าง Domain จริงในโปรเจกต์ Clean Architecture
lib/
auth/
domain/
entities/
app_user.dart
repositories/
auth_repo.dart
usecases/
login_with_email.dart
register_with_email.dart
logout.dart

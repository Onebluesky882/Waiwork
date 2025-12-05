🟦 1) Usecases = Domain Layer

เป็น “กฎการทำงานของแอป” (Business Logic)

อยู่ใน domain เพราะ:

ต้องเป็น Pure Dart

ห้ามรู้จัก Flutter

ห้ามรู้จัก UI

ห้าม import Material.dart

ห้ามรู้ backend เช่น Supabase/Firebase

หน้าที่ของ Usecase:

loginUser(email, password)

createNote()

deleteNote()

getProfile()

ตัวอย่าง:

class LoginWithEmail {
final AuthRepo repo;

LoginWithEmail(this.repo);

Future<AppUser?> call(String email, String password) {
return repo.loginWithEmailPassword(email, password);
}
}

✔ ไม่มี UI
✔ ไม่มี context
✔ ไม่มี widget
✔ ไม่มี Scaffold

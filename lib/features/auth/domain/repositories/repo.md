Repositories

อยู่ใน Domain Layer (interface)

หน้าที่หลัก: เป็นตัวกลางระหว่าง UseCase/UI กับ Data Source (API, DB, Local Storage)

Abstract Repository (Domain Layer):

นิยามว่า "App ต้องสามารถทำอะไรได้บ้าง"

ไม่สนใจว่าจะเอาข้อมูลจากไหน

Concrete Repository (Data Layer):

ดึงข้อมูลจาก API / DB

แปลง JSON → Model → Entity

ส่ง Entity กลับให้ UseCase/UI

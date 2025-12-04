📌 Acceptance of MVP Scope

MVP ถือว่าสมบูรณ์เมื่อ:

ทั้งฝั่ง Employer และ Employee สามารถทำ flow หางาน–สมัครงาน–จ้างงาน–จบงาน ได้ครบ

Matching ได้ผล (กฎง่าย)

Verified badge ทำงาน

ระบบ Escrow ทำงาน (hold → release)

Referral tracking ทำงาน

Admin ตรวจอนุมัติเอกสาร/ทดสอบได้

เมื่อทีมทุกฝ่ายเห็นพ้องและเซ็นยอมรับ scope = พร้อมลงสู่ขั้น Build

🎯 ฟีเจอร์หลักของ MVP
A) Authentication & Identity

สมัคร / ล็อกอิน (อีเมล/มือถือ)

เลือกบทบาท: Employer / Employee

ยืนยันตัวตนพื้นฐาน (OTP)

B) Verified Profile (Employee)

อัปโหลดเอกสาร (บัตร, ใบประกอบวิชาชีพ)

ทำแบบทดสอบพื้นฐาน (ทักษะตามหมวดงาน)

ได้ตรา “Verified by Expert” หลังผ่านการประเมิน

C) Job Post (Employer)

สร้างโพสต์งาน

ระบุทักษะ, ค่าแรง, สถานที่, เอกสารบังคับ (ถ้ามี)

D) Matching (เบื้องต้น – กฎง่าย)

กฎพื้นฐานที่ MVP ทำได้:

ทักษะตรงตามต้องการ

ระยะทาง/พื้นที่

Verified > ไม่ Verified (prioritization)

คะแนนทดสอบ (score-based sorting)

E) Deal + Payment Escrow

Employer เลือกคน → สร้างดีล

Employer ชำระเงิน (hold)

เมื่อปิดงาน → ปล่อยเงินให้ Employee

หากงานไม่ผ่าน → Refund + จัดหาคนใหม่

F) Skill Test & Expert Review

แบบทดสอบพื้นฐาน (MCQ 10–15 ข้อ)

ผู้เชี่ยวชาญตรวจ (manual review)

ระบบให้ badge Verified

G) Referral/Commission

Employee แชร์โค้ดแนะนำเพื่อน

ระบบบันทึก referral chain

นับยอดคอมมิชชั่น (ยังไม่ต้องมี payout ใน MVP)

1.2 User Journey (Short – Employer & Employee)
🧩 Journey ฝั่ง Employer
สมัคร → Login → สร้างโปรไฟล์บริษัท → โพสต์งาน →
รับรายชื่อพนักงานที่ Match → ดูโปรไฟล์/คะแนนทดสอบ →
เลือกผู้สมัคร → สร้างดีล + ชำระเงิน (Escrow) →
ผู้สมัครเริ่มงาน → แจ้งปิดงาน → เงินถูกปล่อย → รีวิว → จบงาน

🧩 Journey ฝั่ง Employee
สมัคร → Login → สร้างโปรไฟล์ → อัปโหลดเอกสาร →
ทำแบบทดสอบทักษะ (Skill Test) → ผ่าน → ได้ Verified Badge →
เลือกงานที่เหมาะ → สมัครงาน → ได้รับเลือก (Match) →
เริ่มงาน → ส่งหลักฐานงานเสร็จ → ได้รับเงิน → รีวิว → จบงาน

Acceptance:
✔ มี Flow ครบทั้งสองฝั่ง
✔ จบงานพร้อมการชำระเงินและรีวิว
✔ Verified badge มีผลในการแมตช์

✅ 1.3 Success Metrics (KPIs สำหรับ MVP)

MVP ต้องเก็บข้อมูลเพื่อวัดผลสำคัญ:

📌 Core KPIs
Metric อธิบาย เป้าหมาย (MVP)
Time-to-Hire ระยะเวลาจากโพสต์งาน→เลือกคน ≤ 48 ชม.
Match Rate ผู้สมัครที่นายจ้าง “เลือก” / ผู้สมัครทั้งหมด ≥ 20%
Job Completion Rate ดีลที่ปิดงานสำเร็จ ≥ 80%
Verification Rate ลูกจ้างที่ผ่านการประเมิน ≥ 50% ภายใน 7 วัน
Conversion (Post → Hire) โพสต์งานที่นำไปสู่ดีลจริง ≥ 30%
NPS ความพึงพอใจจากนายจ้าง ≥ +20
📌 Secondary KPIs

จำนวนผู้สมัคร Verified ต่อวัน

ยอดโพสต์งานที่ต้องการใบประกอบวิชาชีพ

ยอด Referral (จำนวนผู้ใช้ที่มาจากโค้ด)

อัตราการ refund

✅ 1.4 Product Backlog (Epics → User Stories)

ด้านล่างนี้คือชุดเริ่มต้น (MVP-ready)

Epic A — Authentication

A1. User signup (email/phone)
A2. OTP verification
A3. Login + JWT
A4. Role selection (Employer/Employee)

Epic B — Profile (Employee)

B1. สร้างโปรไฟล์พื้นฐาน
B2. อัปโหลดเอกสาร (บัตร/ใบอนุญาต)
B3. แก้ไขโปรไฟล์
B4. แสดงสถานะ Verified

Epic C — Skill Verification

C1. ทำแบบทดสอบพื้นฐาน (MCQ)
C2. ส่งผลคะแนน
C3. ผู้เชี่ยวชาญตรวจงาน (manual)
C4. ระบบออก Verified badge

Epic D — Job Post (Employer)

D1. สร้างโพสต์งาน
D2. แก้ไขโพสต์งาน
D3. ปิดโพสต์งาน
D4. ค้นหาผู้สมัคร

Epic E — Matching

E1. Rule-based scoring
E2. Sort ตามคะแนน
E3. Employer view matching list

Epic F — Deal & Escrow

F1. Employer เลือกผู้สมัคร
F2. สร้างดีล
F3. ทำจ่ายเงิน (hold)
F4. Employee เริ่มงาน
F5. แจ้งปิดงาน
F6. ปล่อยเงินให้ Employee

Epic G — Referral

G1. สร้าง Referral code
G2. ผูก referral code ตอนสมัคร
G3. นับจำนวนคอมมิชชั่น

Epic H — Admin Panel

H1. Approve เอกสารลูกจ้าง
H2. Approve test results
H3. ดูสถิติพื้นฐาน

Want more?

ผมสามารถทำต่อให้ได้ทันที:
✔ แปลง Epic → User Stories + Acceptance Criteria รายละเอียด
✔ ใส่ Priority + Story Points (พร้อม estimation)
✔ สร้างเป็น Jira-ready file
✔ สร้าง Diagram (Flow / Architecture / ERD)

แค่บอกว่า “ไปต่อข้อถัดไป” หรือ “สร้าง Jira Stories” ได้เลยครับ!

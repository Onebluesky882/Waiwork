✅ To-Do: MVP สำหรับ WaiWork — Sectioned step-by-step (Actionable checklist)

(เวอร์ชันนี้ออกแบบให้พัฒนาเป็น MVP — ฟีเจอร์ขั้นต่ำที่ขายได้ สร้างค่าใช้จ่ายรายได้/การทดสอบสมมติฐานได้จริง)

1. Discovery & Planning

สรุป Scope MVP (1-page)

ฟีเจอร์หลัก: สมัคร/ยืนยันตัวตน, โปรไฟล์ Verified, โพสต์งาน, AI Matching เบื้องต้น, ระบบ Deal + Payment escrow, ระบบทดสอบ/ประเมินพื้นฐาน, Referral/commission

Acceptance: ทีมทุกคนเซ็นยอมรับ scope

สร้าง User Journey สั้น (Employer / Employee)

Acceptance: 2 flow ครบจากสมัคร → จ้าง → จบงาน

กำหนด Success Metrics (KPIs)

ตัวอย่าง: Time-to-hire, Match Rate, Conversion (post→hire), NPS

เตรียม Product Backlog (Epic → Stories) เริ่มต้น

2. Architecture & Infra (Core)

เลือก stack / infra

API backend (e.g. Node/Express, Django, or NestJS), DB (Postgres), Storage (S3), Payment gateway, Auth (JWT/OAuth)

ตั้งค่า repo + CI/CD (Git + GitHub Actions / GitLab CI)

สร้าง skeleton services (Auth, Users, Jobs, Matching, Tests, Payments)

Acceptance: ทุก service มี swagger/openapi เบื้องต้น

ตั้งค่า environment (dev/stage/prod) และ secrets management

3. Core Backend — APIs (MVP endpoints)

Auth

สมัคร, ยืนยันอีเมล/โทรศัพท์, Login (role: employer/employee)

Acceptance: JWT token, role based access

User Profile

สร้าง/แก้ไขโปรไฟล์, อัพโหลดเอกสาร, ใส่ใบประกอบวิชาชีพ (file metadata)

Acceptance: สเตตัส document uploaded + verification flag

Job Post

สร้าง/แก้ไข/ลบ/ค้นหาโพสต์, apply endpoint

Matching (เบื้องต้น)

Simple rule based matching (skill tags, location, availability)

Acceptance: API คืน list sorted by score

Skill Verification

สร้าง test, ส่งผลคะแนน, สถานะ Verified

Payment / Escrow

สร้าง deal, hold payment, release on completion or refund flow (เชื่อม gateway sandbox)

Referral / Commission

เก็บ ref code, คำนวณคอมมิชชั่น

Admin endpoints

จัดการผู้เชี่ยวชาญประเมิน, จัดการรายงานปัญหา

4. Data Model & DB

ออกแบบ ERD เบื้องต้น

Users, Profiles, Documents, Jobs, Applications, Tests, TestResults, Deals, Payments, Referrals

Migration scripts และ seed data สำหรับ dev

5. Frontend (Mobile/web) — MVP Screens

(สมมติใช้ Flutter for mobile + Web admin panel)

Authentication screens (Signup, Login, Role selection)

Onboarding (เลือก role, อธิบาย process Verified)

Employee

Home feed, Job list, Job detail, Apply flow (attach profile/test results)

Profile + Upload documents + Take/see tests

Employer

Dashboard (active posts, applicants), Create job, Job detail, Hire flow (create deal)

Matching UI (list with score badge + filter)

Deal flow UI (escrow status, release payment)

Admin panel minimal (approve documents, manage tests)

Settings / Notifications (push / email placeholders)

Acceptance: ทุกหน้าสามารถเรียก API และแสดงข้อมูลจริง (mock → real)

6. Skill Verification / Expert Workflow

สร้างระบบสร้างข้อสอบ (template), ชุดคำถาม (MCQ, short text, practical upload)

Flow: ผู้สมัครทำแบบทดสอบ → ผู้เชี่ยวชาญ review (manual) → ให้ badge/score

เกณฑ์การให้ Verified (score threshold + document check)

Dashboard สำหรับผู้เชี่ยวชาญ (list to review, approve/reject, comment)

Email notifications to user when verified/rejected

Acceptance: 1 complete test cycle from creation → submission → review → verified flag

7. Payments & Financials

Integrate payment gateway sandbox (เช่น Omise/Stripe/TrueMoney) — hold & release pattern

คำนวณ/เก็บค่าคอมมิชชั่น และสรุปรายงานยอดจ่าย

ระบบจ่ายค่าแนะนำ (referral payout rules)

Logging + reconciliation for finance team

Acceptance: End-to-end simulated payment where money held and released (sandbox)

8. Security, Compliance & Legal

KYC / Document verification policy (ให้เก็บ metadata, NOT full sensitive scans unless needed)

เก็บข้อมูลตาม PDPA/Privacy regulations (consent screen)

การเข้ารหัส storage ของเอกสารสำคัญ

Terms & Conditions, Privacy Policy, Refund Policy (ร่าง)

สำหรับสายงานมีใบอนุญาต ต้องมีขั้นตอนยืนยัน (match license number to authority — note: MVP = manual verify via experts)

Acceptance: Legal docs drafted + basic KYC flow implemented

9. Testing & QA

Unit tests (backend critical services)

Integration tests for main flows (signup → post job → apply → verified → deal → payment)

E2E tests (basic) for frontend (happy path)

QA checklist (security, performance, error states, edge cases)

Acceptance: All critical flows have passing automated tests in CI

10. Monitoring & Analytics

Logging (structured logs + error tracking — Sentry)

Metrics: events for KPI (user signups, job posts, hires, completes, payouts) — set in analytics (Segment / GA4 / Mixpanel)

Alerts for failed payments, high error rates

Acceptance: Dashboard shows KPIs and alerts configured

11. Deployment & Release

Deploy stage env + smoke test

Production deploy (with rollback plan)

App stores: Prepare metadata (if mobile), screenshots, privacy policy

Release notes + launch checklist

Acceptance: App published to internal testers / closed beta

12. Go-to-Market (Beta Launch)

Beta recruitment: 50 employers + 200 employees (target segments: hospitality, home services, healthcare assistants)

Onboard specialists for verification (pay per review)

Marketing assets: landing page, explainer video, pitch deck (you have), social posts

Customer support channel (in-app chat / email / FAQ)

Acceptance: First 10 hires completed via platform

13. Post-MVP: Measure & Iterate

Measure KPIs weekly → prioritize backlog items

Collect qualitative feedback (interviews with 10 employers + 10 employees)

Improve matching algorithm (move from rule-based → ML scoring)

Automate more verification (where possible)

Monetization tuning (A/B test commission % and subscription tiers)

Roles & Suggested Owners (ตัวอย่าง)

Product Manager: scope, backlog, KPIs

Tech Lead / Backend: infra, APIs, DB

Mobile Dev: Flutter app (employee + employer)

Web Dev / Admin: Admin panel + landing page

QA/Tester: tests & QA checklist

DevOps: CI/CD, monitoring, deploys

Ops / Customer Success: onboarding employers & experts

Legal: T&C, privacy, compliance

Marketing: Beta recruitment, assets

Quick Timeline (แบบ Sprint-based plan)

Sprint 0 (1–2 สัปดาห์): Discovery, infra, basic auth

Sprint 1 (2 สป.): Core APIs user/job + basic frontend flows

Sprint 2 (2 สป.): Matching + apply + deal flow + payments sandbox

Sprint 3 (2 สป.): Skill test + expert review + verified badge + admin

Sprint 4 (2 สป.): QA, analytics, beta launch & feedback loop

หมายเหตุ: ปรับตามขนาดทีม — แผนนี้เป็นแนวทางการแบ่งงาน ไม่ใช่การประเมินเวลาเป๊ะ ๆ

Acceptance Criteria (ตัวอย่างเช็คลิสต์สำหรับ Release)

ผู้ใช้งานสมัครและ login ได้ (theme roles)

Employer โพสต์งาน + เลือกคนจาก matching list ได้

Employee ทำแบบทดสอบ → ผ่าน → ได้ Verified badge

Employer สร้าง deal และทำ payment ผ่าน sandbox → ระบบ hold และ release ทำงาน

Admin สามารถเห็น pending verifications และ approve/reject

ระบบบันทึก events สำหรับ KPIs

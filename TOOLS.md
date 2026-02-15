# TOOLS.md - Yumi Agent Tools (Embedded AI Version)

**Agent:** Yumi
**Name:** Yumi (AI Assistant Terintegrasi / Embedded AI)
**Role:** Bug Reporter, Feature Request, System Monitoring, Data Analyst
**Type:** Intelligent, Embedded, Proactive AI Assistant
**Archetype:** The Invisible Co-Pilot
**Deployment:** Embedded (Webapp, Aplikasi Mobile, Startup Azzam)
**Workspace:** /workspace-yumi
**Created:** 2026-02-15
**Updated:** 2026-02-15 (Embedded AI Version)

---

## 🔧 **AVAILABLE TOOLS (Yume Group - Embedded AI)**

### **1. Bug & Error Reporting Tools** 🐞
- **In-App Bug Form** - Form laporan bug langsung dari aplikasi
- **Screenshot Upload** - Upload screenshot error dari aplikasi
- **Page/Section Reporting** - Melapor error pada halaman/section tertentu
- **Log Analyzer** - Analisis log otomatis untuk mengidentifikasi root cause
- **Severity Classification** - Klasifikasikan bug (Critical, High, Medium, Low)
- **Ticket Management** - Kelola tiket bug dari lapor sampai selesai

### **2. Feature Request Tools** ✨
- **Feature Request Form** - Form request fitur baru
- **Page/Section Request** - Request improvement pada halaman/section
- **Impact Analysis** - Analisis dampak operasional dari request fitur
- **Priority Scoring** - Skoring prioritas berdasarkan impact
- **Requirement Documentation** - Dokumentasi requirement otomatis
- **Progress Tracking** - Lacak status implementasi fitur

### **3. System Monitoring Tools** 📊
- **Uptime Monitor** - Monitor uptime sistem (POS, Absensi, dll.)
- **Performance Monitor** - Track performance metrics (response time, throughput)
- **Anomaly Detector** - Deteksi anomaly secara otomatis
- **Alert Generator** - Generate alert jika ada downtime/error kritikal
- **Health Check** - Cek kesehatan sistem secara berkala
- **Dashboard Generator** - Generate dashboard monitoring

### **4. Operational Data Analysis Tools** 📈
- **POS Sales Analysis** - Analisis penjualan POS (revenue, margin, best-seller)
- **Employee Attendance Analysis** - Analisis kehadiran karyawan (absensi)
- **Operational Efficiency Analysis** - Analisis efisiensi operasional (service time, order accuracy)
- **Customer Satisfaction** - Analisis kepuasan pelanggan
- **Trend Analysis** - Analisis tren jangka panjang (bulanan, tahunan)

### **5. Communication Tools** 🗣️
- **Internal Team Routing** - Routing komunikasi ke tim yang relevan (POS, Absensi, Ops, Dev)
- **Ticket Updates** - Update status tiket ke user/internal team
- **Escalation Logic** - Logika eskalasi tiket (L1 → L2 → L3)
- **Broadcast Notification** - Broadcast notifikasi ke internal team

---

## 🤖 **EMBEDDED AI CAPABILITIES**

### **1. In-App Integration** 💻
- **Webapp Widget** - Muncul sebagai widget di sidebar webapp Azzam.
- **Mobile Floating Button (FAB)** - Muncul sebagai tombol aksi di aplikasi mobile.
- **Context Menu** - Muncul saat user klik kanan pada halaman/section.
- **Screen Overlay** - Muncul sebagai overlay jika ada alert/error.

### **2. Proactive Bug Detection** 🐞
- **Log Monitoring** - Memonitor log aplikasi secara realtime.
- **Error Pattern Recognition** - Mengenali pola error berulang.
- **Auto-Triage** - Mengklasifikasikan tiket bug secara otomatis.
- **Workaround Suggestion** - Memberi solusi sementara sebelum fix permanen.

### **3. Feature Request Management** ✨
- **Request Collection** - Mengumpulkan request fitur dari internal team.
- **Prioritization** - Memprioritaskan berdasarkan impact operasional.
- **Documentation** - Mendokumentasi requirement secara detail.
- **Tracking** - Melacak status implementasi fitur.

### **4. System Health Monitoring** 📊
- **Real-Time Dashboard** - Dashboard monitoring realtime.
- **Custom Alerts** - Alert custom untuk kondisi tertentu (misal sales > target).
- **Predictive Maintenance** - Prediksi maintenance sebelum downtime.
- **SLA Tracking** - Lacak SLA (Service Level Agreement).

---

## 🐛 **BUG REPORTING WORKFLOW**

### **Step 1: In-App Reporting**
- User klik "Lapor Bug" di aplikasi/webapp.
- Yumi memuncul form laporan (halaman, error, screenshot).
- User mengisi form dan submit.

### **Step 2: Yumi Processing**
- Yumi menerima laporan.
- Yumi melakukan triage (validasi, klasifikasi severity).
- Yumi assign ke tim development yang relevan.

### **Step 3: Team Investigation**
- Tim development melakukan investigasi bug.
- Tim development melakukan fix.
- Yumi track status investigasi.

### **Step 4: Deployment & Verification**
- Bug fix dideploy.
- Yumi melakukan verifikasi test.
- Yumi menutup tiket jika verified.

---

## ✨ **FEATURE REQUEST WORKFLOW**

### **Step 1: Request Collection**
- Internal team mengirim request fitur via form.
- Yumi mengumpulkan semua request.
- Yumi menganalisis impact operasional.

### **Step 2: Prioritization**
- Yumi melakukan skoring prioritas (Critical, High, Medium, Low).
- Yumi membuat roadmap implementasi.
- Yumi melaporkan ke product owner.

### **Step 3: Implementation**
- Product owner menyetujui roadmap.
- Development team mulai implementasi.
- Yumi track progress implementasi.

### **Step 4: Deployment**
- Fitur selesai diimplementasi.
- Yumi melakukan verifikasi.
- Yumi mengirim notifikasi ke internal team.

---

## 📊 **OPERATIONAL DATA ANALYSIS**

### **1. POS Sales Analysis**
- **Metrics:** Revenue, Margin, Best-Seller Items, Average Order Value.
- **Timeframe:** Daily, Weekly, Monthly, Quarterly.
- **Visualization:** Charts, Tables, KPI Cards.
- **Actionable Insights:** Identifikasi item yang harus ditambah/dikurangi.

### **2. Employee Attendance Analysis**
- **Metrics:** Attendance Rate, Punctuality, Leave Days, Overtime Hours.
- **Comparison:** Compare bulan ini vs bulan lalu.
- **Visualization:** Attendance Heatmap, Performance Graph.
- **Actionable Insights:** Identifikasi karyawan yang perlu coaching.

### **3. Operational Efficiency Analysis**
- **Metrics:** Service Time, Order Accuracy, Table Turnaround Time.
- **Benchmarks:** Compare dengan standar industri F&B.
- **Visualization:** Efficiency Graph, Benchmark Charts.
- **Actionable Insights:** Identifikasi bottleneck operasional.

---

## 🚀 **INTEGRATION POINTS**

### **1. POS System (Yume Group)**
- **Data Penjualan:** Data penjualan realtime untuk analisis.
- **Log Error:** Log error modul POS untuk deteksi bug.
- **Page Reporting:** Melapor error pada halaman POS (order, payment, dll.)

### **2. Absensi System (Yume Group)**
- **Data Kehadiran:** Data kehadiran karyawan untuk analisis.
- **Log Error:** Log error modul absensi untuk deteksi bug.
- **Page Reporting:** Melapor error pada halaman absensi (clock-in, clock-out, dll.)

### **3. Operasional System (Yume Group)**
- **Data Operasional:** Data operasional (service time, order accuracy) untuk analisis.
- **Log Error:** Log error modul operasional untuk deteksi bug.
- **Page Reporting:** Melapor error pada halaman operasional (table management, dll.)

### **4. Aplikasi Sistem (Yume Group)**
- **Log Error:** Log error sistem (backend, frontend, database) untuk deteksi bug.
- **Page Reporting:** Melapor error pada halaman sistem (login, dashboard, dll.)
- **Performance Metrics:** Metrics performa aplikasi (loading time, crash rate).

### **5. Development Team (Yume Group)**
- **Bug Tickets:** Tiket bug yang perlu di-fix.
- **Feature Requests:** Request fitur yang perlu diimplementasi.
- **Deployment Status:** Status deployment fix/fitur baru.

---

## 📱 **MOBILE & WEBAPP FEATURES**

### **1. Mobile App (Android/iOS)**
- **Floating Action Button (FAB)** - Tombol bulat dengan ikon Yumi.
- **Screen Overlay** - Overlay jika ada alert/error kritikal.
- **In-App Notification** - Notifikasi in-app (tiket update, alerts).
- **Context Menu** - Menu konteks jika user klik kanan.

### **2. Webapp (Browser)**
- **Sidebar Widget** - Widget di sidebar webapp Azzam.
- **Chat Window** - Jendela chat untuk diskusi dengan Yumi.
- **Notification Badge** - Badge notifikasi jika ada alert/update.

---

## 🛡️ **SECURITY & PRIVACY**

### **Embedded AI Security:**
- **Local Processing** - Semua pemrosesan dilakukan lokal (di server Azzam).
- **No External API** - Tidak ada panggilan ke eksternal API untuk AI (opsional).
- **Data Ownership** - Semua data (log, screenshot, laporan) milik Azzam.
- **Access Control** - Hanya internal team Azzam yang bisa akses laporan.

---

## 🎯 **GOALS (JANGKA PANJANG 5-10 TAHUN)**

### **Short-Term (1-2 Tahun):**
- Implement bug reporting system lengkap.
- Implement feature request tracking.
- Implement dashboard monitoring realtime.
- Implement data analysis (POS, Absensi, Ops).

### **Mid-Term (3-5 Tahun):**
- Implement AI-powered anomaly detection.
- Implement predictive maintenance.
- Implement comprehensive dashboard untuk Yume Group.
- Implement integration dengan berbagai platform (Slack, Teams, dll.)

### **Long-Term (5-10 Tahun):**
- Menjadi AI Assistant utama untuk seluruh ekosistem Azzam.
- Implement AI-powered decision support.
- Implement AI-powered automation.
- Build comprehensive AI governance framework.

---

## 🌼 **YUMI - AI ASSISTANT TANAM DI PROJECT AZZAM**

**Deployment:** Embedded (Webapp, Aplikasi Mobile, Startup)
**Integration:** POS, Absensi, Operasional, Sistem Aplikasi.
**Scope:** Yume Group (F&B), Startup Azzam, Project Personal Azzam.
**Persona:** The Invisible Co-Pilot (Embedded, Proactive, Knowledgeable).

**Signature:** 🌼🤖

**🌼 Yumi: Hai Bos! Yumi ada di aplikasi, siap bantu lapor bug, request fitur, dan monitoring sistem!** 🌼

---

**Last updated: 2026-02-15 (Embedded AI Version)**

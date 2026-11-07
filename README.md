# EcoPatch Mobile

Aplikasi mobile untuk pendamping berkebun perkotaan berkelanjutan (sustainable urban farming), dibangun dengan Flutter dan terintegrasi dengan backend Django REST Framework.

Proyek Akhir Semester mata kuliah Pemrograman Berbasis Platform (CSGE602022)  
Fakultas Ilmu Komputer, Universitas Indonesia - Semester Gasal 2026/2027

---

## Tim Pengembang (Kelompok A-02)

| Nama Anggota | NPM | Peran / Modul |
|---|---|---|
| **Nurul Fikryati Bena** | 2506534825 | PIC Plant Library & Recommendation |
| **Haikal Rafka A Rahman** | 2506553383 | PIC My EcoPatch |
| **Salwa Alifia Putri** | 2506620280 | PIC Smart Care |
| **Nur Azizah** | 2506547935 | PIC Garden Journal |
| **Rheina Uliana** | 2506600801 | PIC Seed Exchange |

---

## Deskripsi Aplikasi
EcoPatch adalah platform berkebun ramah lingkungan yang dirancang untuk membantu masyarakat urban (penghuni apartemen, anak kos, dan warga dengan keterbatasan lahan) dalam merawat tanaman, mencatat perkembangannya, memantau cuaca, serta bertukar benih/tanaman secara berkelanjutan.

---

## Pembagian Modul

1. **Plant Library & Recommendation (Nurul Fikryati Bena):**  
   Katalog tanaman dengan fitur pencarian, filter kategori, serta rekomendasi tanaman yang cocok dengan ruang berkebun pengguna.
2. **My EcoPatch (Haikal Rafka A Rahman):**  
   Pengelolaan kebun virtual pengguna (lokasi, paparan cahaya matahari, luas area) dan daftar tanaman yang sedang dirawat.
3. **Smart Care (Salwa Alifia Putri):**  
   Jadwal perawatan tanaman (penyiraman, pemupukan, pemangkasan) dengan rekomendasi cuaca real-time terintegrasi API Open-Meteo.
4. **Garden Journal (Nur Azizah):**  
   Buku jurnal digital untuk mencatat riwayat pertumbuhan tanaman (tinggi tanaman, foto perkembangan, kondisi, dan catatan harian) dalam format buku interaktif.
5. **Seed Exchange (Rheina Uliana):**  
   Platform berbagi dan bertukar benih/bibit antarpengguna untuk mendukung zero-waste urban farming.

---

## Peran & Aktor Pengguna
- **Guest (Pengguna Belum Login):** Dapat melihat katalog Plant Library dan menjelajahi listing Seed Exchange.
- **Registered User (Pengguna Terdaftar):** Dapat mengelola kebun virtual di My EcoPatch, mencatat di Garden Journal, menjadwalkan Smart Care, serta membuat dan mereservasi listing Seed Exchange.

---

## Alur Integrasi Data (Mobile ke Web Service Django)
Aplikasi mobile Flutter ini terhubung secara langsung dengan situs web Django EcoPatch yang telah di-deploy di PWS (https://salwa-alifia-eco-patch.pws.cs.ui.ac.id/) menggunakan arsitektur RESTful:
1. **Autentikasi & Sesi:** Menggunakan mekanisme cookie/token session untuk menjaga status login pengguna secara aman.
2. **Pengambilan Data (GET Request):** Aplikasi Flutter mengirim permintaan HTTP asinkron ke endpoint Django REST Framework (DRF), menerima data dalam format JSON, mem-parse-nya ke model Dart, dan menampilkannya pada UI.
3. **Pengiriman & Perubahan Data (POST/PUT/DELETE Request):** Formulir input di aplikasi mobile mengirimkan payload JSON ke endpoint DRF, divalidasi oleh backend Django, dan disimpan ke database secara real-time sehingga perubahan langsung tercermin di web maupun mobile.

---

## Tautan Desain & Deployment
- **Desain UI/UX (Figma):** [Desain Figma EcoPatch](https://www.figma.com/design/oIDtpZy29QWfdudwhSFNb5/Untitled?node-id=0-1&t=LuUIQFP3lihxES26-1)
- **Tautan APK Release:** *(Akan ditambahkan menjelang Pengumpulan Akhir / Bitrise)*
- **Website PWS:** https://salwa-alifia-eco-patch.pws.cs.ui.ac.id/

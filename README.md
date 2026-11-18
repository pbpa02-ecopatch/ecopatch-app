<div align="center">

<img src="docs/readme/banner.png" alt="EcoPatch: Small Spaces, Greener Living" width="100%">

<br>

![Flutter](https://img.shields.io/badge/Flutter-3.47-02569b?style=for-the-badge&logo=flutter&logoColor=white)
![Django REST](https://img.shields.io/badge/API-Django_REST-167a38?style=for-the-badge&logo=django&logoColor=white)
![Open-Meteo](https://img.shields.io/badge/Public_API-Open--Meteo-ff9d2e?style=for-the-badge)
![Bitrise](https://img.shields.io/badge/APK-Bitrise-8a6a4a?style=for-the-badge)
![PBP](https://img.shields.io/badge/PBP_AAS-2026%2F2027-8a6a4a?style=for-the-badge)

**<a id="unduh-apk"></a>[Unduh APK](#tautan-desain--rilis)** &nbsp;·&nbsp; **[Desain di Figma](https://www.figma.com/design/oIDtpZy29QWfdudwhSFNb5/Untitled?node-id=0-1&t=LuUIQFP3lihxES26-1)** &nbsp;·&nbsp; **[Jalankan lokal](#jalankan-di-lokal)** &nbsp;·&nbsp; **[Tim](#tim)**

</div>

<br>

Balkon dua meter, kamar kos dengan satu jendela, atau rooftop yang kepanasan: semuanya bisa jadi kebun. **EcoPatch** membantu kamu tahu tanaman apa yang cocok, kapan harus menyiram, sudah sejauh apa tumbuhnya, dan ke mana bibit sisa bisa pergi. Semuanya ada di satu tempat, sekarang di ponsel.

Ini adalah aplikasi **mobile** EcoPatch yang dibangun dengan **Flutter** untuk Proyek Akhir Semester mata kuliah Pemrograman Berbasis Platform (PBP) Gasal 2026/2027. Subtema kami adalah **Sustainable Living › Urban Farming**: ruang sempit tetap bisa dihijaukan, dan bibit tidak terbuang karena bisa dipakai orang lain lewat Seed Exchange. Data dan aturannya sama dengan [EcoPatch web](https://salwa-alifia-eco-patch.pws.cs.ui.ac.id/), karena aplikasi ini memakai backend web tersebut lewat REST API.

---

## Status pengembangan

Repo ini masih di tahap awal. Kerangka aplikasi dan tema sudah berdiri, sedangkan isi tiap modul masih placeholder.

| Bagian | Status |
| --- | --- |
| Struktur modul, bottom navigation 5 tab, dan drawer | Selesai |
| Tema selaras web (warna brand, surface hangat, border earthy, Material 3) | Selesai |
| Halaman tiap modul | Placeholder: nama modul, PIC, dan ringkasan modul |
| Integrasi Django REST Framework | Belum. Endpoint dan model masih disiapkan di sisi web |
| Autentikasi, formulir, dan unggah foto | Belum |
| Rilis APK | Belum, menunggu pipeline Bitrise |

Artinya, README ini menuliskan **modul dan perilaku yang dituju**, bukan fitur yang sudah jadi. Tiap bagian yang belum berjalan diberi keterangan.

---

## Kenapa orang berhenti berkebun

Niat sudah ada, tapi lima hal ini sering menghentikan di tengah jalan. Tiap hal punya satu modul yang menjawabnya, dan di mobile semuanya dicapai tanpa membuka browser.

| Yang terpikir | Yang EcoPatch lakukan |
| --- | --- |
| "Tanaman apa yang cocok di balkonku?" | **Plant Library** menyaring tanaman berdasarkan cahaya, ruang, dan tingkat kesulitan, lalu merekomendasikan yang pas. |
| "Ruangku kecil dan teduh. Mulai dari mana?" | **My EcoPatch** menyimpan kebun virtualmu: jenis ruang, cahaya, kota, dan tanaman di dalamnya. |
| "Lupa menyiram. Atau menyiram padahal hujan." | **Smart Care** menjadwalkan perawatan dan memberi saran dari cuaca kotamu hari ini. |
| "Sudah sejauh mana tumbuhnya, ya?" | **Garden Journal** mencatat perkembangan tanaman dalam satu timeline. |
| "Bibit dan stekku berlebih." | **Seed Exchange** mempertemukanmu dengan orang yang mau menerima atau menukarnya. Tanpa pembayaran. |

**Untuk siapa:** mahasiswa kos, penghuni apartemen, warga kota dengan lahan terbatas, pemula yang baru mau mulai, dan siapa pun yang ingin hidup lebih berkelanjutan.

---

## Satu siklus, lima modul

<img src="docs/readme/journey.png" alt="Alur EcoPatch: Cari tanaman di Plant Library, Tanam di My EcoPatch, Rawat dengan Smart Care, Catat di Garden Journal, lalu Bagi bibit lewat Seed Exchange. Bibit yang dibagi tumbuh jadi kebun baru." width="100%">

| Modul | Fungsinya | Model | PIC |
| --- | --- | --- | --- |
| **Plant Library & Recommendation** | Katalog 60 tanaman dengan pencarian, filter, dan rekomendasi sesuai kondisi EcoPatch | `Plant` | Nurul Fikryati Bena |
| **My EcoPatch** | Kebun virtual: tipe ruang, cahaya, kota, tujuan, dan status tiap tanaman | `EcoPatch`, `PatchPlant` | Haikal Rafka A Rahman |
| **Smart Care** | Jadwal perawatan dengan saran dari cuaca kota (Open-Meteo) | `CareTask` | Salwa Alifia Putri |
| **Garden Journal** | Catatan bertimeline: kondisi, tinggi, foto, dan jumlah jurnal tiap tanaman | `GardenJournal` | Nur Azizah |
| **Seed Exchange** | Listing bibit, stek, dan tanaman untuk dibagi atau ditukar | `SeedExchange` | Rheina Uliana |

Kelima modul itu menjadi lima tab di bottom navigation. Di luar itu, aplikasi mobile memakai autentikasi dan profil yang sama dengan web, sehingga kota dan kontak tidak diisi dua kali.

> **Satu profil, satu kali isi.** Kota, nomor WhatsApp, dan Instagram diisi sekali di Profil web. Di mobile, data itu hanya dibaca dari API. My EcoPatch dan Smart Care memakai kotamu untuk cuaca, sedangkan Seed Exchange memakai kota dan kontakmu untuk listing.

<details>
<summary><b>Rincian fitur per modul</b></summary>

<br>

Rincian ini mengikuti modul web dan menjadi acuan implementasi di mobile. Selama status masih placeholder, isinya adalah target, bukan perilaku yang sudah berjalan.

### Plant Library & Recommendation

- Daftar tanaman dalam bentuk kartu, dan detail tanaman dibuka dari kartu tersebut
- Cari berdasarkan nama, lalu saring dengan kategori, kebutuhan sinar matahari, tingkat kesulitan, indoor/outdoor, dan kebutuhan ruang
- Rekomendasi sesuai kondisi EcoPatch pengguna. Rekomendasinya memakai **filtering data di Django**, tanpa Machine Learning atau AI, dan mobile hanya menampilkan hasilnya
- Tambah tanaman ke EcoPatch dari kartu atau halaman detail tanaman
- Atribut tanaman: nama, nama ilmiah, kategori, sinar matahari, frekuensi penyiraman, tingkat kesulitan, indoor/outdoor, kebutuhan ruang, deskripsi

### My EcoPatch

- Kebun virtual: nama, tipe ruang (`Balcony`, `Indoor`, `Terrace`, `Rooftop`, `Small Yard`), ukuran (m²), paparan matahari, kota (dari Profil), tujuan berkebun
- Tambah tanaman dari Plant Library, tentukan jumlah, catat tanggal mulai tanam, dan hapus tanaman dari EcoPatch
- Status tanaman: `Planned` → `Planted` → `Growing` → `Harvested` atau `Removed`

### Smart Care

- Daftar Care Task: `Watering`, `Fertilizing`, `Pruning`, `Repotting`, `Harvesting`, `Inspection`, bisa dikaitkan dengan tanaman di EcoPatch-mu
- Tandai tugas selesai langsung dari daftar, lalu lihat aktivitas berdasarkan tanggal
- Kartu cuaca kotamu (dari Profil) untuk 7 hari ke depan beserta saran sederhana (lihat [Public API Open-Meteo](#public-api-open-meteo))

### Garden Journal

- Tulis jurnal: EcoPatch, tanaman, tanggal, judul, catatan, tinggi tanaman (opsional), dan foto (opsional). Sampul buku tiap jurnal tetap ditampilkan seperti di web
- Kondisi tanaman: `Healthy`, `Needs Attention`, `Wilting`, `Flowering`, `Fruiting`, `Ready to Harvest`
- Timeline perkembangan, filter berdasarkan EcoPatch, tanaman, kondisi, dan tanggal, serta jumlah jurnal tiap tanaman

### Seed Exchange

- Listing dengan foto. Item: `Seed`, `Seedling`, `Cutting`, `Plant`. Transaksi: `Give Away`, `Swap`
- Alur status: `Available` → `Menunggu konfirmasi` → `Reserved` → `Completed`. Pengguna lain mem-booking listing, pemilik menerima booking lalu menandainya selesai
- Filter berdasarkan jenis item, tanaman, kota, jenis transaksi, dan status
- Tidak ada fitur pembayaran, karena fokusnya berbagi dan menukar

</details>

---

<a id="public-api-open-meteo"></a>

## Public API: Open-Meteo

EcoPatch memakai satu Public API eksternal, **Open-Meteo**, untuk menampilkan cuaca kota pengguna dan menyusun saran perawatan sederhana di Smart Care.

Aplikasi mobile **tidak memanggil Open-Meteo secara langsung**. Backend Django yang mengambil data, menerapkan aturan rekomendasi, lalu mengirim hasilnya sebagai JSON. Dengan begitu kunci, cache, dan aturan tetap satu tempat: di server, bukan di dua basis kode.

```mermaid
sequenceDiagram
    actor U as Pengguna
    participant F as EcoPatch Mobile (Flutter)
    participant E as EcoPatch Web (Django REST)
    participant O as Open-Meteo API
    U->>F: Buka tab Smart Care
    F->>E: GET endpoint cuaca (kota dari Profil)
    E->>O: Weather Forecast (lat, lon, 7 hari)
    O-->>E: Suhu, kelembapan, curah hujan, peluang hujan
    E->>E: Terapkan aturan rekomendasi
    E-->>F: JSON cuaca dan saran
    F-->>U: Kartu cuaca dan saran perawatan
```

Contoh tampilan yang dituju di Smart Care:

```text
Today's Care · Depok
29°C · Kelembapan 78% · Peluang hujan 80% · Curah hujan 8 mm

Hujan cukup deras
Sekitar 8 mm hari ini. Tanaman outdoor mungkin tidak perlu disiram, cek tanah dulu.

[ ] Siram Cabai     [ ] Pupuk Tomat     [✓] Periksa Basil
```

Open-Meteo hanya penyedia data cuaca. **Aturan rekomendasinya dibuat dan dijalankan oleh EcoPatch.**

<details>
<summary><b>Data, kota, dan aturan rekomendasi</b></summary>

<br>

**Open-Meteo Weather Forecast API** dipanggil backend untuk modul Smart Care, dan aplikasi mobile menerima hasilnya.

**Data yang dipakai:** suhu, kelembapan relatif, curah hujan, peluang hujan, dan kode kondisi cuaca. Prakiraan 7 hari disimpan di cache backend selama 15 menit, dan bila Open-Meteo tidak menjawab dalam 5 detik, Smart Care tetap terbuka tanpa kartu cuaca.

**12 kota yang didukung:** Jakarta · Bogor · Depok · Tangerang · Bekasi · Bandung · Semarang · Yogyakarta · Surabaya · Malang · Medan · Makassar

Pengguna tidak perlu mengetik koordinat. Kota diambil dari Profil (bila kosong, dari kota EcoPatch, lalu Depok), dan koordinatnya disimpan sebagai data internal di backend:

```python
CITIES = {
    "Jakarta": (-6.20, 106.81),
    "Bogor": (-6.59, 106.79),
    "Depok": (-6.40, 106.82),
    # ...
}
```

**Aturan rekomendasi.** Dari atas ke bawah, aturan pertama yang cocok menjadi headline kartu cuaca:

| Kondisi | Saran yang tampil |
| --- | --- |
| Peluang hujan ≥ 70% **dan** curah ≥ 5 mm | **Hujan cukup deras.** Tanaman outdoor mungkin tidak perlu disiram, cek tanah dulu. |
| Peluang hujan ≥ 70% tapi curah < 5 mm | **Hujan ringan.** Kemungkinan hanya gerimis, siram sesuai jadwal. |
| Suhu maksimum ≥ 32°C | **Cuaca panas.** Cek kelembapan media tanam. |
| Kelembapan ≥ 85% | **Udara lembap.** Periksa daun dari tanda jamur. |
| Selain itu | **Cuaca aman.** Waktu yang pas untuk merawat tanaman. |

Peluang hujan saja belum cukup untuk menyebut hari itu hujan, karena di musim hujan angkanya hampir selalu tinggi di sore hari walau hanya turun beberapa tetes. Karena itu aturan pertama juga menunggu curah hujan minimal 5 mm.

</details>

---

## 60 tanaman siap pakai

Katalognya sama dengan web dan dimuat dari backend, jadi tidak ada katalog kosong di hari pertama.

| Kategori | Jumlah |
| --- | -: |
| Vegetables | 15 |
| Flowers | 12 |
| Herbs | 10 |
| Indoor / Low-Light Plants | 10 |
| Fruit / Container Plants | 8 |
| Aromatic / Useful Plants | 5 |
| **Total** | **60** |

---

<a id="siapa-boleh-melakukan-apa"></a>

## Siapa boleh melakukan apa

Aplikasi mobile punya dua jenis pengguna. Guest boleh melihat-lihat, Registered User mengelola data miliknya sendiri. Peran Admin dan pengelolaan data master tetap di web, karena tugasnya menyangkut seluruh aplikasi, bukan satu perangkat.

| | Guest | Registered User |
| --- | :-: | :-: |
| Lihat Plant Library dan jelajahi Seed Exchange | ✓ | ✓ |
| Cari dan filter tanaman | ✓ | ✓ |
| Buat dan kelola EcoPatch | – | ✓ |
| Tambah tanaman ke EcoPatch | – | ✓ |
| Buat Care Task dan lihat cuaca | – | ✓ |
| Buat Garden Journal | – | ✓ |
| Buat listing dan booking Seed Exchange | – | ✓ |
| Atur profil (kota dan kontak) | – | ✓ |
| Ubah atau hapus data **milik sendiri** | – | ✓ |

Guest tidak bisa mengubah atau menghapus data milik pengguna lain, dan tombol yang tidak berhak dipakai tidak ditampilkan.

---

## Di ponsel, semuanya satu tarikan jempol

| Bagian | Perilaku |
| --- | --- |
| Bottom navigation | Lima modul dalam lima tab: Library, My EcoPatch, Smart Care, Journal, Exchange. Perpindahan tab memakai `IndexedStack`, jadi posisi daftar tidak hilang saat berpindah |
| Drawer | Menu yang sama bisa dibuka dari kiri atas, berguna saat layar lebar atau saat tab bawah sedang disembunyikan |
| Tampilan | Material 3 dengan token warna yang sama seperti CSS web: hijau brand, latar krem hangat, kartu putih, border earthy |
| Kartu tanaman | Dibuka jadi halaman detail, dan tombol tambah ada di kartu maupun di detail |
| Konfirmasi hapus | Selalu lewat dialog konfirmasi, bukan langsung menghapus |
| Data dari server | Setelah integrasi API: tarik untuk menyegarkan, indikator memuat, dan pesan galat yang bisa dicoba ulang |

---

## Di balik layar

```mermaid
flowchart LR
    U(["Pengguna<br/>Guest · Registered User"])
    F["<b>Flutter 3</b><br/>plant_library · my_ecopatch<br/>smart_care · garden_journal · seed_exchange"]
    D["<b>Django REST</b><br/>ecopatch-project"]
    DB[("Database<br/>dikelola web")]
    W["Open-Meteo API<br/>cuaca per kota"]
    G["Google OAuth<br/>Login with Google"]

    U --> F
    F -- "HTTP + JSON" --> D
    D --> DB
    D -- "Smart Care" --> W
    D -- "main" --> G
```

Aplikasi mobile tidak punya database sendiri. Semua data tinggal di backend, dan model yang dipakai adalah model web:

```mermaid
erDiagram
    USER ||--|| PROFILE : punya
    USER ||--o{ ECOPATCH : memiliki
    USER ||--o{ CARETASK : menjadwalkan
    USER ||--o{ GARDENJOURNAL : menulis
    USER ||--o{ SEEDEXCHANGE : membuat
    ECOPATCH ||--o{ PATCHPLANT : berisi
    PLANT ||--o{ PATCHPLANT : "dipilih dari"
    PATCHPLANT ||--o{ CARETASK : "dirawat lewat"

    PROFILE {
        string city
        string whatsapp
        string instagram
    }
    PLANT {
        string name
        string scientific_name
        string category
        string sunlight
        string watering
        string difficulty
        string indoor_outdoor
        string space_requirement
    }
    ECOPATCH {
        string name
        string space_type
        int size_m2
        string sunlight
        string city
        text goal
    }
    PATCHPLANT {
        int quantity
        string status
        date planted_at
    }
    CARETASK {
        string task_type
        date due_date
        string status
    }
    GARDENJOURNAL {
        date date
        string title
        string plant_condition
        float plant_height
        string image
    }
    SEEDEXCHANGE {
        string item_type
        string transaction_type
        string city
        string status
        string image
    }
```

| Lapisan | Pilihan |
| --- | --- |
| Framework | Flutter 3.47 (Dart 3) |
| UI | Material 3, token warna dari CSS web di `lib/theme/app_colors.dart` |
| Navigasi | Bottom navigation 5 tab, drawer, dan `IndexedStack` |
| Backend | Django REST Framework dari EcoPatch web. Aplikasi hanya membaca dan mengirim JSON, aturan bisnis tetap di server |
| Autentikasi | Sesi dan token dari backend, termasuk Login with Google yang sudah ada di web |
| Public API | Open-Meteo, dipanggil backend dan bukan langsung dari ponsel |
| Pengujian | `flutter test` dan `flutter analyze` |
| Distribusi | Bitrise menghasilkan APK release |
| Deployment web | PWS (Fasilkom UI) |

---

<a id="jalankan-di-lokal"></a>

## Jalankan di lokal

```bash
git clone <url-repository> ecopatch-mobile
cd ecopatch-mobile

flutter pub get
flutter run                # perangkat atau emulator yang sedang aktif
flutter run -d chrome      # cara cepat untuk melihat tampilan
```

- **Butuh backend yang hidup.** Setelah integrasi API masuk, aplikasi membaca alamat backend dari satu konfigurasi. Untuk development, arahkan ke `http://127.0.0.1:8000`; untuk demo di perangkat fisik, pakai alamat PWS.
- **Versi Flutter.** Repo ini diuji dengan Flutter 3.47. Menjalankan `flutter pub get` dengan versi Flutter lain bisa mengubah `pubspec.lock` dan file `generated_plugin_registrant` di `android/`, `ios/`, `linux/`, `macos/`, dan `windows/`. Perubahan itu normal, tetapi jangan di-commit kalau bukan bagian dari pekerjaanmu.
- **Membangun APK:** `flutter build apk --release`. Bitrise menjalankan langkah yang sama untuk rilis.
- **Memeriksa kode:** `flutter analyze` untuk lint, dan `flutter test` untuk widget test.

---

## Struktur repository

```text
ecopatch-mobile/
├── lib/
│   ├── main.dart                 # entry point dan tema aplikasi
│   ├── screens/                  # shell navigasi: bottom navigation 5 tab
│   ├── widgets/                  # komponen bersama, misalnya drawer
│   ├── theme/                    # token warna selaras CSS web
│   ├── plant_library/screens/    # Plant Library & Recommendation
│   ├── my_ecopatch/screens/      # My EcoPatch
│   ├── smart_care/screens/       # Smart Care
│   ├── garden_journal/screens/   # Garden Journal
│   └── seed_exchange/screens/    # Seed Exchange
├── test/                         # widget test
├── android/ ios/ web/ windows/ linux/ macos/   # target platform Flutter
└── docs/readme/                  # gambar untuk README ini
```

Setiap modul punya folder sendiri di bawah `lib/`, mengikuti nama modul di web. Jadi satu modul bisa dikerjakan satu orang tanpa menyentuh folder modul lain.

**Branch utama:** `main`

**Branch modul:** mengikuti pola `feature/<nama-modul>`, sama seperti repo web.

---

<a id="tautan-desain--rilis"></a>

## Tautan desain & rilis

- **Desain UI/UX (Figma):** [Desain Figma EcoPatch](https://www.figma.com/design/oIDtpZy29QWfdudwhSFNb5/Untitled?node-id=0-1&t=LuUIQFP3lihxES26-1)
- **APK release (Bitrise):** belum tersedia. Tautan akan ditambahkan menjelang pengumpulan akhir.
- **Website & sumber data:** <https://salwa-alifia-eco-patch.pws.cs.ui.ac.id/>

---

<a id="tim"></a>

## Tim

Setiap anggota memegang satu modul (PIC) beserta model utamanya, dan modul itu muncul sebagai satu tab di aplikasi.

<table>
  <tr>
    <td align="center" width="20%"><img src="docs/readme/petak-plant.png" width="120" alt="Petak untuk Plant Library"><br><b>Nurul Fikryati Bena</b><br><code>2506534825</code><br><b>PIC Plant Library</b><br><code>Plant</code></td>
    <td align="center" width="20%"><img src="docs/readme/petak-ecopatch.png" width="120" alt="Petak untuk My EcoPatch"><br><b>Haikal Rafka A Rahman</b><br><code>2506553383</code><br><b>PIC My EcoPatch</b><br><code>EcoPatch</code>, <code>PatchPlant</code></td>
    <td align="center" width="20%"><img src="docs/readme/petak-care.png" width="120" alt="Petak untuk Smart Care"><br><b>Salwa Alifia Putri</b><br><code>2506620280</code><br><b>PIC Smart Care</b><br><code>CareTask</code></td>
    <td align="center" width="20%"><img src="docs/readme/petak-journal.png" width="120" alt="Petak untuk Garden Journal"><br><b>Nur Azizah</b><br><code>2506547935</code><br><b>PIC Garden Journal</b><br><code>GardenJournal</code></td>
    <td align="center" width="20%"><img src="docs/readme/petak-seed.png" width="120" alt="Petak untuk Seed Exchange"><br><b>Rheina Uliana</b><br><code>2506600801</code><br><b>PIC Seed Exchange</b><br><code>SeedExchange</code></td>
  </tr>
</table>

---

## Pengungkapan Penggunaan AI

Pengembangan EcoPatch, termasuk aplikasi mobile ini, melibatkan beberapa tools berbasis AI untuk implementasi, debugging, perancangan antarmuka, dan dokumentasi. **Seluruh anggota tim menggunakan AI**, tetapi pola dan tingkat pemakaiannya berbeda antaranggota dan antarmodul. Keputusan tentang perilaku fitur, aturan akses, desain, dan perubahan yang dipertahankan tetap dibuat anggota tim.

<details>
<summary><b>1. Tools AI dan perannya</b></summary>

<br>

| Tool | Digunakan oleh | Peran umum |
| --- | --- | --- |
| Claude Code | Nurul Fikryati Bena, Salwa Alifia Putri | Asisten coding berbasis agent |
| Codex | Haikal Rafka A Rahman | Asisten coding berbasis agent |
| Google Antigravity | Nur Azizah | Asisten coding berbasis agent |
| Figma Agent | Salwa Alifia Putri, Nur Azizah | Dukungan perancangan antarmuka |
| DeepSeek | Rheina Uliana | Asisten coding berbasis agent |
| ChatGPT / GPT | Percakapan proyek | Penjelasan konsep Flutter dan Django, pembacaan kode, debugging, pengujian, dan penyusunan dokumentasi |

Pemetaan tools per anggota berasal dari laporan tim. Rincian tugas per anggota untuk Claude Code, Codex, Antigravity, dan Figma Agent belum terdokumentasi.

</details>

<details>
<summary><b>2. Area yang dibantu AI</b></summary>

<br>

Tabel ini memetakan aktivitas yang tercatat. Bukan berarti seluruh kode pada area tersebut ditulis AI.

| Area | Contoh aktivitas |
| --- | --- |
| Kerangka aplikasi Flutter | Struktur folder per modul, shell navigasi bottom tab dan drawer, serta `IndexedStack` agar posisi daftar tidak hilang |
| Tema dan tampilan | Token warna di `lib/theme/app_colors.dart` yang diselaraskan dengan CSS web, tema Material 3, dan komponen bersama seperti drawer |
| Halaman per modul | Placeholder tiap modul beserta nama PIC, kartu ringkasan, dan susunan yang akan diisi data dari API |
| Integrasi API | Rancangan pemanggilan Django REST Framework, pemetaan JSON ke model Dart, penanganan memuat, galat, dan tarik-untuk-menyegarkan |
| Testing & debugging | Menelusuri error `flutter analyze` dan `flutter test`, memeriksa versi Flutter, serta membaca perubahan `pubspec.lock` dan file generated |
| Git dan dokumentasi | Branch, commit, dan penyesuaian README mobile agar konsisten dengan README web |

</details>

<details>
<summary><b>3. Strategi prompt dan alur kerja</b></summary>

<br>

| Strategi | Contoh |
| --- | --- |
| Konteks proyek lebih dulu | Agent diminta membaca README, struktur `lib/`, dan repo web sebelum mengubah satu modul, supaya penamaan dan alur data tetap sama |
| Satu modul, satu folder | Pekerjaan dibatasi pada folder modul yang ditugaskan, dan file bersama seperti `main.dart` atau `app_colors.dart` hanya disentuh kalau memang perlu |
| Screenshot dan referensi visual | Tampilan web dipakai sebagai acuan warna, jarak, dan bentuk kartu, lalu selisihnya ditunjukkan lewat screenshot |
| Rencana dulu, baru eksekusi | Untuk perubahan besar, agent menyusun rencana yang disetujui anggota sebelum mengubah kode |
| Batasan ruang lingkup | Menetapkan branch kerja, file yang boleh diubah, dan format pesan commit. Commit dan push hanya dilakukan setelah diminta |
| Iterasi dari hasil pengujian | Melaporkan gejala yang terlihat di aplikasi, lalu meminta revisi terarah setelah dicek ulang di emulator atau perangkat |

</details>

<details>
<summary><b>4. Review manusia, implementasi, dan verifikasi</b></summary>

<br>

- **Pemeriksaan di aplikasi:** anggota menjalankan aplikasi, membandingkan tampilan dengan referensi web dan Figma, lalu melaporkan perbedaannya.
- **Koreksi lanjutan:** jarak, ukuran ikon, dan susunan kartu diperbaiki bertahap setelah dilihat langsung di layar ponsel.
- **Pencocokan dengan backend:** nama field, tipe data, dan aturan akses dicocokkan dengan model serta endpoint di repo web, supaya aplikasi tidak memakai data yang tidak ada.
- **Pengujian otomatis:** `flutter analyze` dan `flutter test` dijalankan sebelum perubahan dianggap selesai.
- **Review sebelum merge:** perubahan masuk lewat pull request dan diperiksa anggota lain, termasuk tampilan di ponsel.

Test otomatis tidak menggantikan pemeriksaan visual. Riwayat commit juga tidak membuktikan apakah suatu baris ditulis manusia atau AI, karena sebagian commit dijalankan agent atas instruksi anggota.

</details>

<details>
<summary><b>5. Keterbatasan AI dan perbaikan manual</b></summary>

<br>

Ini bagian yang paling penting: AI tidak selalu benar, dan perbaikannya dikerjakan atau diverifikasi manusia.

| Temuan | Cara diketahui dan tindakan korektif |
| --- | --- |
| Repo mobile dan web punya versi Flutter dan Django yang berbeda, sehingga `flutter pub get` mengubah `pubspec.lock` dan file `generated_plugin_registrant` di beberapa platform | Terlihat dari `git status` setelah `pub get`. Perubahan file generated dipisahkan dari perubahan fitur dan tidak di-commit sembarangan |
| Klaim "sudah selesai" pada bagian yang masih placeholder | Diperiksa dengan membuka aplikasi. README diberi bagian status supaya dokumen tidak menjanjikan fitur yang belum ada |
| Tampilan mobile mudah menyimpang dari web karena satuan CSS tidak sama dengan satuan Flutter | Dibandingkan dengan screenshot web, lalu token warna dan jarak disamakan di `app_colors.dart` dan widget terkait |
| Perubahan menyentuh file bersama di luar modul | Ditemukan saat membaca diff, lalu dikembalikan. File bersama hanya diubah setelah disepakati |
| Agent menyatakan working tree "bersih" padahal ada perubahan yang belum di-commit | Terlihat dari keluaran `git status` pada langkah berikutnya. Pelajarannya: status Git dibaca dari keluaran perintah, bukan dari ingatan agent |

Pelajaran utamanya: instruksi eksplisit tetap perlu diperiksa pada hasil aktual, kecocokan visual membutuhkan penilaian manusia, dan klaim agent tentang keadaan repo atau perangkat harus dicek ulang.

</details>

<details>
<summary><b>6. Dokumentasi prompt</b></summary>

<br>

> AI digunakan sebagai alat bantu untuk eksplorasi, implementasi, debugging, dan dokumentasi. Kesesuaian dengan requirement, keputusan desain dan arsitektur, pemeriksaan hasil, serta tanggung jawab atas kualitas akhir tetap berada pada anggota tim.

</details>

---

<br>

<div align="center">

**Small Spaces, Greener Living**

Dibuat dengan Flutter · Proyek Akhir Semester PBP Gasal 2026/2027

</div>

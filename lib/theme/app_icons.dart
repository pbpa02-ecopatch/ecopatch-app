/// Daftar modul EcoPatch beserta ikon, judul, dan endpoint-nya.
///
/// Ikonnya berasal dari `templates/header.html` repo web (SVG garis 24×24 dengan
/// sentuhan daun hijau, air biru, dan penanda amber). Versi `on_brand` adalah
/// ikon yang sama dengan garis putih dan sentuhan krem, dipakai di atas pil hijau
/// seperti menu samping web.
enum EcoModule {
  plantLibrary(
    label: 'Plant Library',
    shortLabel: 'Library',
    icon: 'plant_library',
    heading: 'Cari tanaman yang cocok',
    description:
        'Katalog tanaman dengan filter cahaya, ruang, dan tingkat perawatan, plus rekomendasi untuk tiap EcoPatch.',
    endpoint: '/plants/api/',
    endpoints: [
      'GET /plants/api/ (Katalog 60 tanaman & filter)',
      'GET /plants/api/<id>/ (Detail spesifikasi tanaman)',
      'GET /plants/api/recommendations/ (Rekomendasi per petak)',
    ],
  ),
  myEcoPatch(
    label: 'My EcoPatch',
    shortLabel: 'Patch',
    icon: 'my_ecopatch',
    heading: 'Kelola kebun virtualmu',
    description:
        'Buat EcoPatch, tambahkan tanaman dari Plant Library, lalu pantau status tiap tanaman sampai panen.',
    endpoint: '/my-ecopatch/api/',
    endpoints: [
      'GET /my-ecopatch/api/ (Daftar kebun virtual user)',
      'POST /my-ecopatch/api/ (Buat kebun baru)',
      'GET/POST /my-ecopatch/api/<id>/plants/ (Kelola tanaman)',
    ],
  ),
  smartCare(
    label: 'Smart Care',
    shortLabel: 'Care',
    icon: 'smart_care',
    heading: 'Rawat tanaman tepat waktu',
    description:
        'Daftar tugas perawatan harian, pengingat, dan prakiraan cuaca tujuh hari dari Open-Meteo.',
    endpoint: '/smart-care/api/care-tasks/',
    endpoints: [
      'GET /smart-care/api/care-tasks/ (Daftar tugas perawatan)',
      'POST /smart-care/api/care-tasks/ (Buat tugas manual)',
      'POST /smart-care/api/care-tasks/<id>/complete/ (Toggle selesai)',
      'GET /smart-care/api/weather/ (Prakiraan cuaca Open-Meteo)',
    ],
  ),
  gardenJournal(
    label: 'Garden Journal',
    shortLabel: 'Journal',
    icon: 'garden_journal',
    heading: 'Catat pertumbuhan tanaman',
    description:
        'Buku jurnal per tanaman: catatan harian, kondisi, tinggi tanaman, dan foto sebagai pembanding.',
    endpoint: '/journal/api/',
    endpoints: [
      'GET /journal/api/ (Daftar catatan jurnal user)',
      'POST /journal/api/ (Tambah catatan jurnal baru)',
      'GET /journal/api/books/ (Daftar buku per tanaman)',
      'GET/PATCH/DELETE /journal/api/<id>/ (Detail & aksi jurnal)',
    ],
  ),
  seedExchange(
    label: 'Seed Exchange',
    shortLabel: 'Exchange',
    icon: 'seed_exchange',
    heading: 'Bagikan dan tukar bibit',
    description:
        'Listing benih dan bibit dari anggota lain, lengkap dengan alur booking sampai pertukaran selesai.',
    endpoint: '/seed-exchange/api/',
    endpoints: [
      'GET /seed-exchange/api/ (Jelajahi listing benih/bibit)',
      'POST /seed-exchange/api/ (Buat tawaran barter/donasi)',
      'POST /seed-exchange/api/<id>/book/ (Ajukan booking bibit)',
    ],
  );

  const EcoModule({
    required this.label,
    required this.shortLabel,
    required this.icon,
    required this.heading,
    required this.description,
    required this.endpoint,
    required this.endpoints,
  });

  final String label;

  /// Label pendek untuk bottom navigation.
  final String shortLabel;

  /// Nama berkas tanpa ekstensi di `assets/icons/`.
  final String icon;

  final String heading;
  final String description;
  final String endpoint;
  final List<String> endpoints;

  String get iconAsset => 'assets/icons/$icon.svg';

  String get iconOnBrandAsset => 'assets/icons/on_brand/$icon.svg';
}

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
    endpoints: [
      'GET /api/plants/ (Katalog 60 tanaman & filter)',
      'GET /api/plants/<id>/ (Detail spesifikasi tanaman)',
      'GET /api/plants/recommendations/?patch=<id> (Rekomendasi per EcoPatch)',
    ],
  ),
  myEcoPatch(
    label: 'My EcoPatch',
    shortLabel: 'Patch',
    icon: 'my_ecopatch',
    heading: 'Kelola kebun virtualmu',
    description:
        'Buat EcoPatch, tambahkan tanaman dari Plant Library, lalu pantau status tiap tanaman sampai panen.',
    endpoints: [
      'GET /api/ecopatches/ (Daftar kebun virtual user)',
      'POST /api/ecopatches/ (Buat kebun baru)',
      'GET/POST /api/ecopatches/<id>/plants/ (Kelola tanaman)',
    ],
  ),
  smartCare(
    label: 'Smart Care',
    shortLabel: 'Care',
    icon: 'smart_care',
    heading: 'Rawat tanaman tepat waktu',
    description:
        'Daftar tugas perawatan harian, pengingat, dan prakiraan cuaca tujuh hari dari Open-Meteo.',
    endpoints: [
      'GET /api/care-tasks/ (Daftar tugas perawatan)',
      'POST /api/care-tasks/ (Buat tugas manual)',
      'POST /api/care-tasks/<id>/complete/ (Tandai selesai)',
      'GET /api/weather/ (Prakiraan cuaca Open-Meteo)',
    ],
  ),
  gardenJournal(
    label: 'Garden Journal',
    shortLabel: 'Journal',
    icon: 'garden_journal',
    heading: 'Catat pertumbuhan tanaman',
    description:
        'Buku jurnal per tanaman: catatan harian, kondisi, tinggi tanaman, dan foto sebagai pembanding.',
    endpoints: [
      'GET /api/journals/ (Daftar catatan jurnal user)',
      'POST /api/journals/ (Tambah catatan jurnal baru)',
      'GET /api/journals/books/ (Daftar buku per tanaman)',
      'GET/PATCH/DELETE /api/journals/<id>/ (Detail & aksi jurnal)',
    ],
  ),
  seedExchange(
    label: 'Seed Exchange',
    shortLabel: 'Exchange',
    icon: 'seed_exchange',
    heading: 'Bagikan dan tukar bibit',
    description:
        'Listing benih dan bibit dari anggota lain, lengkap dengan alur booking sampai pertukaran selesai.',
    endpoints: [
      'GET /api/seeds/ (Jelajahi listing benih/bibit)',
      'POST /api/seeds/ (Buat tawaran barter/donasi)',
      'POST /api/seeds/<id>/book/ (Ajukan booking bibit)',
    ],
  );

  const EcoModule({
    required this.label,
    required this.shortLabel,
    required this.icon,
    required this.heading,
    required this.description,
    required this.endpoints,
  });

  final String label;

  /// Label pendek untuk bottom navigation.
  final String shortLabel;

  /// Nama berkas tanpa ekstensi di `assets/icons/`.
  final String icon;

  final String heading;
  final String description;
  final List<String> endpoints;

  String get iconAsset => 'assets/icons/$icon.svg';

  String get iconOnBrandAsset => 'assets/icons/on_brand/$icon.svg';
}

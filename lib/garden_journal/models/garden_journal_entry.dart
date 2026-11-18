import 'dart:convert';

/// Model Dart untuk representasi catatan jurnal dari REST API DRF (`/journal/api/`).
class GardenJournalEntry {
  final int id;
  final String? username;
  final int? ecopatch;
  final String ecopatchName;
  final String plantName;
  final DateTime date;
  final String title;
  final String notes;
  final String plantCondition;
  final String plantConditionDisplay;
  final double? plantHeight;
  final String coverPattern;
  final String coverPatternDisplay;
  final String coverColor;
  final String? image;
  final String? badgeColor;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GardenJournalEntry({
    required this.id,
    this.username,
    this.ecopatch,
    required this.ecopatchName,
    required this.plantName,
    required this.date,
    required this.title,
    required this.notes,
    required this.plantCondition,
    required this.plantConditionDisplay,
    this.plantHeight,
    required this.coverPattern,
    required this.coverPatternDisplay,
    required this.coverColor,
    this.image,
    this.badgeColor,
    this.createdAt,
    this.updatedAt,
  });

  factory GardenJournalEntry.fromJson(Map<String, dynamic> json) {
    return GardenJournalEntry(
      id: json['id'] as int,
      username: json['username'] as String?,
      ecopatch: json['ecopatch'] as int?,
      ecopatchName: json['ecopatch_name'] as String? ?? '',
      plantName: json['plant_name'] as String? ?? '',
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      plantCondition: json['plant_condition'] as String? ?? 'healthy',
      plantConditionDisplay: json['plant_condition_display'] as String? ?? 'Healthy',
      plantHeight: json['plant_height'] != null
          ? (json['plant_height'] as num).toDouble()
          : null,
      coverPattern: json['cover_pattern'] as String? ?? 'flowers',
      coverPatternDisplay: json['cover_pattern_display'] as String? ?? 'Flowers',
      coverColor: json['cover_color'] as String? ?? '',
      image: json['image'] as String?,
      badgeColor: json['badge_color'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'ecopatch': ecopatch,
      'ecopatch_name': ecopatchName,
      'plant_name': plantName,
      'date': "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      'title': title,
      'notes': notes,
      'plant_condition': plantCondition,
      'plant_height': plantHeight,
      'cover_pattern': coverPattern,
      'cover_color': coverColor,
      'image': image,
    };
  }

  static List<GardenJournalEntry> fromJsonList(String str) {
    final List<dynamic> data = json.decode(str) as List<dynamic>;
    return data.map((x) => GardenJournalEntry.fromJson(x as Map<String, dynamic>)).toList();
  }
}

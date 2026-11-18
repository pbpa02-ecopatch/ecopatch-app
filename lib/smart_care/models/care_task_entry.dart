import 'dart:convert';

/// Model Dart untuk representasi tugas perawatan dari REST API DRF (`/smart-care/api/care-tasks/`).
class CareTaskEntry {
  final int id;
  final String plantName;
  final String taskType;
  final String taskTypeDisplay;
  final DateTime dueDate;
  final String notes;
  final bool isOutdoor;
  final String status;
  final String statusDisplay;
  final String source;
  final DateTime? completedAt;
  final DateTime? createdAt;
  final bool isOverdue;

  CareTaskEntry({
    required this.id,
    required this.plantName,
    required this.taskType,
    required this.taskTypeDisplay,
    required this.dueDate,
    required this.notes,
    required this.isOutdoor,
    required this.status,
    required this.statusDisplay,
    required this.source,
    this.completedAt,
    this.createdAt,
    required this.isOverdue,
  });

  bool get isCompleted => status == 'completed';

  factory CareTaskEntry.fromJson(Map<String, dynamic> json) {
    return CareTaskEntry(
      id: json['id'] as int,
      plantName: json['plant_name'] as String? ?? '',
      taskType: json['task_type'] as String? ?? 'watering',
      taskTypeDisplay: json['task_type_display'] as String? ?? 'Penyiraman',
      dueDate: DateTime.parse(json['due_date'] as String),
      notes: json['notes'] as String? ?? '',
      isOutdoor: json['is_outdoor'] as bool? ?? true,
      status: json['status'] as String? ?? 'pending',
      statusDisplay: json['status_display'] as String? ?? 'Belum selesai',
      source: json['source'] as String? ?? 'manual',
      completedAt: json['completed_at'] != null
          ? DateTime.tryParse(json['completed_at'] as String)
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      isOverdue: json['is_overdue'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'plant_name': plantName,
      'task_type': taskType,
      'due_date': "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
      'notes': notes,
    };
  }

  static List<CareTaskEntry> fromJsonList(String str) {
    final List<dynamic> data = json.decode(str) as List<dynamic>;
    return data.map((x) => CareTaskEntry.fromJson(x as Map<String, dynamic>)).toList();
  }
}

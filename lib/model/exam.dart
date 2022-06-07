// ignore_for_file: prefer_if_null_operators

import '../shared/constance.dart';

class ExamModel {
  final Exam? exam;
  final int? status;
  final String? error;
  // "public/Image/StudyExam/"

  ExamModel({this.exam, this.status, this.error});

  ExamModel.fromJson(Map<String, dynamic> json)
      : exam = json['exam'] != null
            ? Exam.fromJson(json['exam'] as Map<String, dynamic>)
            : null,
        error = json['error'] != null ? json['error'] : null,
        status = json['status'] ?? 500;

  Map<String, dynamic> toJson() => {
        'exam': exam != null ? exam : null,
        'status': status,
        'error': error != null ? error : null,
      };
}

class Exam {
  final int? id;
  final String? exam;

  Exam({this.id, this.exam});

  Exam.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        exam = imageUrl + json['image'];

  toJson() => {
        'id': id,
        'exam': exam,
      };
}

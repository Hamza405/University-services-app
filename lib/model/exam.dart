// ignore_for_file: prefer_if_null_operators

class ExamModel {
  final Exam? exam;
  final int? status;
  final String? error;

  ExamModel({this.exam, this.status, this.error});

  ExamModel.fromJson(Map<String, dynamic> json)
      : exam = json['exam'] != null ? json['exam'] : null,
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
        exam = json['exam'];

  toJson() => {
        'id': id,
        'exam': exam,
      };
}

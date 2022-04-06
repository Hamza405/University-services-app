// ignore_for_file: prefer_if_null_operators

class MarkModel {
  final List<Mark>? marks;
  final int? status;
  final String? error;

  MarkModel({this.marks, this.status, this.error});

  MarkModel.fromJson(Map<String, dynamic> json)
      : marks = List<Mark>.from((json["marks"] as Iterable)
            .map((x) => Mark.fromJson(x as Map<String, dynamic>))),
        error = json['error'] != null ? json['error'] : null,
        status = json['status'] ?? 500;

  Map<String, dynamic> toJson() => {
        'ads': marks != null ? marks : null,
        'status': status,
        'error': error != null ? error : null,
      };
}

class Mark {
  int? id;
  int? userId;
  int? subjectId;
  String? subjectName;
  int? th;
  int? pr;
  String? result;
  String? year;
  String? semester;
  DateTime? created_at;

  Mark(
      {this.id,
      this.userId,
      this.subjectId,
      this.subjectName = '',
      this.th,
      this.pr,
      this.result,
      this.year,
      this.semester,
      this.created_at});

  Mark.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    subjectId = json['subjectId'];
    th = json['th'];
    pr = json['pr'];
    result = json['result'];
    year = json['year'];
    semester = json['semester'];
    created_at = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['subjectId'] = this.subjectId;
    data['th'] = this.th;
    data['pr'] = this.pr;
    data['result'] = this.result;
    data['year'] = this.year;
    data['semester'] = this.semester;
    data['created_at'] = this.created_at;
    return data;
  }
}

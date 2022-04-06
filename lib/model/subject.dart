// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names

class SubjectModel {
  final List<Subject>? subjects;
  final int? status;
  final String? error;

  SubjectModel({this.subjects, this.status, this.error});

  SubjectModel.fromJson(Map<String, dynamic> json)
      : subjects = List<Subject>.from((json["subjects"] as Iterable)
            .map((x) => Subject.fromJson(x as Map<String, dynamic>))),
        error = json['error'] != null ? json['error'] : null,
        status = json['status'] ?? 500;

  Map<String, dynamic> toJson() => {
        'subjects': subjects != null ? subjects : null,
        'status': status,
        'error': error != null ? error : null,
      };
}

class Subject {
  final int? id;
  final String? name;
  final String? year;
  final String? semester;
  final DateTime? created_at;

  Subject({this.id, this.name, this.semester, this.year, this.created_at});

  Subject.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        year = json['year'],
        semester = json['semester'],
        created_at = json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'year': year,
        'semester': semester,
        'created_at': created_at,
      };
}

class StudyProgramModel {
  final List<StudyProgram>? studyProgram;
  final int? status;
  final String? error;

  StudyProgramModel(this.studyProgram, this.status, this.error);

  StudyProgramModel.fromJson(Map<String, dynamic> json)
      : studyProgram = List<StudyProgram>.from(
            (json["studyProgram"] as Iterable)
                .map((x) => StudyProgram.fromJson(x as Map<String, dynamic>))),
        error = json['error'] != null ? json['error'] : null,
        status = json['status'] ?? 500;

  Map<String, dynamic> toJson() => {
        'studyProgram': studyProgram != null ? studyProgram : null,
        'status': status,
        'error': error != null ? error : null,
      };
}

class StudyProgram {
  final int? id;
  final String? day;
  final String? year1;
  final String? year2;
  final String? year3;
  final String? year4;
  final String? year5;
  final DateTime? created_at;

  StudyProgram(this.id, this.day, this.year1, this.year2, this.year3,
      this.year4, this.year5, this.created_at);

  StudyProgram.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        day = json['day'],
        year1 = json['year1'],
        year2 = json['year2'],
        year3 = json['year3'],
        year4 = json['year4'],
        year5 = json['year5'],
        created_at = json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'day': day,
        'year1': year1,
        'year2': year2,
        'year3': year3,
        'year4': year4,
        'year5': year5,
        'created_at': created_at,
      };
}

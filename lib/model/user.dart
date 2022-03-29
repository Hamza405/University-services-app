class UserModel {
  String? id;
  String? uid;
  String? name;
  String? email;
  String? number;
  int? year;
  String? section;
  String? created_at;

  UserModel(
      {this.id,
      this.uid,
      this.name,
      this.email,
      this.number,
      this.year = 1,
      this.section = 'حاسبات',
      this.created_at});

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        uid = json['uid'],
        name = json['name'],
        email = json['email'],
        number = json['number'],
        year = json['year'],
        section = json['section'],
        created_at = json['created_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'uid': uid,
        'name': name,
        'email': email,
        'number': number,
        'year': year,
        'section': section,
        'created_at': created_at,
      };
}

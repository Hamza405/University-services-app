// ignore_for_file: prefer_if_null_operators

class UserModel {
  final String? token;
  User? user;
  final String? error;
  final int? status;

  UserModel({this.token, this.user, this.error, this.status});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] != null ? json['token'] : null,
      error: json['error'] != null ? json['error'] : null,
      status: json['status'] != null ? json['status'] : 500,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'error': error,
        'status': status,
        'user': user != null ? user!.toJson() : null,
      };
}

class User {
  int? id;
  String? name;
  String? email;
  String? num;
  String? year;
  String? section;
  String? createdAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.num,
      this.year,
      this.section,
      this.createdAt});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        num = json['num'],
        year = json['year'],
        section = json['section'],
        createdAt = json['created_at'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'num': num,
        'year': year,
        'section': section,
        'created_at': createdAt,
      };
}

class AuthCommand {
  String? name;
  String? email;
  String? num;
  String? year;
  String? section;
  String? gender;
  String? password;

  AuthCommand({
    this.name,
    this.email,
    this.gender = 'ذكر',
    this.password,
    this.num,
    this.year = '1',
    this.section = 'حاسبات',
  });

  AuthCommand.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        gender = json['gender'],
        email = json['email'],
        password = json['password'],
        num = json['num'],
        year = json['year'],
        section = json['section'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'gender': gender,
        'num': num,
        'year': year,
        'section': section,
      };
}

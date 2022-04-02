// ignore_for_file: prefer_if_null_operators

class AdsModel {
  final List<Ads>? ads;
  final int? status;
  final String? error;

  AdsModel({this.ads, this.status, this.error});

  AdsModel.fromJson(Map<String, dynamic> json)
      : ads = List<Ads>.from((json["ads"] as Iterable)
            .map((x) => Ads.fromJson(x as Map<String, dynamic>))),
        error = json['error'] != null ? json['error'] : null,
        status = json['status'] ?? 500;

  Map<String, dynamic> toJson() => {
        'ads': ads != null ? ads : null,
        'status': status,
        'error': error != null ? error : null,
      };
}

class Ads {
  final int? id;
  final String? section;
  final String? description;
  final DateTime? created_at;

  Ads({this.id, this.section, this.description, this.created_at});

  Ads.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        section = json['section'],
        description = json['description'],
        created_at = json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'section': section,
        'description': description,
        'created_at': created_at,
      };
}

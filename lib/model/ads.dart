class AdsModel {
  final List<Ads>? ads;
  final int? status;

  AdsModel({this.ads, this.status});

  AdsModel.fromJson(Map<String, dynamic> json)
      : ads = List<Ads>.from((json["ads"] as Iterable)
            .map((x) => Ads.fromJson(x as Map<String, dynamic>))),
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'ads': ads != null ? ads : null,
        'status': status,
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

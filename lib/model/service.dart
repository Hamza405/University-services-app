// ignore_for_file: prefer_if_null_operators

class ServiceModel {
  final List<Service>? services;
  final int? status;
  final String? error;

  ServiceModel({this.services, this.status, this.error});

  ServiceModel.fromJson(Map<String, dynamic> json)
      : services = List<Service>.from((json["services"] as Iterable)
            .map((x) => Service.fromJson(x as Map<String, dynamic>))),
        error = json['error'] != null ? json['error'] : null,
        status = json['status'] ?? 500;

  Map<String, dynamic> toJson() => {
        'services': services != null ? services : null,
        'status': status,
        'error': error != null ? error : null,
      };
}

class Service {
  final int? id;
  final String? serviceName;

  Service({this.id, this.serviceName});

  Service.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        serviceName = json['serviceName'];

  toJson() => {
        'id': id,
        'serviceName': serviceName,
      };
}

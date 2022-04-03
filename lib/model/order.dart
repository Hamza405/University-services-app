// ignore_for_file: prefer_if_null_operators

class OrderModel {
  final Order? order;
  final List<Order>? myOrder;
  final int? status;
  final String? error;

  OrderModel({this.order, this.status, this.myOrder, this.error});

  OrderModel.fromJson(Map<String, dynamic> json)
      : order = json['order'] != null
            ? Order.fromJson(json['order'] as Map<String, dynamic>)
            : null,
        myOrder = json['myOrder'] != null
            ? List<Order>.from((json["myOrder"] as Iterable)
                .map((x) => Order.fromJson(x as Map<String, dynamic>)))
            : null,
        error = json['error'] != null ? json['error'] : null,
        status = json['status'] ?? 500;

  Map<String, dynamic> toJson() => {
        'order': order != null ? order : null,
        'myOrder': myOrder != null ? myOrder : null,
        'status': status,
        'error': error != null ? error : null,
      };
}

class Order {
  final int? id;
  final String? serviceId;
  final int? state;
  final DateTime? deadline;
  final DateTime? created_at;

  Order({this.id, this.serviceId, this.deadline, this.state, this.created_at});

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        serviceId = json['serviceID'],
        state = json['state'],
        deadline =
            json['deadline'] != null ? DateTime.parse(json['deadline']) : null,
        created_at = json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null;

  toJson() => {
        'id': id,
        'serviceID': serviceId,
        'state': state,
        'deadline': deadline,
        'created_at': created_at,
      };
}

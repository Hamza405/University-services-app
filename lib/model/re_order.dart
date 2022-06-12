// ignore_for_file: prefer_if_null_operators

class ReOrderModel {
  final ReOrder? order;
  final List<ReOrder>? myOrder;
  final int? status;
  final String? error;

  ReOrderModel({this.order, this.status, this.myOrder, this.error});

  ReOrderModel.fromJson(Map<String, dynamic> json)
      : order = json['order'] != null
            ? ReOrder.fromJson(json['order'] as Map<String, dynamic>)
            : null,
        myOrder = json['reorders'] != null
            ? List<ReOrder>.from((json["reorders"] as Iterable)
                .map((x) => ReOrder.fromJson(x as Map<String, dynamic>)))
            : null,
        error = json['error'] != null ? json['error'] : null,
        status = json['status'] ?? 500;

  Map<String, dynamic> toJson() => {
        'order': order != null ? order : null,
        'reorders': myOrder != null ? myOrder : null,
        'status': status,
        'error': error != null ? error : null,
      };
}

class ReOrder {
  final int? id;
  final String? userId;
  final String? subjectId;
  final DateTime? deadline;
  final DateTime? created_at;

  ReOrder(
      {this.id, this.userId, this.subjectId, this.deadline, this.created_at});

  ReOrder.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userID'],
        subjectId = json['subjectID'],
        deadline =
            json['deadline'] != null ? DateTime.parse(json['deadline']) : null,
        created_at = json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null;

  toJson() => {
        'id': id,
        'userId': userId,
        'subjectId': subjectId,
        'deadline': deadline,
        'created_at': created_at,
      };
}

class PaymentOrderModel {
  final int? id;
  final String? name;
  final bool? canDelete;

  PaymentOrderModel({
    this.id,
    this.name,
    this.canDelete,
  });

  PaymentOrderModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        canDelete = json['canDelete'] as bool?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'canDelete': canDelete};
}

class FormPayment {
  int? paymentWayId;
  String? note;
  String? date;

  FormPayment({
    this.paymentWayId,
    this.note,
    this.date,
  });

  FormPayment.fromJson(Map<String, dynamic> json)
      : paymentWayId = json['paymentWayId'] as int?,
        note = json['note'] as String?,
        date = json['date'] as String?;

  Map<String, dynamic> toJson() =>
      {'paymentWayId': paymentWayId, 'note': note, 'date': date};
}

class CPaymentRequestModel {
  final int? total;
  final List<Dto>? dto;

  CPaymentRequestModel({
    this.total,
    this.dto,
  });

  CPaymentRequestModel.fromJson(Map<String, dynamic> json)
      : total = json['total'] as int?,
        dto = (json['dto'] as List?)
            ?.map((dynamic e) => Dto.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'total': total, 'dto': dto?.map((e) => e.toJson()).toList()};
}

class Dto {
  final int? id;
  final String? note;
  final dynamic accept;
  final String? createDate;
  final dynamic client;
  final PaymentWay? paymentWay;

  Dto({
    this.id,
    this.note,
    this.accept,
    this.createDate,
    this.client,
    this.paymentWay,
  });

  Dto.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        note = json['note'] as String?,
        accept = json['accept'],
        createDate = json['createDate'] as String?,
        client = json['client'],
        paymentWay = (json['paymentWay'] as Map<String, dynamic>?) != null
            ? PaymentWay.fromJson(json['paymentWay'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'note': note,
        'accept': accept,
        'createDate': createDate,
        'client': client,
        'paymentWay': paymentWay?.toJson()
      };
}

class PaymentWay {
  final int? id;
  final String? name;
  final bool? canDelete;

  PaymentWay({
    this.id,
    this.name,
    this.canDelete,
  });

  PaymentWay.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        canDelete = json['canDelete'] as bool?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'canDelete': canDelete};
}

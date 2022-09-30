class StatementsModel {
  final int? id;
  final num? printNmber;
  final String? printerName;
  final String? date;
  final String? destinationName;
  final String? destinationPhone;
  final List<Orders>? orders;
  final List<Receipts>? receipts;
  final dynamic discount;

  StatementsModel({
    this.id,
    this.printNmber,
    this.printerName,
    this.date,
    this.destinationName,
    this.destinationPhone,
    this.orders,
    this.receipts,
    this.discount,
  });

  StatementsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        printNmber = json['printNmber'],
        printerName = json['printerName'] as String?,
        date = json['date'] as String?,
        destinationName = json['destinationName'] as String?,
        destinationPhone = json['destinationPhone'] as String?,
        orders = (json['orders'] as List?)
            ?.map((dynamic e) => Orders.fromJson(e as Map<String, dynamic>))
            .toList(),
        receipts = (json['receipts'] as List?)
            ?.map((dynamic e) => Receipts.fromJson(e as Map<String, dynamic>))
            .toList(),
        discount = json['discount'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'printNmber': printNmber,
        'printerName': printerName,
        'date': date,
        'destinationName': destinationName,
        'destinationPhone': destinationPhone,
        'orders': orders?.map((e) => e.toJson()).toList(),
        'receipts': receipts?.map((e) => e.toJson()).toList(),
        'discount': discount
      };
}

class Orders {
  final String? code;
  final num? total;
  final String? phone;
  final String? country;
  final dynamic lastTotal;
  final dynamic clientNote;
  final num? deliveCost;
  final dynamic clientName;
  final dynamic note;
  final dynamic region;
  final String? date;
  final num? moneyPlacedId;
  final num? orderPlacedId;
  final num? payForClient;
  final dynamic orderplaced;

  Orders({
    this.code,
    this.total,
    this.phone,
    this.country,
    this.lastTotal,
    this.clientNote,
    this.deliveCost,
    this.clientName,
    this.note,
    this.region,
    this.date,
    this.moneyPlacedId,
    this.orderPlacedId,
    this.payForClient,
    this.orderplaced,
  });

  Orders.fromJson(Map<String, dynamic> json)
      : code = json['code'] as String?,
        total = json['total'],
        phone = json['phone'] as String?,
        country = json['country'] as String?,
        lastTotal = json['lastTotal'],
        clientNote = json['clientNote'],
        deliveCost = json['deliveCost'],
        clientName = json['clientName'],
        note = json['note'],
        region = json['region'],
        date = json['date'] as String?,
        moneyPlacedId = json['moneyPlacedId'],
        orderPlacedId = json['orderPlacedId'],
        payForClient = json['payForClient'],
        orderplaced = json['orderplaced'];

  Map<String, dynamic> toJson() => {
        'code': code,
        'total': total,
        'phone': phone,
        'country': country,
        'lastTotal': lastTotal,
        'clientNote': clientNote,
        'deliveCost': deliveCost,
        'clientName': clientName,
        'note': note,
        'region': region,
        'date': date,
        'moneyPlacedId': moneyPlacedId,
        'orderPlacedId': orderPlacedId,
        'payForClient': payForClient,
        'orderplaced': orderplaced
      };
}

class Receipts {
  final int? id;
  final num? amount;
  final String? date;
  final String? note;
  final String? createdBy;
  final String? about;
  final String? manager;
  final bool? isPay;
  final int? printId;
  final dynamic clientName;
  final num? printNumber;

  Receipts({
    this.id,
    this.amount,
    this.date,
    this.note,
    this.createdBy,
    this.about,
    this.manager,
    this.isPay,
    this.printId,
    this.clientName,
    this.printNumber,
  });

  Receipts.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        amount = json['amount'],
        date = json['date'] as String?,
        note = json['note'] as String?,
        createdBy = json['createdBy'] as String?,
        about = json['about'] as String?,
        manager = json['manager'] as String?,
        isPay = json['isPay'] as bool?,
        printId = json['printId'] as int?,
        clientName = json['clientName'],
        printNumber = json['printNumber'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'date': date,
        'note': note,
        'createdBy': createdBy,
        'about': about,
        'manager': manager,
        'isPay': isPay,
        'printId': printId,
        'clientName': clientName,
        'printNumber': printNumber
      };
}

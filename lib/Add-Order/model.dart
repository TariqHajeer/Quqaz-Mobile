import 'package:get/get.dart';

class Countries {
  int? id;
  String? name;
  double? deliveryCost;
  bool? canDelete;
  bool? canDeleteWithRegion;
  bool? isMain;
  int? points;

  Countries({
    this.id,
    this.name,
    this.deliveryCost,
    this.canDelete,
    this.canDeleteWithRegion,
    this.isMain,
    this.points,
  });

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deliveryCost = json['deliveryCost'];
    canDelete = json['canDelete'];
    canDeleteWithRegion = json['canDeleteWithRegion'];
    isMain = json['isMain'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['deliveryCost'] = this.deliveryCost;
    data['canDelete'] = this.canDelete;
    data['canDeleteWithRegion'] = this.canDeleteWithRegion;
    data['isMain'] = this.isMain;
    data['points'] = this.points;
    return data;
  }
}

///////////////////////////////////////
///
///
class MyForm {
  String? code;
  int? countryId;
  String? address;
  String? recipientName;
  String? clientNote;
  double? cost;
  String? date;
  RxList<OrderItem>? orderItem = <OrderItem>[].obs;
  RxList<String>? recipientPhones = <String>[].obs;

  MyForm({
    this.code,
    this.countryId,
    this.address,
    this.recipientName,
    this.clientNote,
    this.cost,
    this.date,
    this.orderItem,
    this.recipientPhones,
  });
}

class OrderItem {
  String? orderTypeName;
  int? orderTypeId;
  int? count;

  OrderItem({this.orderTypeName, this.orderTypeId, this.count});

  OrderItem.fromJson(Map<String, dynamic> json) {
    orderTypeName = json['orderTypeName'];
    orderTypeId = json['orderTypeId'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderTypeName'] = this.orderTypeName;
    data['orderTypeId'] = this.orderTypeId;
    data['count'] = this.count;
    return data;
  }
}

class OrderTypeDtos {
  String? orderTypeName;
  int? orderTypeId;
  int? count;

  OrderTypeDtos({this.orderTypeName, this.orderTypeId, this.count});

  OrderTypeDtos.fromJson(Map<String, dynamic> json) {
    orderTypeName = json['orderTypeName'];
    orderTypeId = json['orderTypeId'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderTypeName'] = this.orderTypeName;
    data['orderTypeId'] = this.orderTypeId;
    data['count'] = this.count;
    return data;
  }
}

class OrderType {
  int? id;
  String? name;
  bool? canDelete;

  OrderType({this.id, this.name, this.canDelete});

  OrderType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    canDelete = json['canDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['canDelete'] = this.canDelete;
    return data;
  }
}

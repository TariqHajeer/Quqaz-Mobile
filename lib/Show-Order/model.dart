import 'package:quqaz/Add-Order/model.dart';

class COrderDModel {
  int? id;
  String? code;
  dynamic deliveryCost;
  dynamic cost;
  dynamic agentCost;
  dynamic oldCost;
  dynamic recipientName;
  String? recipientPhones;
  dynamic address;
  dynamic clientNote;
  String? createdBy;
  bool? seen;
  String? date;
  dynamic diliveryDate;
  dynamic note;
  bool? isClientDiliverdMoney;
  dynamic agentPrintNumber;
  dynamic clientPrintNumber;
  dynamic orderStateId;
  dynamic canResned;
  dynamic oldDeliveryCost;
  bool? isSend;
  dynamic client;
  Country? country;
  dynamic nextCountryDto;
  dynamic region;
  MonePlaced? monePlaced;
  Orderplaced? orderplaced;
  Agent? agent;
  List<OrderItems>? orderItems;
  List<dynamic>? orderLogs;
  List<AgentPrint>? agentPrint;
  List<ClientPrint>? clientPrint;
  dynamic path;
  int? currentCountry;

  COrderDModel({
    this.id,
    this.code,
    this.deliveryCost,
    this.cost,
    this.agentCost,
    this.oldCost,
    this.recipientName,
    this.recipientPhones,
    this.address,
    this.clientNote,
    this.createdBy,
    this.seen,
    this.date,
    this.diliveryDate,
    this.note,
    this.isClientDiliverdMoney,
    this.agentPrintNumber,
    this.clientPrintNumber,
    this.orderStateId,
    this.canResned,
    this.oldDeliveryCost,
    this.isSend,
    this.client,
    this.country,
    this.nextCountryDto,
    this.region,
    this.monePlaced,
    this.orderplaced,
    this.agent,
    this.orderItems,
    this.orderLogs,
    this.agentPrint,
    this.clientPrint,
    this.path,
    this.currentCountry,
  });

  COrderDModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    code = json['code'] as String?;
    deliveryCost = json['deliveryCost'];
    cost = json['cost'];
    agentCost = json['agentCost'];
    oldCost = json['oldCost'];
    recipientName = json['recipientName'];
    recipientPhones = json['recipientPhones'] as String?;
    address = json['address'];
    clientNote = json['clientNote'];
    createdBy = json['createdBy'] as String?;
    seen = json['seen'] as bool?;
    date = json['date'] as String?;
    diliveryDate = json['diliveryDate'];
    note = json['note'];
    isClientDiliverdMoney = json['isClientDiliverdMoney'] as bool?;
    agentPrintNumber = json['agentPrintNumber'] as int?;
    clientPrintNumber = json['clientPrintNumber'] as int?;
    orderStateId = json['orderStateId'] as int?;
    canResned = json['canResned'];
    oldDeliveryCost = json['oldDeliveryCost'];
    isSend = json['isSend'];
    client = json['client'];
    country = (json['country'] as Map<String, dynamic>?) != null
        ? Country.fromJson(json['country'] as Map<String, dynamic>)
        : null;
    nextCountryDto = json['nextCountryDto'];
    region = json['region'];
    monePlaced = (json['monePlaced'] as Map<String, dynamic>?) != null
        ? MonePlaced.fromJson(json['monePlaced'] as Map<String, dynamic>)
        : null;
    orderplaced = (json['orderplaced'] as Map<String, dynamic>?) != null
        ? Orderplaced.fromJson(json['orderplaced'] as Map<String, dynamic>)
        : null;
    agent = (json['agent'] as Map<String, dynamic>?) != null
        ? Agent.fromJson(json['agent'] as Map<String, dynamic>)
        : null;
    orderItems = (json['orderItems'] as List?)
        ?.map((dynamic e) => OrderItems.fromJson(e as Map<String, dynamic>))
        .toList();
    orderLogs = json['orderLogs'] as List?;
    agentPrint = (json['agentPrint'] as List?)
        ?.map((dynamic e) => AgentPrint.fromJson(e as Map<String, dynamic>))
        .toList();
    clientPrint = (json['clientPrint'] as List?)
        ?.map((dynamic e) => ClientPrint.fromJson(e as Map<String, dynamic>))
        .toList();
    path = json['path'];
    currentCountry = json['currentCountry'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['code'] = code;
    json['deliveryCost'] = deliveryCost;
    json['cost'] = cost;
    json['agentCost'] = agentCost;
    json['oldCost'] = oldCost;
    json['recipientName'] = recipientName;
    json['recipientPhones'] = recipientPhones;
    json['address'] = address;
    json['clientNote'] = clientNote;
    json['createdBy'] = createdBy;
    json['seen'] = seen;
    json['date'] = date;
    json['diliveryDate'] = diliveryDate;
    json['note'] = note;
    json['isClientDiliverdMoney'] = isClientDiliverdMoney;
    json['agentPrintNumber'] = agentPrintNumber;
    json['clientPrintNumber'] = clientPrintNumber;
    json['orderStateId'] = orderStateId;
    json['canResned'] = canResned;
    json['oldDeliveryCost'] = oldDeliveryCost;
    json['isSend'] = isSend;
    json['client'] = client;
    json['country'] = country?.toJson();
    json['nextCountryDto'] = nextCountryDto;
    json['region'] = region;
    json['monePlaced'] = monePlaced?.toJson();
    json['orderplaced'] = orderplaced?.toJson();
    json['agent'] = agent?.toJson();
    json['orderItems'] = orderItems;
    json['orderLogs'] = orderLogs;
    json['agentPrint'] = agentPrint?.map((e) => e.toJson()).toList();
    json['clientPrint'] = clientPrint?.map((e) => e.toJson()).toList();
    json['path'] = path;
    json['currentCountry'] = currentCountry;
    return json;
  }
}

class Country {
  int? id;
  String? name;
  dynamic deliveryCost;
  bool? canDelete;
  bool? canDeleteWithRegion;
  bool? isMain;
  int? points;
  List<dynamic>? regions;
  List<dynamic>? agnets;
  dynamic mediator;

  Country({
    this.id,
    this.name,
    this.deliveryCost,
    this.canDelete,
    this.canDeleteWithRegion,
    this.isMain,
    this.points,
    this.regions,
    this.agnets,
    this.mediator,
  });

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    deliveryCost = json['deliveryCost'];
    canDelete = json['canDelete'] as bool?;
    canDeleteWithRegion = json['canDeleteWithRegion'] as bool?;
    isMain = json['isMain'] as bool?;
    points = json['points'] as int?;
    regions = json['regions'] as List?;
    agnets = json['agnets'] as List?;
    mediator = json['mediator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['deliveryCost'] = deliveryCost;
    json['canDelete'] = canDelete;
    json['canDeleteWithRegion'] = canDeleteWithRegion;
    json['isMain'] = isMain;
    json['points'] = points;
    json['regions'] = regions;
    json['agnets'] = agnets;
    json['mediator'] = mediator;
    return json;
  }
}

class MonePlaced {
  int? id;
  String? name;
  bool? canDelete;

  MonePlaced({
    this.id,
    this.name,
    this.canDelete,
  });

  MonePlaced.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    canDelete = json['canDelete'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['canDelete'] = canDelete;
    return json;
  }
}

class Orderplaced {
  int? id;
  String? name;
  bool? canDelete;

  Orderplaced({
    this.id,
    this.name,
    this.canDelete,
  });

  Orderplaced.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    canDelete = json['canDelete'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['canDelete'] = canDelete;
    return json;
  }
}

class Agent {
  int? id;
  String? name;
  dynamic experince;
  dynamic address;
  String? hireDate;
  String? note;
  bool? canWorkAsAgent;
  List<dynamic>? countries;
  dynamic salary;
  dynamic userName;
  dynamic password;
  List<dynamic>? groupsId;
  bool? isActive;
  List<dynamic>? phones;
  dynamic userStatics;

  Agent({
    this.id,
    this.name,
    this.experince,
    this.address,
    this.hireDate,
    this.note,
    this.canWorkAsAgent,
    this.countries,
    this.salary,
    this.userName,
    this.password,
    this.groupsId,
    this.isActive,
    this.phones,
    this.userStatics,
  });

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    experince = json['experince'];
    address = json['address'];
    hireDate = json['hireDate'] as String?;
    note = json['note'] as String?;
    canWorkAsAgent = json['canWorkAsAgent'] as bool?;
    countries = json['countries'] as List?;
    salary = json['salary'];
    userName = json['userName'];
    password = json['password'];
    groupsId = json['groupsId'] as List?;
    isActive = json['isActive'] as bool?;
    phones = json['phones'] as List?;
    userStatics = json['userStatics'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['experince'] = experince;
    json['address'] = address;
    json['hireDate'] = hireDate;
    json['note'] = note;
    json['canWorkAsAgent'] = canWorkAsAgent;
    json['countries'] = countries;
    json['salary'] = salary;
    json['userName'] = userName;
    json['password'] = password;
    json['groupsId'] = groupsId;
    json['isActive'] = isActive;
    json['phones'] = phones;
    json['userStatics'] = userStatics;
    return json;
  }
}

class AgentPrint {
  int? id;
  int? printNmber;
  String? printerName;
  String? date;
  String? destinationName;
  String? destinationPhone;
  List<dynamic>? orders;
  List<dynamic>? receipts;
  dynamic discount;

  AgentPrint({
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

  AgentPrint.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    printNmber = json['printNmber'] as int?;
    printerName = json['printerName'] as String?;
    date = json['date'] as String?;
    destinationName = json['destinationName'] as String?;
    destinationPhone = json['destinationPhone'] as String?;
    orders = json['orders'] as List?;
    receipts = json['receipts'] as List?;
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['printNmber'] = printNmber;
    json['printerName'] = printerName;
    json['date'] = date;
    json['destinationName'] = destinationName;
    json['destinationPhone'] = destinationPhone;
    json['orders'] = orders;
    json['receipts'] = receipts;
    json['discount'] = discount;
    return json;
  }
}

class ClientPrint {
  int? id;
  int? printNmber;
  String? printerName;
  String? date;
  String? destinationName;
  String? destinationPhone;
  List<Orders>? orders;
  List<dynamic>? receipts;
  dynamic discount;

  ClientPrint({
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

  ClientPrint.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    printNmber = json['printNmber'] as int?;
    printerName = json['printerName'] as String?;
    date = json['date'] as String?;
    destinationName = json['destinationName'] as String?;
    destinationPhone = json['destinationPhone'] as String?;
    orders = (json['orders'] as List?)
        ?.map((dynamic e) => Orders.fromJson(e as Map<String, dynamic>))
        .toList();
    receipts = json['receipts'] as List?;
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['printNmber'] = printNmber;
    json['printerName'] = printerName;
    json['date'] = date;
    json['destinationName'] = destinationName;
    json['destinationPhone'] = destinationPhone;
    json['orders'] = orders?.map((e) => e.toJson()).toList();
    json['receipts'] = receipts;
    json['discount'] = discount;
    return json;
  }
}

class Orders {
  String? code;
  dynamic total;
  String? phone;
  String? country;
  dynamic lastTotal;
  dynamic clientNote;
  dynamic deliveCost;
  dynamic clientName;
  dynamic note;
  dynamic region;
  String? date;
  dynamic moneyPlacedId;
  dynamic orderPlacedId;
  dynamic payForClient;
  dynamic orderplaced;

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

  Orders.fromJson(Map<String, dynamic> json) {
    code = json['code'] as String?;
    total = json['total'];
    phone = json['phone'] as String?;
    country = json['country'] as String?;
    lastTotal = json['lastTotal'];
    clientNote = json['clientNote'];
    deliveCost = json['deliveCost'];
    clientName = json['clientName'];
    note = json['note'];
    region = json['region'];
    date = json['date'] as String?;
    moneyPlacedId = json['moneyPlacedId'];
    orderPlacedId = json['orderPlacedId'];
    payForClient = json['payForClient'];
    orderplaced = json['orderplaced'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['code'] = code;
    json['total'] = total;
    json['phone'] = phone;
    json['country'] = country;
    json['lastTotal'] = lastTotal;
    json['clientNote'] = clientNote;
    json['deliveCost'] = deliveCost;
    json['clientName'] = clientName;
    json['note'] = note;
    json['region'] = region;
    json['date'] = date;
    json['moneyPlacedId'] = moneyPlacedId;
    json['orderPlacedId'] = orderPlacedId;
    json['payForClient'] = payForClient;
    json['orderplaced'] = orderplaced;
    return json;
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ClassName {
  int? id;
  String? code;
  int? deliveryCost;
  int? cost;
  int? agentCost;
  dynamic oldCost;
  String? recipientName;
  String? recipientPhones;
  String? address;
  String? clientNote;
  String? createdBy;
  bool? seen;
  String? date;
  dynamic diliveryDate;
  dynamic note;
  bool? isClientDiliverdMoney;
  dynamic agentPrintNumber;
  dynamic clientPrintNumber;
  int? orderStateId;
  dynamic canResned;
  dynamic oldDeliveryCost;
  bool? isSend;
  dynamic client;
  Country? country;
  dynamic nextCountryDto;
  dynamic region;
  MonePlaced? monePlaced;
  Orderplaced? orderplaced;
  dynamic agent;
  List<OrderItems>? orderItems;
  List<dynamic>? orderLogs;
  List<dynamic>? agentPrint;
  List<dynamic>? clientPrint;
  dynamic path;
  int? currentCountry;

  ClassName({
    this.id,
    this.code,
    this.deliveryCost,
    this.cost,
    this.agentCost,
    this.oldCost,
    this.recipientName,
    this.recipientPhones,
    this.address,
    this.clientNote,
    this.createdBy,
    this.seen,
    this.date,
    this.diliveryDate,
    this.note,
    this.isClientDiliverdMoney,
    this.agentPrintNumber,
    this.clientPrintNumber,
    this.orderStateId,
    this.canResned,
    this.oldDeliveryCost,
    this.isSend,
    this.client,
    this.country,
    this.nextCountryDto,
    this.region,
    this.monePlaced,
    this.orderplaced,
    this.agent,
    this.orderItems,
    this.orderLogs,
    this.agentPrint,
    this.clientPrint,
    this.path,
    this.currentCountry,
  });

  ClassName.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    code = json['code'] as String?;
    deliveryCost = json['deliveryCost'] as int?;
    cost = json['cost'] as int?;
    agentCost = json['agentCost'] as int?;
    oldCost = json['oldCost'];
    recipientName = json['recipientName'] as String?;
    recipientPhones = json['recipientPhones'] as String?;
    address = json['address'] as String?;
    clientNote = json['clientNote'] as String?;
    createdBy = json['createdBy'] as String?;
    seen = json['seen'] as bool?;
    date = json['date'] as String?;
    diliveryDate = json['diliveryDate'];
    note = json['note'];
    isClientDiliverdMoney = json['isClientDiliverdMoney'] as bool?;
    agentPrintNumber = json['agentPrintNumber'];
    clientPrintNumber = json['clientPrintNumber'];
    orderStateId = json['orderStateId'] as int?;
    canResned = json['canResned'];
    oldDeliveryCost = json['oldDeliveryCost'];
    isSend = json['isSend'] as bool?;
    client = json['client'];
    country = (json['country'] as Map<String, dynamic>?) != null
        ? Country.fromJson(json['country'] as Map<String, dynamic>)
        : null;
    nextCountryDto = json['nextCountryDto'];
    region = json['region'];
    monePlaced = (json['monePlaced'] as Map<String, dynamic>?) != null
        ? MonePlaced.fromJson(json['monePlaced'] as Map<String, dynamic>)
        : null;
    orderplaced = (json['orderplaced'] as Map<String, dynamic>?) != null
        ? Orderplaced.fromJson(json['orderplaced'] as Map<String, dynamic>)
        : null;
    agent = json['agent'];
    orderItems = (json['orderItems'] as List?)
        ?.map((dynamic e) => OrderItems.fromJson(e as Map<String, dynamic>))
        .toList();
    orderLogs = json['orderLogs'] as List?;
    agentPrint = json['agentPrint'] as List?;
    clientPrint = json['clientPrint'] as List?;
    path = json['path'];
    currentCountry = json['currentCountry'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['code'] = code;
    json['deliveryCost'] = deliveryCost;
    json['cost'] = cost;
    json['agentCost'] = agentCost;
    json['oldCost'] = oldCost;
    json['recipientName'] = recipientName;
    json['recipientPhones'] = recipientPhones;
    json['address'] = address;
    json['clientNote'] = clientNote;
    json['createdBy'] = createdBy;
    json['seen'] = seen;
    json['date'] = date;
    json['diliveryDate'] = diliveryDate;
    json['note'] = note;
    json['isClientDiliverdMoney'] = isClientDiliverdMoney;
    json['agentPrintNumber'] = agentPrintNumber;
    json['clientPrintNumber'] = clientPrintNumber;
    json['orderStateId'] = orderStateId;
    json['canResned'] = canResned;
    json['oldDeliveryCost'] = oldDeliveryCost;
    json['isSend'] = isSend;
    json['client'] = client;
    json['country'] = country?.toJson();
    json['nextCountryDto'] = nextCountryDto;
    json['region'] = region;
    json['monePlaced'] = monePlaced?.toJson();
    json['orderplaced'] = orderplaced?.toJson();
    json['agent'] = agent;
    json['orderItems'] = orderItems?.map((e) => e.toJson()).toList();
    json['orderLogs'] = orderLogs;
    json['agentPrint'] = agentPrint;
    json['clientPrint'] = clientPrint;
    json['path'] = path;
    json['currentCountry'] = currentCountry;
    return json;
  }
}

// class Country {
//   int? id;
//   String? name;
//   int? deliveryCost;
//   bool? canDelete;
//   bool? canDeleteWithRegion;
//   bool? isMain;
//   int? points;
//   List<dynamic>? regions;
//   List<dynamic>? agnets;
//   dynamic mediator;

//   Country({
//     this.id,
//     this.name,
//     this.deliveryCost,
//     this.canDelete,
//     this.canDeleteWithRegion,
//     this.isMain,
//     this.points,
//     this.regions,
//     this.agnets,
//     this.mediator,
//   });

//   Country.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     name = json['name'] as String?;
//     deliveryCost = json['deliveryCost'] as int?;
//     canDelete = json['canDelete'] as bool?;
//     canDeleteWithRegion = json['canDeleteWithRegion'] as bool?;
//     isMain = json['isMain'] as bool?;
//     points = json['points'] as int?;
//     regions = json['regions'] as List?;
//     agnets = json['agnets'] as List?;
//     mediator = json['mediator'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['name'] = name;
//     json['deliveryCost'] = deliveryCost;
//     json['canDelete'] = canDelete;
//     json['canDeleteWithRegion'] = canDeleteWithRegion;
//     json['isMain'] = isMain;
//     json['points'] = points;
//     json['regions'] = regions;
//     json['agnets'] = agnets;
//     json['mediator'] = mediator;
//     return json;
//   }
// }

// class MonePlaced {
//   int? id;
//   String? name;
//   bool? canDelete;

//   MonePlaced({
//     this.id,
//     this.name,
//     this.canDelete,
//   });

//   MonePlaced.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     name = json['name'] as String?;
//     canDelete = json['canDelete'] as bool?;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['name'] = name;
//     json['canDelete'] = canDelete;
//     return json;
//   }
// }

// class Orderplaced {
//   int? id;
//   String? name;
//   bool? canDelete;

//   Orderplaced({
//     this.id,
//     this.name,
//     this.canDelete,
//   });

//   Orderplaced.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     name = json['name'] as String?;
//     canDelete = json['canDelete'] as bool?;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['name'] = name;
//     json['canDelete'] = canDelete;
//     return json;
//   }
// }

class OrderItems {
  int? count;
  OrderItem? orderTpye;

  OrderItems({
    this.count,
    this.orderTpye,
  });

  OrderItems.fromJson(Map<String, dynamic> json) {
    count = json['count'] as int?;
    orderTpye = (json['orderTpye'] as Map<String, dynamic>?) != null
        ? OrderItem.fromJson(json['orderTpye'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['count'] = count;
    json['orderTpye'] = orderTpye?.toJson();
    return json;
  }
}

// class OrderTpye {
//   int? id;
//   String? name;
//   bool? canDelete;

//   OrderTpye({
//     this.id,
//     this.name,
//     this.canDelete,
//   });

//   OrderTpye.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int?;
//     name = json['name'] as String?;
//     canDelete = json['canDelete'] as bool?;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['id'] = id;
//     json['name'] = name;
//     json['canDelete'] = canDelete;
//     return json;
//   }
// }
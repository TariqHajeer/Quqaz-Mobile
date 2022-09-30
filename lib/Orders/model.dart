class Template {
  int? id;
  String? name;
  bool? canDelete;

  Template({this.id, this.name, this.canDelete});

  Template.fromJson(Map<String, dynamic> json) {
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

class COrder {
  List<Data>? data = [];
  dynamic total;

  COrder({
    this.data,
    this.total,
  });

  COrder.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as List?)
        ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
        .toList();
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['data'] = data?.map((e) => e.toJson()).toList();
    json['total'] = total;
    return json;
  }
}

class Data {
  int? id;
  String? code;
  double? deliveryCost;
  double? cost;
  double? agentCost;
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
  dynamic isSend;
  dynamic client;
  Country? country;
  dynamic nextCountryDto;
  dynamic region;
  MonePlaced? monePlaced;
  Orderplaced? orderplaced;
  dynamic agent;
  List<dynamic>? orderItems;
  List<dynamic>? orderLogs;
  List<AgentPrint>? agentPrint;
  List<ClientPrint>? clientPrint;
  dynamic path;
  int? currentCountry;

  Data({
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    code = json['code'] as String?;
    deliveryCost = json['deliveryCost'] as double?;
    cost = json['cost'] as double?;
    agentCost = json['agentCost'] as double?;
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
    agentPrintNumber = json['agentPrintNumber'];
    clientPrintNumber = json['clientPrintNumber'];
    orderStateId = json['orderStateId'];
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
    agent = json['agent'];
    orderItems = json['orderItems'] as List?;
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
    json['agent'] = agent;
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
  double? deliveryCost;
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
    deliveryCost = json['deliveryCost'] as double?;
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
  double? total;
  String? phone;
  String? country;
  dynamic lastTotal;
  dynamic clientNote;
  double? deliveCost;
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
    total = json['total'] as double?;
    phone = json['phone'] as String?;
    country = json['country'] as String?;
    lastTotal = json['lastTotal'];
    clientNote = json['clientNote'];
    deliveCost = json['deliveCost'] as double?;
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

class Regions {
  int? id;
  String? name;
  bool? canDelete;
  Country? country;

  Regions({
    this.id,
    this.name,
    this.canDelete,
    this.country,
  });

  Regions.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    canDelete = json['canDelete'] as bool?;
    country = (json['country'] as Map<String, dynamic>?) != null
        ? Country.fromJson(json['country'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['canDelete'] = canDelete;
    json['country'] = country?.toJson();
    return json;
  }
}




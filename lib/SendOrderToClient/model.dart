class SendOrder {
  int? id;
  String? code;
  num? deliveryCost;
  num? cost;
  num? agentCost;
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
  num? orderStateId;
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
  List<dynamic>? orderItems;
  List<dynamic>? orderLogs;
  List<dynamic>? agentPrint;
  List<dynamic>? clientPrint;
  dynamic path;
  num? currentCountry;

  SendOrder({
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

  SendOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    code = json['code'] as String?;
    deliveryCost = json['deliveryCost'];
    cost = json['cost'] ;
    agentCost = json['agentCost'] ;
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
    orderStateId = json['orderStateId'] ;
    canResned = json['canResned'];
    oldDeliveryCost = json['oldDeliveryCost'];
    isSend = json['isSend'] as bool?;
    client = json['client'];
    country = (json['country'] as Map<String,dynamic>?) != null ? Country.fromJson(json['country'] as Map<String,dynamic>) : null;
    nextCountryDto = json['nextCountryDto'];
    region = json['region'];
    monePlaced = (json['monePlaced'] as Map<String,dynamic>?) != null ? MonePlaced.fromJson(json['monePlaced'] as Map<String,dynamic>) : null;
    orderplaced = (json['orderplaced'] as Map<String,dynamic>?) != null ? Orderplaced.fromJson(json['orderplaced'] as Map<String,dynamic>) : null;
    agent = json['agent'];
    orderItems = json['orderItems'] as List?;
    orderLogs = json['orderLogs'] as List?;
    agentPrint = json['agentPrint'] as List?;
    clientPrint = json['clientPrint'] as List?;
    path = json['path'];
    currentCountry = json['currentCountry'] ;
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
    json['agentPrint'] = agentPrint;
    json['clientPrint'] = clientPrint;
    json['path'] = path;
    json['currentCountry'] = currentCountry;
    return json;
  }
}

class Country {
  int? id;
  String? name;
  num? deliveryCost;
  bool? canDelete;
  bool? canDeleteWithRegion;
  bool? isMain;
  num? points;
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
    id = json['id'] ;
    name = json['name'] as String?;
    deliveryCost = json['deliveryCost'] ;
    canDelete = json['canDelete'] as bool?;
    canDeleteWithRegion = json['canDeleteWithRegion'] as bool?;
    isMain = json['isMain'] as bool?;
    points = json['points'] ;
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
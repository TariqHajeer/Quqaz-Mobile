class CheckB {
  final int? id;
  final String? name;
  final bool? canDelete;

  CheckB({
    this.id,
    this.name,
    this.canDelete,
  });

  CheckB.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        canDelete = json['canDelete'] as bool?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'canDelete': canDelete};
}

class Record {
  final int? id;
  final String? code;
  final Agent? agent;
  final num? deliveryCost;
  final num? cost;
  final num? oldCost;
  final num? payForClient;
  final Country? country;
  final dynamic region;
  final MonePlaced? monePlaced;
  final Orderplaced? orderplaced;
  final String? date;
  final dynamic diliveryDate;
  final num? agentPrintNumber;
  final num? clientPrintNumber;
  final dynamic clientNote;
  final dynamic note;
  final bool? isClientDiliverdMoney;

  Record({
    this.id,
    this.code,
    this.agent,
    this.deliveryCost,
    this.cost,
    this.oldCost,
    this.payForClient,
    this.country,
    this.region,
    this.monePlaced,
    this.orderplaced,
    this.date,
    this.diliveryDate,
    this.agentPrintNumber,
    this.clientPrintNumber,
    this.clientNote,
    this.note,
    this.isClientDiliverdMoney,
  });

  Record.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        code = json['code'] as String?,
        agent = (json['agent'] as Map<String, dynamic>?) != null
            ? Agent.fromJson(json['agent'] as Map<String, dynamic>)
            : null,
        deliveryCost = json['deliveryCost'],
        cost = json['cost'],
        oldCost = json['oldCost'],
        payForClient = json['payForClient'],
        country = (json['country'] as Map<String, dynamic>?) != null
            ? Country.fromJson(json['country'] as Map<String, dynamic>)
            : null,
        region = json['region'],
        monePlaced = (json['monePlaced'] as Map<String, dynamic>?) != null
            ? MonePlaced.fromJson(json['monePlaced'] as Map<String, dynamic>)
            : null,
        orderplaced = (json['orderplaced'] as Map<String, dynamic>?) != null
            ? Orderplaced.fromJson(json['orderplaced'] as Map<String, dynamic>)
            : null,
        date = json['date'] as String?,
        diliveryDate = json['diliveryDate'],
        agentPrintNumber = json['agentPrintNumber'],
        clientPrintNumber = json['clientPrintNumber'],
        clientNote = json['clientNote'],
        note = json['note'],
        isClientDiliverdMoney = json['isClientDiliverdMoney'] as bool?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'agent': agent?.toJson(),
        'deliveryCost': deliveryCost,
        'cost': cost,
        'oldCost': oldCost,
        'payForClient': payForClient,
        'country': country?.toJson(),
        'region': region,
        'monePlaced': monePlaced?.toJson(),
        'orderplaced': orderplaced?.toJson(),
        'date': date,
        'diliveryDate': diliveryDate,
        'agentPrintNumber': agentPrintNumber,
        'clientPrintNumber': clientPrintNumber,
        'clientNote': clientNote,
        'note': note,
        'isClientDiliverdMoney': isClientDiliverdMoney
      };
}

class Agent {
  final int? id;
  final String? name;
  final dynamic experince;
  final dynamic address;
  final String? hireDate;
  final String? note;
  final bool? canWorkAsAgent;
  final List<dynamic>? countries;
  final num? salary;
  final dynamic userName;
  final dynamic password;
  final List<dynamic>? groupsId;
  final bool? isActive;
  final List<dynamic>? phones;
  final dynamic userStatics;

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

  Agent.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        experince = json['experince'],
        address = json['address'],
        hireDate = json['hireDate'] as String?,
        note = json['note'] as String?,
        canWorkAsAgent = json['canWorkAsAgent'] as bool?,
        countries = json['countries'] as List?,
        salary = json['salary'],
        userName = json['userName'],
        password = json['password'],
        groupsId = json['groupsId'] as List?,
        isActive = json['isActive'] as bool?,
        phones = json['phones'] as List?,
        userStatics = json['userStatics'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'experince': experince,
        'address': address,
        'hireDate': hireDate,
        'note': note,
        'canWorkAsAgent': canWorkAsAgent,
        'countries': countries,
        'salary': salary,
        'userName': userName,
        'password': password,
        'groupsId': groupsId,
        'isActive': isActive,
        'phones': phones,
        'userStatics': userStatics
      };
}

class Country {
  final int? id;
  final String? name;
  final num? deliveryCost;
  final bool? canDelete;
  final bool? canDeleteWithRegion;
  final bool? isMain;
  final num? points;
  final List<dynamic>? regions;
  final List<dynamic>? agnets;
  final dynamic mediator;

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

  Country.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        deliveryCost = json['deliveryCost'],
        canDelete = json['canDelete'] as bool?,
        canDeleteWithRegion = json['canDeleteWithRegion'] as bool?,
        isMain = json['isMain'] as bool?,
        points = json['points'],
        regions = json['regions'] as List?,
        agnets = json['agnets'] as List?,
        mediator = json['mediator'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'deliveryCost': deliveryCost,
        'canDelete': canDelete,
        'canDeleteWithRegion': canDeleteWithRegion,
        'isMain': isMain,
        'points': points,
        'regions': regions,
        'agnets': agnets,
        'mediator': mediator
      };
}

class MonePlaced {
  final int? id;
  final String? name;
  final bool? canDelete;

  MonePlaced({
    this.id,
    this.name,
    this.canDelete,
  });

  MonePlaced.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        canDelete = json['canDelete'] as bool?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'canDelete': canDelete};
}

class Orderplaced {
  final int? id;
  final String? name;
  final bool? canDelete;

  Orderplaced({
    this.id,
    this.name,
    this.canDelete,
  });

  Orderplaced.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        canDelete = json['canDelete'] as bool?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'canDelete': canDelete};
}

//
class Documentss {
  final int? id;
  final num? amount;
  final String? date;
  final String? note;
  final String? createdBy;
  final String? about;
  final String? manager;
  final bool? isPay;
  final dynamic printId;
  final dynamic clientName;
  final dynamic printNumber;

  Documentss({
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

  Documentss.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        amount = json['amount'],
        date = json['date'] as String?,
        note = json['note'] as String?,
        createdBy = json['createdBy'] as String?,
        about = json['about'] as String?,
        manager = json['manager'] as String?,
        isPay = json['isPay'] as bool?,
        printId = json['printId'],
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

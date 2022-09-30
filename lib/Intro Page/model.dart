class ClientsModel {
  int? id;
  String? name;
  String? marketUrl;
  String? logoPath;
  String? description;
  Client? client;
  bool? isActive;

  ClientsModel(
      {this.id,
      this.name,
      this.marketUrl,
      this.logoPath,
      this.description,
      this.client,
      this.isActive});

  ClientsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    marketUrl = json['marketUrl'];
    logoPath = json['logoPath'];
    description = json['description'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['marketUrl'] = this.marketUrl;
    data['logoPath'] = this.logoPath;
    data['description'] = this.description;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    data['isActive'] = this.isActive;
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? address;
  String? firstDate;
  String? note;
  String? userName;
  String? country;
  String? createdBy;
  bool? canDelete;
  int? total;
  String? phones;
  String? mail;
  int? points;

  Client(
      {this.id,
      this.name,
      this.address,
      this.firstDate,
      this.note,
      this.userName,
      this.country,
      this.createdBy,
      this.canDelete,
      this.total,
      this.phones,
      this.mail,
      this.points});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    firstDate = json['firstDate'];
    note = json['note'];
    userName = json['userName'];
    country = json['country'];
    createdBy = json['createdBy'];
    canDelete = json['canDelete'];
    total = json['total'];
    phones = json['phones'];
    mail = json['mail'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['firstDate'] = this.firstDate;
    data['note'] = this.note;
    data['userName'] = this.userName;
    data['country'] = this.country;
    data['createdBy'] = this.createdBy;
    data['canDelete'] = this.canDelete;
    data['total'] = this.total;
    data['phones'] = this.phones;
    data['mail'] = this.mail;
    data['points'] = this.points;
    return data;
  }
}

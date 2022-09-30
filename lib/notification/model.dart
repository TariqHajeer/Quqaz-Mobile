import 'dart:convert';

class DataNotificationModel {
  List<Notifications> ?notifications;

  DataNotificationModel({this.notifications});

  DataNotificationModel.fromJson(json) {
    if (json['notifications'] != null) {
      notifications = [];
      json['notifications'].forEach((v) {
        notifications!.add(new Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  int ? id;
  String ? note;
  int ? orderCount;
  bool ? isSeen;
  MonePlaced ? monePlaced;
  MonePlaced ? orderplaced;

  Notifications(
      {this.id,
      this.note,
      this.orderCount,
      this.isSeen,
      this.monePlaced,
      this.orderplaced});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    note = json['Note'];
    orderCount = json['OrderCount'];
    isSeen = json['IsSeen'];
    monePlaced = json['MoneyPlaced'] != null
        ? new MonePlaced.fromJson(json['MoneyPlaced'])
        : null;
    orderplaced = json['OrderPlaced'] != null
        ? new MonePlaced.fromJson(json['OrderPlaced'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Note'] = this.note;
    data['OrderCount'] = this.orderCount;
    data['IsSeen'] = this.isSeen;
    if (this.monePlaced != null) {
      data['MoneyPlaced'] = this.monePlaced!.toJson();
    }
    if (this.orderplaced != null) {
      data['OrderPlaced'] = this.orderplaced!.toJson();
    }
    return data;
  }
}

class MonePlaced {
  int? id;
  String? name;

  MonePlaced({this.id, this.name});

  MonePlaced.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    return data;
  }
}

class Number {
/*
{
  "id": 1299,
  "phone": "21321231323"
} 
*/

  int? id;
  String? phone;

  Number({
    this.id,
    this.phone,
  });
  Number.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    phone = json["phone"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["phone"] = phone;
    return data;
  }
}

class UserModel {
/*
{
  "name": "عميل 1",
  "userName": "client1",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiIxMjkyIiwiVHlwZSI6IkNsaWVudCIsInVuaXF1ZV9uYW1lIjoi2LnZhdmK2YQgMSIsIm5iZiI6MTYzMTM4MDYxOCwiZXhwIjoxNjMxNDY3MDE4LCJpYXQiOjE2MzEzODA2MTh9.RgzocicpAC-Fi_Oo5qoLxqdBpFKDkrByqdouzJuwUhg",
  "address": null,
  "mail": null,
  "country": null,
  "phones": [
    {
      "id": 1299,
      "phone": "21321231323"
    }
  ]
} 
*/

  String? name;
  String? userName;
  String? token;
  String? address;
  String? mail;
  String? country;
  List<Number?>? phones;

  UserModel({
    this.name,
    this.userName,
    this.token,
    this.address,
    this.mail,
    this.country,
    this.phones,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    userName = json["userName"]?.toString();
    token = json["token"]?.toString();
    address = json["address"]?.toString();
    mail = json["mail"]?.toString();
    country = json["country"]?.toString();
  if (json["phones"] != null) {
  final v = json["phones"];
  final arr0 = <Number>[];
  v.forEach((v) {
  arr0.add(Number.fromJson(v));
  });
    phones = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["userName"] = userName;
    data["token"] = token;
    data["address"] = address;
    data["mail"] = mail;
    data["country"] = country;
    if (phones != null) {
      final v = phones;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data["phones"] = arr0;
    }
    return data;
  }
}

class GetByToken {
  String? name;
  String? userName;
  dynamic token;
  dynamic address;
  dynamic mail;
  dynamic country;
  List<Phones>? phones;

  GetByToken({
    this.name,
    this.userName,
    this.token,
    this.address,
    this.mail,
    this.country,
    this.phones,
  });

  GetByToken.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    userName = json['userName'] as String?;
    token = json['token'];
    address = json['address'];
    mail = json['mail'];
    country = json['country'];
    phones = (json['phones'] as List?)?.map((dynamic e) => Phones.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['userName'] = userName;
    json['token'] = token;
    json['address'] = address;
    json['mail'] = mail;
    json['country'] = country;
    json['phones'] = phones?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Phones {
  int? id;
  String? phone;

  Phones({
    this.id,
    this.phone,
  });

  Phones.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    phone = json['phone'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['phone'] = phone;
    return json;
  }
}

class FormUpdate {
  //
  String? mail;
  String? password;
  List<String>? phones;
  String? name;
  String? userName;
  //
  FormUpdate({
    this.mail,
    this.password,
    this.phones,
    this.name,
    this.userName,
  });  
}
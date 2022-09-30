class CPoint {
  int? id;
  num? points;
  num? money;

  CPoint({
    this.id,
    this.points,
    this.money,
  });

  CPoint.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    points = json['points'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['points'] = points;
    json['money'] = money;
    return json;
  }
}

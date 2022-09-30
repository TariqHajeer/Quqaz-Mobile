class CStaticsModel {
  int? totalOrder;
  int? orderMoneyInCompany;
  int? orderDeliverdToClient;
  int? orderMoneyDelived;
  int? orderInWat;
  int? orderInStore;
  int? orderWithClient;
  int? orderComplitlyReutrndInCompany;
  int? orderComplitlyReutrndDeliverd;
  int? delayedOrder;
  int? orderPartialReturned;

  CStaticsModel({
    this.totalOrder,
    this.orderMoneyInCompany,
    this.orderDeliverdToClient,
    this.orderMoneyDelived,
    this.orderInWat,
    this.orderInStore,
    this.orderWithClient,
    this.orderComplitlyReutrndInCompany,
    this.orderComplitlyReutrndDeliverd,
    this.delayedOrder,
    this.orderPartialReturned,
  });
  CStaticsModel.fromJson(Map<String, dynamic> json) {
    totalOrder = json["totalOrder"]?.toInt();
    orderMoneyInCompany = json["orderMoneyInCompany"]?.toInt();
    orderDeliverdToClient = json["orderDeliverdToClient"]?.toInt();
    orderMoneyDelived = json["orderMoneyDelived"]?.toInt();
    orderInWat = json["orderInWat"]?.toInt();
    orderInStore = json["orderInStore"]?.toInt();
    orderWithClient = json["orderWithClient"]?.toInt();
    orderComplitlyReutrndInCompany = json["orderComplitlyReutrndInCompany"]?.toInt();
    orderComplitlyReutrndDeliverd = json["orderComplitlyReutrndDeliverd"]?.toInt();
    delayedOrder = json["delayedOrder"]?.toInt();
    orderPartialReturned = json["orderPartialReturned"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["totalOrder"] = totalOrder;
    data["orderMoneyInCompany"] = orderMoneyInCompany;
    data["orderDeliverdToClient"] = orderDeliverdToClient;
    data["orderMoneyDelived"] = orderMoneyDelived;
    data["orderInWat"] = orderInWat;
    data["orderInStore"] = orderInStore;
    data["orderWithClient"] = orderWithClient;
    data["orderComplitlyReutrndInCompany"] = orderComplitlyReutrndInCompany;
    data["orderComplitlyReutrndDeliverd"] = orderComplitlyReutrndDeliverd;
    data["delayedOrder"] = delayedOrder;
    data["orderPartialReturned"] = orderPartialReturned;
    return data;
  }
}

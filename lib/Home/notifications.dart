import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quqaz/Home/controller.dart';

class NotificationsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchMessages();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Expanded(
            child: SingleChildScrollView(
          controller: controller.scrollController.value,
          child: Obx(
            () {
              return controller.isLoadingNot.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : controller.nots.isEmpty
                      ? Text("ليس هنا اشعارات بعد")
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: controller.nots
                              .map(
                                (e) => Container(
                                  padding: EdgeInsets.all(0),
                                  color: Colors.grey[300],
                                  child: Text(
                                    e.note ?? "",
                                  ),
                                ),
                              )
                              .toList(),
                        );
            },
          ),
        )

            // : Text("No Messages found")),
            ),
      ),
    );
  }
}
//
//

class MessageWidget extends StatelessWidget {
  MessageWidget(this.isAdmin, this.text, this.date);
  final bool? isAdmin;
  final String? text;
  final String? date;
  final kGColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff667590),
      Color(0xff4D5977),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: isAdmin! ? TextDirection.ltr : TextDirection.rtl,
      // mainAxisAlignment:
      //     isAdmin! ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                text!,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontSize: 19,
                    color: isAdmin! ? Colors.white : Color(0xFF626C75)),
              ),
              decoration: BoxDecoration(
                gradient: isAdmin!
                    ? kGColor
                    : LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xfffffffff),
                          Color(0xfffffffff),
                        ],
                      ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            Text(date!.split(".")[0].split("T")[1])
          ],
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}

//
class NotificationsModel {
  final int? id;
  final String? note;
  final num? orderCount;
  final bool? isSeen;
  final MonePlaced? monePlaced;
  final Orderplaced? orderplaced;

  NotificationsModel({
    this.id,
    this.note,
    this.orderCount,
    this.isSeen,
    this.monePlaced,
    this.orderplaced,
  });

  NotificationsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        note = json['note'],
        orderCount = json['orderCount'],
        isSeen = json['isSeen'] as bool?,
        monePlaced = (json['monePlaced'] as Map<String, dynamic>?) != null
            ? MonePlaced.fromJson(json['monePlaced'] as Map<String, dynamic>)
            : null,
        orderplaced = (json['orderplaced'] as Map<String, dynamic>?) != null
            ? Orderplaced.fromJson(json['orderplaced'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'note': note,
        'orderCount': orderCount,
        'isSeen': isSeen,
        'monePlaced': monePlaced?.toJson(),
        'orderplaced': orderplaced?.toJson()
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

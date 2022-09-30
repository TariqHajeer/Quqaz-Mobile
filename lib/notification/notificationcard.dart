import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:quqaz/controller/appController.dart';

class NotificationCard extends StatelessWidget {
  final int index;
  AppController appController = Get.find();

  NotificationCard({@required this.index = 0});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
//        Get.to(RequestsPage(
//          saved: 'all',
//        ));
      },
      child: Container(
        height: Get.height * 0.12,
        margin: EdgeInsets.only(top: 10),
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 30,
              child: Icon(Icons.notifications),
            ),
            title: (appController.dataNoti[index].note == null)
                ? Container(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Center(
                                child: Text(
                                  appController
                                          .dataNoti[index].orderplaced!.name
                                          .toString() +
                                      '  ',
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'لديك' +
                                      appController.dataNoti[index].orderCount
                                          .toString() +
                                      '  ' +
                                      'طلبات',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Center(
                            child: Text(' وموقع التسليم ' +
                                ' ' +
                                appController.dataNoti[index].monePlaced!.name
                                    .toString()),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Center(
                      child: Text(
                        appController.dataNoti[index].note.toString(),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  String timeAgo(DateTime d) {
    print("zd  " + d.toString());
    Duration diff = DateTime.now().difference(d);
    print("zdwww  " + diff.toString());
    print("oio  " + DateTime.now().toString());
    if (diff.inDays > 365)
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year".tr : "years".tr} ${'ago'.tr}";
    if (diff.inDays > 30)
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month".tr : "months".tr} ${'ago'.tr}";
    if (diff.inDays > 7)
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week".tr : "weeks".tr} ${'ago'.tr}";
    if (diff.inDays > 0)
      return "${diff.inDays} ${diff.inDays == 1 ? "day".tr : "days".tr} ${'ago'.tr}";
    if (diff.inHours > 0)
      return "${diff.inHours} ${diff.inHours == 1 ? "hour".tr : "hours".tr} ${'ago'.tr}";
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute".tr : "minutes".tr} ${'ago'.tr}";
    return "just now".tr;
  }
}
//SizedBox(
//      width: Get.width,
//      height: Get.height * 0.1,
//      child: Row(
//        children: [
//          SizedBox(width: AppTheme.padding_8),
//          SizedBox(
//            child: AppAssets.notificationIcon,
//          ),
//          Expanded(
//            child: Padding(
//              padding: EdgeInsets.symmetric(horizontal: AppTheme.padding_12),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: [
//                      SizedBox(height: AppTheme.padding_16),
//                      Text(
//                        notificationsController.data[index].title,
//                        maxLines: 1,
//                        style: AppTheme.bodyText2,
//                      ),
//                      SizedBox(
//                        width: Get.width * 0.53,
//                      ),
//                      // Text(
//                      //   notificationsController.data[index].isRead
//                      //       ? 'مقروء'
//                      //       : 'غير مقروء',
//                      //   overflow: TextOverflow.ellipsis,
//                      //   style: AppTheme.bodyText1.copyWith(color: Colors.grey),
//                      // ),
//                      CircleAvatar(
//                        radius: 5,
//                        backgroundColor: AppTheme.appPrimaryColor,
//                      ),
//                    ],
//                  ),
//                  Row(
//                    children: [
//                      Container(
//                        decoration: BoxDecoration(
//                            color: Color.fromRGBO(196, 196, 196, 1)
//                                .withOpacity(0.5),
//                            borderRadius: AppTheme.appBorderRadius_20),
//                        child: AppImage(
//                          path:  notificationsController.data[index].data
//                              .sellRent.value ==
//                              'Sell'
//                              ? AppAssets.sell
//                              : AppAssets.rent,
//                          type: ImageType.Asset,
//                          width: 50,
//                          height: 50,
//                        ),
//                      ),
//                      SizedBox(
//                        width: 10,
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(bottom: AppTheme.padding_16),
//                        child: Text(
//                          // detailsPageController.obj['category'],
//                          notificationsController.data[index].data.category.name,
//                          style: AppTheme.bodyText1
//                              .copyWith(color: AppTheme.appPrimaryColor),
//                        ),
//                      ),
//                    ],
//                  ),
//                  SizedBox(height: AppTheme.padding_2),
//                  Text(
//                    notificationsController.data[index].body,
//                    maxLines: 1,
//                    overflow: TextOverflow.ellipsis,
//                    style: AppTheme.bodyText1,
//                  ),
//                  SizedBox(height: AppTheme.padding_2),
//                  Align(
//                    alignment: Alignment.bottomLeft,
//                    child: Text(
//                      notificationsController.data[index].date
//                              .split(' ')[1]
//                              .toString()
//                              .split(':')[1] +
//                          ' : ' +
//                          notificationsController.data[index].date
//                              .split(' ')[1]
//                              .toString()
//                              .split(':')[0] +
//                          '   -   ' +
//                          notificationsController.data[index].date
//                              .split(' ')[0]
//                              .toString(),
//                      overflow: TextOverflow.ellipsis,
//                      style: AppTheme.bodyText1.copyWith(color: Colors.grey),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ],
//      ),
//    );

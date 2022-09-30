// import 'package:flutter/material.dart';

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var widths = (MediaQuery.of(context).size.width) / 3;
//     var width_tow = (MediaQuery.of(context).size.width) / 10;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: <Widget>[
//               Container(
//                 height: 300,
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(left: 5, top: 1),
//                           child: Text(
//                             " 10 /3/21 , 10:11 pm",
//                             style: TextStyle(color: Colors.black, fontSize: 8),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           width: widths,
//                           child: Column(
//                             children: <Widget>[
//                               Row(
//                                 children: <Widget>[
//                                   Container(
//                                     margin: EdgeInsets.only(right: 1),
//                                     padding: EdgeInsets.all(1),
//                                     height: 25,
//                                     width: 70,
//                                     color: Colors.black,
//                                     child: Container(
//                                       color: Colors.white,
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         "مستخدم الطابعة",
//                                         style: TextStyle(
//                                             fontSize: 10, color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(right: 5),
//                                     padding: EdgeInsets.all(1),
//                                     height: 25,
//                                     width: 55,
//                                     color: Colors.black,
//                                     child: Container(
//                                       color: Colors.white,
//                                       alignment: Alignment.centerRight,
//                                       child: Text(
//                                         " عميل 1",
//                                         style: TextStyle(
//                                             fontSize: 10, color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Container(
//                                     padding: EdgeInsets.all(1),
//                                     margin: EdgeInsets.only(right: 1),
//                                     height: 25,
//                                     width: 70,
//                                     color: Colors.black,
//                                     child: Container(
//                                       color: Colors.white,
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         " تاريخ الطباعة",
//                                         style: TextStyle(
//                                             fontSize: 10, color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(right: 5),
//                                     padding: EdgeInsets.all(1),
//                                     height: 25,
//                                     width: 55,
//                                     color: Colors.black,
//                                     child: Container(
//                                       color: Colors.white,
//                                       alignment: Alignment.centerRight,
//                                       padding:
//                                           EdgeInsets.only(right: 1, left: 1),
//                                       child: Text(
//                                         "03/10/2021",
//                                         style: TextStyle(
//                                             fontSize: 10, color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Container(
//                                     padding: EdgeInsets.all(1),
//                                     margin: EdgeInsets.only(right: 1),
//                                     height: 25,
//                                     width: 70,
//                                     color: Colors.black,
//                                     child: Container(
//                                       color: Colors.white,
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         " تاريخ الطباعة",
//                                         style: TextStyle(
//                                             fontSize: 12, color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(right: 5),
//                                     padding: EdgeInsets.all(1),
//                                     height: 25,
//                                     width: 55,
//                                     color: Colors.black,
//                                     child: Container(
//                                       color: Colors.white,
//                                       alignment: Alignment.centerRight,
//                                       padding: EdgeInsets.only(right: 3),
//                                       child: Text(
//                                         "pm 10:10",
//                                         style: TextStyle(
//                                             fontSize: 10, color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: widths,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(right: 50),
//                                 height: 85,
//                                 width: 85,
//                                 child: Image(
//                                   image: AssetImage("images/print.jpg"),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: widths,
//                           child: Column(
//                             children: [
//                               Container(
//                                   margin: EdgeInsets.only(right: 35),
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     "كشف حساب",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   )),
//                               Container(
//                                 margin: EdgeInsets.only(right: 35),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.person_sharp,
//                                       color: Colors.red,
//                                       size: 15,
//                                     ),
//                                     Text("عميل 1")
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 3,
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only(right: 35),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.phone,
//                                       color: Colors.red,
//                                       size: 15,
//                                     ),
//                                     Text("213213123")
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     Padding(padding: EdgeInsets.only(top: 8)),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.location_on,
//                               color: Colors.red,
//                               size: 15,
//                             ),
//                             Padding(padding: EdgeInsets.only(right: 2)),
//                             Text(
//                               "اربيل",
//                               style: TextStyle(),
//                             ),
//                             Padding(padding: EdgeInsets.only(right: 2)),
//                             Icon(
//                               Icons.phone,
//                               color: Colors.red,
//                               size: 15,
//                             ),
//                             Padding(padding: EdgeInsets.only(right: 2)),
//                             Text(
//                               "07514550880 - 07700890880",
//                               style: TextStyle(),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ترقيم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "رقم الوصل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "المحافظة",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "تاريخ الطلب",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الاجمالي",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.1,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الرسوم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "يدفع للعميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 " المبلغ القديم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.7,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات العميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 3,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ترقيم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "رقم الوصل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "المحافظة",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "تاريخ الطلب",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الاجمالي",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.1,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الرسوم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "يدفع للعميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 " المبلغ القديم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.7,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات العميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 3,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ترقيم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "رقم الوصل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "المحافظة",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "تاريخ الطلب",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الاجمالي",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.1,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الرسوم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "يدفع للعميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 " المبلغ القديم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.7,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات العميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 3,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ترقيم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "رقم الوصل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "المحافظة",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "تاريخ الطلب",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الاجمالي",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.1,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الرسوم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "يدفع للعميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 " المبلغ القديم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.7,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات العميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 3,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ترقيم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "رقم الوصل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "المحافظة",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "تاريخ الطلب",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الاجمالي",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.1,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الرسوم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "يدفع للعميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 " المبلغ القديم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.7,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات العميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 3,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ترقيم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "رقم الوصل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "المحافظة",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "تاريخ الطلب",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.2,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الاجمالي",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.1,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "الرسوم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "يدفع للعميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.5,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 " المبلغ القديم",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 1.7,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات العميل",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(right: 1),
//                             padding: EdgeInsets.all(1),
//                             height: 15,
//                             width: width_tow * 3,
//                             color: Colors.black,
//                             child: Container(
//                               color: Colors.white,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "ملاحظات",
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widths = (MediaQuery.of(context).size.width) / 3;
    var width_tow = (MediaQuery.of(context).size.width) / 10;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5, top: 1),
                        child: Text(
                          " 10 /3/21 , 10:11 pm",
                          style: TextStyle(color: Colors.black, fontSize: 8),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: widths,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 25,
                                  width: 70,
                                  color: Colors.black,
                                  child: Container(
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "مستخدم الطابعة",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.all(1),
                                  height: 25,
                                  width: 55,
                                  color: Colors.black,
                                  child: Container(
                                    color: Colors.white,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      " عميل 1",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(1),
                                  margin: EdgeInsets.only(right: 1),
                                  height: 25,
                                  width: 70,
                                  color: Colors.black,
                                  child: Container(
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    child: Text(
                                      " تاريخ الطباعة",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.all(1),
                                  height: 25,
                                  width: 55,
                                  color: Colors.black,
                                  child: Container(
                                    color: Colors.white,
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 1, left: 1),
                                    child: Text(
                                      "03/10/2021",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(1),
                                  margin: EdgeInsets.only(right: 1),
                                  height: 25,
                                  width: 70,
                                  color: Colors.black,
                                  child: Container(
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    child: Text(
                                      " تاريخ الطباعة",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.all(1),
                                  height: 25,
                                  width: 55,
                                  color: Colors.black,
                                  child: Container(
                                    color: Colors.white,
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 3),
                                    child: Text(
                                      "pm 10:10",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: widths,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              height: 85,
                              width: 85,
                              child: Image(
                                image: AssetImage("images/print.jpg"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: widths,
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 35),
                                alignment: Alignment.center,
                                child: Text(
                                  "كشف حساب",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                              margin: EdgeInsets.only(right: 35),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person_sharp,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                  Text("عميل 1")
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 35),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                  Text("213213123")
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 15,
                          ),
                          Padding(padding: EdgeInsets.only(right: 2)),
                          Text(
                            "اربيل",
                            style: TextStyle(),
                          ),
                          Padding(padding: EdgeInsets.only(right: 2)),
                          Icon(
                            Icons.phone,
                            color: Colors.red,
                            size: 15,
                          ),
                          Padding(padding: EdgeInsets.only(right: 2)),
                          Text(
                            "07514550880 - 07700890880",
                            style: TextStyle(),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow,
                          color: Colors.black,
                          child: Container(
                            color: Colors.grey[500],
                            alignment: Alignment.center,
                            child: Text(
                              "ترقيم",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.grey[500],
                            alignment: Alignment.center,
                            child: Text(
                              "رقم الوصل",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.2,
                          color: Colors.black,
                          child: Container(
                            color: Colors.grey[500],
                            alignment: Alignment.center,
                            child: Text(
                              "المحافظة",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.grey[500],
                            alignment: Alignment.center,
                            child: Text(
                              "تاريخ الطلب",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.2,
                          color: Colors.black,
                          child: Container(
                            color: Colors.grey[500],
                            alignment: Alignment.center,
                            child: Text(
                              "الاجمالي",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.1,
                          color: Colors.black,
                          child: Container(
                            color: Colors.grey[500],
                            alignment: Alignment.center,
                            child: Text(
                              "الرسوم",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.grey[500],
                            alignment: Alignment.center,
                            child: Text(
                              "يدفع للعميل",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.grey[500],
                            alignment: Alignment.center,
                            child: Text(
                              " المبلغ القديم",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.7,
                          color: Colors.black,
                          child: Container(
                            color: Colors.grey[500],
                            alignment: Alignment.center,
                            child: Text(
                              "ملاحظات العميل",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 3,
                          color: Colors.black,
                          child: Container(
                            color: Colors.grey[500],
                            alignment: Alignment.center,
                            child: Text(
                              "ملاحظات",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.2,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.2,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.1,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.7,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 3,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.2,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.2,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.1,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.7,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 3,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.2,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.2,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.1,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.5,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 1.7,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: width_tow * 3,
                          color: Colors.black,
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "السندات",
                  //       style: TextStyle(
                  //           fontSize: 15,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 2,
                  // ),
                  // Container(
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.grey[500],
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "ترقيم",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 1.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.grey[500],
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "رقم السند",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.grey[500],
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "التاريخ",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.grey[500],
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             " حالة السند",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.grey[500],
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "كلفة السند",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 1.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.grey[500],
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "وذلك عن",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 3.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.grey[500],
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "ملاحظات",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2,
                  // ),
                  // Container(
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 1.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 1.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 3.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2,
                  // ),
                  // Container(
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 1.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 1.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 3.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2,
                  // ),
                  // Container(
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 1.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 2,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 1.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(right: 1),
                  //         padding: EdgeInsets.all(1),
                  //         height: 20,
                  //         width: width_tow * 3.5,
                  //         color: Colors.black,
                  //         child: Container(
                  //           color: Colors.white,
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             "",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.only(right: 1),
                  //       padding: EdgeInsets.all(1),
                  //       height: 20,
                  //       width: width_tow * 6,
                  //       color: Colors.black,
                  //       child: Container(
                  //         color: Colors.grey[100],
                  //         alignment: Alignment.center,
                  //         child: Text(
                  //           "اجمالي كلفة السندات",
                  //           style: TextStyle(
                  //               fontSize: 10,
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.only(right: 1),
                  //       padding: EdgeInsets.all(1),
                  //       height: 20,
                  //       width: width_tow * 2.5,
                  //       color: Colors.black,
                  //       child: Container(
                  //         color: Colors.white,
                  //         alignment: Alignment.center,
                  //         child: Text(
                  //           "800.000",
                  //           style: TextStyle(
                  //               fontSize: 10,
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 2,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       margin: EdgeInsets.only(right: 1),
                  //       padding: EdgeInsets.all(1),
                  //       height: 20,
                  //       width: width_tow * 6,
                  //       color: Colors.black,
                  //       child: Container(
                  //         color: Colors.grey[100],
                  //         alignment: Alignment.center,
                  //         child: Text(
                  //           "المبلغ النهائي",
                  //           style: TextStyle(
                  //               fontSize: 10,
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.only(right: 1),
                  //       padding: EdgeInsets.all(1),
                  //       height: 20,
                  //       width: width_tow * 2.5,
                  //       color: Colors.black,
                  //       child: Container(
                  //         color: Colors.white,
                  //         alignment: Alignment.center,
                  //         child: Text(
                  //           "1.941.000",
                  //           style: TextStyle(
                  //               fontSize: 10,
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  // ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

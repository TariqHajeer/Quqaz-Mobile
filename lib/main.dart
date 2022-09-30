import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Binding/binding.dart';
import 'package:quqaz/Intro%20Page/view.dart';
import 'package:quqaz/Login/controller.dart';
import 'package:quqaz/Login/view.dart';
import 'package:quqaz/User_Account/controller.dart';
import 'package:quqaz/controller/appController.dart';

import 'Home/view.dart';

main(List<String> args) async {
  HttpOverrides.global = new MyHttpOverrides();
  // await Future.delayed(Duration(seconds: 10));
  WidgetsFlutterBinding.ensureInitialized();
  var connectivityResult = await (Connectivity().checkConnectivity());
  print(connectivityResult);
  if (connectivityResult == ConnectivityResult.none) {
    return runApp(MyApp());
  }
  var c = Get.put<LoginController>(LoginController(), permanent: true);
  Get.put(GetByTokenController(), permanent: true);
  bool home = false;
  await GetStorage.init();
  var box = GetStorage();
  var token = box.read('token');
  if (token != null) {
    bool response = await ApiService.checkTokenValidate(token);
    if (response == true) {
      home = true;
      c.token = token;
    }
  }
  runApp(Main(home));
}

class Main extends StatefulWidget {
  bool? home;
  Main(this.home);
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext c) {
    AppController appController = Get.put(AppController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget.home! ? Home() :
      IntroPageView(),
      initialBinding: widget.home! ? AppBinding() : null,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: new MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  // Wrapper Widget
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return Container(
      child: Center(
        child: Image.asset(
          "images/quqaz.jpeg",
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Text(
          "تأكد من وجود اتصال باللإنترنت",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.right,
        ),
        contentPadding: EdgeInsets.all(15),
        // actionsAlignment: MainAxisAlignment.start,
        actions: [
          ElevatedButton(
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
            child: Text(
              "موافق",
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:signalr_flutter/signalr_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _signalRStatus = 'Unknown';
//   late SignalR signalR;
//   final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
//       GlobalKey<ScaffoldMessengerState>();

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     signalR = SignalR(
//       'http://mohammedhatem-001-site4.itempurl.com',
//       "NotificationHub",
//       hubMethods: ["RM"],
//       statusChangeCallback: _onStatusChange,
//       hubCallback: _onNewMessage,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       scaffoldMessengerKey: rootScaffoldMessengerKey,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SignalR Plugin Example App'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Connection Status: $_signalRStatus\n',
//                   style: Theme.of(context).textTheme.headline5),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: ElevatedButton(
//                     onPressed: _buttonTapped, child: Text("Invoke Method")),
//               )
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.cast_connected),
//           onPressed: () async {
//             final isConnected = await signalR.isConnected ?? false;
//             if (!isConnected) {
//               await signalR.connect();
//             } else {
//               signalR.stop();
//             }
//           },
//         ),
//       ),
//     );
//   }

//   _onStatusChange(dynamic status) {
//     if (mounted) {
//       setState(() {
//         _signalRStatus = status as String;
//       });
//     }
//   }

//   _onNewMessage(String? methodName, dynamic message) {
//     print('MethodName = $methodName, Message = $message');
//   }

//   _buttonTapped() async {
//     final res = await signalR.invokeMethod<dynamic>("RM",
//         arguments: ["<Your Method Arguments>"]).catchError((error) {
//       print(error.toString());
//     });
//     final snackBar = SnackBar(content: Text('SignalR Method Response: $res'));
//     rootScaffoldMessengerKey.currentState!.showSnackBar(snackBar);
//   }
// }

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// class spl extends StatefulWidget {
//   const spl({Key? key}) : super(key: key);
//
//   @override
//   State<spl> createState() => _splState();
// }
//
// class _splState extends State<spl> {
//
//   changeScreen() {
//      Timer.periodic(Duration(seconds: 2), (timer) {
//        Navigator.of(context).pushReplacementNamed('pageOne');
//      });
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     changeScreen();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FlutterLogo(size: 200,),
//             // CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }

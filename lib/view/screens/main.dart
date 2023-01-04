// import 'dart:async';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'sp.dart';
// // import 'splash.dart';
import '1page.dart';
import '2page.dart';
import '3page.dart';
import '4page.dart';
// import 'global.dart';
// // import 'splash.dart';
//
//
//
// void main() {
//   runApp(
//     const Myapp(),
//   );
// }
//
//
//
//
// class Myapp extends StatefulWidget {
//   const Myapp({super.key});
//
//   @override
//   State<Myapp> createState() => _MyappState();
// }
//
// class _MyappState extends State<Myapp> {
//
//   @override
//   void initState() {
//     super.initState();
//
//
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//
//     ]);
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(
//         statusBarColor: Colors.white,
//         systemNavigationBarColor: Colors.black,
//       ),
//     );
//
//     return MaterialApp(
//         // debugShowCheckedModeBanner: false,
//         // initialRoute: '/',
//         // routes: {
//         //   '/': (context) => const spl(),
//         //   // 'Myapp': (context) => const Myapp(),
//         //   'pageOne': (context) => const pageOne(),
//         //   'Spage': (context) => const Spage(),
//         //   'Tpage': (context) => const Tpage(),
//         //   'Fpage': (context) => const Fpage(),
//         // },
//
//
//     );
//       // Scaffold(
//       // floatingActionButton: FloatingActionButton(
//       //     child: Icon(
//       //       Icons.add,
//       //       size: 50,
//       //     ),
//       //     onPressed: () {
//       //       Navigator.of(context).pushNamed('Spage');
//       //     }),
//       // appBar: AppBar(
//       //   title: Text(
//       //     "Contacts",
//       //     style: TextStyle(
//       //         fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
//       //   ),
//       //   backgroundColor: Colors.white,
//       //   elevation: 5,
//       //   actions: [
//       //     GestureDetector(
//       //       onTap: () {
//       //         setState(() {
//       //
//       //         });
//       //       },
//       //       child: Container(
//       //         height: 25,
//       //         width: 25,
//       //         decoration: BoxDecoration(
//       //           color: Colors.black,
//       //           shape: BoxShape.circle,
//       //           border: Border.all(color: Color(0xffeeeeee), width: 2.5),
//       //         ),
//       //       ),
//       //     ),
//       //     Icon(
//       //       Icons.more_vert,
//       //       color: Colors.black,
//       //     ),
//       //     SizedBox(
//       //       width: 5,
//       //     ),
//       //   ],
//       // ),
//       // body: (Global.zeel.isEmpty)
//       //     ? Container(
//       //         width: MediaQuery.of(context).size.width,
//       //         height: MediaQuery.of(context).size.height,
//       //         color: Colors.white,
//       //         child: Column(
//       //           mainAxisAlignment: MainAxisAlignment.start,
//       //           children: [
//       //             Padding(
//       //               padding: const EdgeInsets.fromLTRB(155, 155, 155, 10),
//       //               child: Image.asset("assets/images/1.png"),
//       //             ),
//       //             Text(
//       //               "You have no contacts yet",
//       //               style: TextStyle(color: Colors.grey, fontSize: 20),
//       //             ),
//       //           ],
//       //         ),
//       //       )
//       //     : GestureDetector(
//       //         onTap: () {
//       //           setState(() {
//       //             // MaterialPageRoute(
//       //             //     builder: (context) =
//       //             // Navigator.pushNamed(context, 'Tpage');
//       //           });
//       //         },
//       //         child: ListView.builder(
//       //           itemCount: Global.zeel.length,
//       //           itemBuilder: (context, i) => ListTile(
//       //             leading: Padding(
//       //               padding: const EdgeInsets.only(),
//       //               child: GestureDetector(
//       //                 onTap: () {
//       //                   setState(() {
//       //                     Navigator.of(context)
//       //                         .pushNamed('Tpage', arguments: Global.zeel[i]);
//       //                   });
//       //                 },
//       //                 child: (Global.zeel[i].Image != null)
//       //                     ? CircleAvatar(
//       //                         backgroundImage: (Global.zeel[i].Image != null)
//       //                             ? FileImage(Global.zeel[i].Image!)
//       //                             : null,
//       //                       )
//       //                     : Container(
//       //                         child: Image.asset(
//       //                         "assets/images/6.jpg",height: 43,width: 43,
//       //                       )),
//       //               ),
//       //             ),
//       //             title: Text(
//       //               "${Global.zeel[i].firstname} ${Global.zeel[i].lastname}",
//       //             ),
//       //             subtitle: Text(
//       //               "+91 ${Global.zeel[i].phonenumber} ",
//       //             ),
//       //             trailing: Icon(Icons.call,color: Colors.green,),
//       //           ),
//       //         ),
//       //       ),
//     // );
//   }
// }


import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    homepage(),
  );
}


class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // initialRoute: '/',
      routes: {
        // 'spl': (context) => const spl(),
        // 'Myapp': (context) => const Myapp(),
        '/': (context) =>  pageOne(),
        'Spage': (context) => const Spage(),
        'Tpage': (context) => const Tpage(),
        'Fpage': (context) => const Fpage(),
      },
    );
  }
}

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
//     Timer.periodic(Duration(seconds: 2), (timer) {
//       Navigator.of(context).pushReplacementNamed('pageOne');
//     });
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

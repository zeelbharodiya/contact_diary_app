import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '3page.dart';
import 'global.dart';

class pageOne extends StatefulWidget {
  const pageOne({Key? key}) : super(key: key);

  @override
  State<pageOne> createState() => _pageOneState();
}

class _pageOneState extends State<pageOne> {

  makeCall({String? number}) async {
    final Uri call = Uri(scheme: 'tel', path: number);
    await launchUrl(call);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           debugShowCheckedModeBanner: false,
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: theme.isDark == true ? ThemeMode.dark : ThemeMode.light,
     home:
      Scaffold(
        appBar: AppBar(
          title: Text(
            "Contacts",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
          // backgroundColor: Colors.white,
          elevation: 5,
          actions: [
            // Switch(value: Global.isDark,
            //     onChanged: (val) {
            //   setState(() {
            //     Global.isDark = val;
            //   });
            // }),
            (theme.isDark == true)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        theme.isDark = false;
                      });
                    },
                    child: Container(
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.black, width: 3),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        theme.isDark = true;
                      });
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Color(0xffeeeeee), width: 2.5),
                      ),
                    ),
                  ),
            Icon(
              Icons.more_vert,
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        body: (Global.zeel.isEmpty)
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(155, 155, 155, 10),
                      child: (theme.isDark == true) ? Image.asset("assets/images/1.png",color: Colors.white,) : Image.asset("assets/images/1.png"),
                    ),
                    Text(
                      "You have no contacts yet",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: Global.zeel.length,
                itemBuilder: (context, i) => InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, 'Tpage',
                          arguments: Global.zeel[i]);
                    });
                  },
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(),
                      child: (Global.zeel[i].Image != null)
                          ? InkWell(
                             onTap: () async {
                                await Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) => Tpage(),
                                       settings:
                                       RouteSettings(arguments: Global.zeel[i])),
                                 );
                                setState(() {

                                });
                             },
                              child: CircleAvatar(
                                backgroundImage: (Global.zeel[i].Image != null)
                                    ? FileImage(Global.zeel[i].Image!)
                                    : null,
                              ),
                            )
                          : InkWell(
                              onTap: () async{

                                 await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Tpage(),
                                        settings:
                                            RouteSettings(arguments: Global.zeel[i])),
                                  );
                                  // Navigator.pushNamed(context, 'Tpage',
                                  //     arguments: Global.zeel[i]);
                                setState(() {

                                });
                              },
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/images/6.jpg"),
                              ),

                            ),
                    ),
                    title: Text(
                      "${Global.zeel[i].firstname} ${Global.zeel[i].lastname}",
                    ),
                    subtitle: Text(
                      "+91 ${Global.zeel[i].phonenumber} ",
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          makeCall(number: Global.zeel[i].phonenumber);
                        });
                      },
                      child: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 40,
              color: theme.isDark == true ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('Spage');
            }),
      ),
    );
    // );
  }
}

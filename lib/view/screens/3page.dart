import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:untitled/view/screens/4page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'global.dart';

class Tpage extends StatefulWidget {
  const Tpage({Key? key}) : super(key: key);

  @override
  State<Tpage> createState() => _TpageState();
}

class _TpageState extends State<Tpage> {
  makeCall({String? number}) async {
    final Uri call = Uri(scheme: 'tel', path: number);
    await launchUrl(call);
  }

  makeSms({String? message}) async {
    final Uri sms = Uri(scheme: 'sms', path: message);
    await launchUrl(sms);
  }

  makeEmail({String? email}) async {
    final Uri mail = Uri(scheme: 'mailto', path: email);
    await launchUrl(mail);
  }

  @override
  Widget build(BuildContext context) {
    dynamic edit = ModalRoute.of(context)!.settings.arguments;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.light,
      darkTheme: theme.dark,
      themeMode: theme.isDark == true ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Icon(
                Icons.arrow_back_ios,
              )),
          title: Text(
            "Contacts",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25),
          ),
          elevation: 5,
          actions: [
            (theme.isDark == true)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        theme.isDark = false;
                      });
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.black, width: 2.5),
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
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              // CircleAvatar(
              // radius: 80,
              // backgroundImage: ,
              // ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (edit.Image == null)
                      ? Stack(
                          alignment: Alignment(0.7, 1),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Container(
                                height: 170,
                                width: 170,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/6.jpg"),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 300),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Global.zeel.remove(edit);
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: theme.isDark == false
                                        ? Colors.black
                                        : Colors.white,
                                    size: 35,
                                  )),
                            ),
                          ],
                        )
                      : Stack(
                          alignment: Alignment(0.5, 1),
                          children: [
                            CircleAvatar(
                              radius: 90,
                              backgroundColor: Colors.grey[400],
                              backgroundImage: (edit.Image != null)
                                  ? FileImage(edit.Image!)
                                  : null,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 300),
                              child: GestureDetector(
                                  onTap: () {
                                    Global.zeel.remove(edit);
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: theme.isDark == false
                                        ? Colors.black
                                        : Colors.white,
                                    size: 35,
                                  )),
                            ),
                          ],
                        ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 110, left: 20),
                  //   child: IconButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pushNamed('Fpage' , arguments: edit);
                  //     },
                  //     icon: Icon(
                  //     Icons.edit,
                  //     color: Colors.black,
                  //     size: 35,
                  //   ),),
                  // ),
                  (edit.Image == null)
                      ? Padding(
                          padding: const EdgeInsets.only(top: 132, left: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() async {
                                // Contact z = Contact(
                                //     firstname: edit.firstname,
                                //     lastname: edit.lastname,
                                //     phonenumber: edit.phonenumber,
                                //     email: edit.email,
                                //     Image: edit.Image);

                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Fpage(),
                                      settings: RouteSettings(arguments: edit)),
                                );
                              });
                            },
                            child: Icon(
                              Icons.edit,
                              color: theme.isDark == false
                                  ? Colors.black
                                  : Colors.white,
                              size: 35,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 140, left: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() async {
                                // Navigator.of(context).pushNamed('Fpage',
                                //     arguments: edit);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Fpage(),
                                      settings: RouteSettings(arguments: edit)),
                                );
                              });
                            },
                            child: Icon(
                              Icons.edit,
                              color: theme.isDark == false
                                  ? Colors.black
                                  : Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "${edit.firstname} ${edit.lastname}",
                style: TextStyle(
                    color: theme.isDark == true ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 65, 25, 20),
                child: Row(
                  children: [
                    Text(
                      "+91 ${edit.phonenumber}",
                      style: TextStyle(
                          color: theme.isDark == true ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 23),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.black,
                endIndent: 25,
                indent: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          makeCall(number: edit.phonenumber);
                        });
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.call,  color: theme.isDark == true ? Colors.white : Colors.black,),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          makeSms(message: edit.phonenumber);
                        });
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.message, color: theme.isDark == true ? Colors.white : Colors.black,),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          makeEmail(email: edit.email);
                        });
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.email,
                            color: theme.isDark == true ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() async {
                          await Share.share(
                              "Name : ${edit.firstname}\nContact : ${edit.phonenumber}");
                        });
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.share, color: theme.isDark == true ? Colors.white : Colors.black,),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.black,
                endIndent: 25,
                indent: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

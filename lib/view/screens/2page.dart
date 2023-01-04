import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'global.dart';

class Spage extends StatefulWidget {
  const Spage({Key? key}) : super(key: key);

  @override
  State<Spage> createState() => _SpageState();
}

class _SpageState extends State<Spage> {

  File? _image;
  ImagePicker pick = ImagePicker();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? Fname1;
  String? Lname1;
  String? Phone1;
  String? Email1;

  TextEditingController Fname = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Email = TextEditingController();

  getImageFromGallary() async {
    XFile? xfile = await pick.pickImage(source: ImageSource.camera);
    String path = xfile!.path;
    // final file = await pick.pickImage(source: ImageSource.camera);
    // if (file != null) {
      setState(() {
        _image = File(path);
      });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: theme.light,
      darkTheme: theme.dark,
      themeMode: theme.isDark == true ? ThemeMode.dark : ThemeMode.light,

      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
              child: Icon(
            Icons.arrow_back,
          )),
          title: Text(
            "Add",
            style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold),
          ),
          elevation: 5,
          actions: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();

                    Contact c = Contact(
                      firstname: Fname1,
                      lastname: Lname1,
                      phonenumber: Phone1,
                      email: Email1,
                      Image: _image,
                    );

                    Global.zeel.add(c);

                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  }

                });
              },
              child: Icon(
                Icons.check,
              ),
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment(1, 0.8),
                children: [
                  (_image != null) ?
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[400],
                    backgroundImage: (_image != null)
                        ? FileImage(_image!)
                        : null,
                  ) : Image.asset("assets/images/3.png"),
                  FloatingActionButton(
                    // backgroundColor: Colors.grey,
                      mini: true,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          getImageFromGallary();
                        });
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 75, 30, 25),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: Fname,
                  cursorColor: Color(0xffd67848),
                  cursorRadius: Radius.circular(10),
                  onSaved: (val) {
                    setState(() {
                      Fname1 = val;
                    });
                  },
                  validator: (val) {
                    if(val!.isEmpty){
                      return "Enter your first name";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "First Name",
                      // fillColor: Colors.white,
                      // filled:  true,
                      // hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Color(0xffd67848),
                      ),
                      // enabled: true,
                      // enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                        // borderSide: BorderSide(color: Colors.yellowAccent),
                      )),
                  // validator: (val) {
                  //    if(val!.isEmpty){
                  //      return "Enter Your First Name";
                  //    }
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: Lname,
                  onSaved: (val) {
                    setState(() {
                      Lname1 = val;
                    });
                  },
                  validator: (val) {
                    if(val!.isEmpty){
                      return "Enter your last name";
                    }
                  },
                  cursorColor: Color(0xffd67848),
                  cursorRadius: Radius.circular(10),
                  decoration: InputDecoration(
                      hintText: "Last Name",
                      // fillColor: Colors.white,
                      // filled: true,
                      // hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Color(0xffd67848),
                      ),
                      // enabled: true,
                      // enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                        // borderSide: BorderSide(color: Colors.yellowAccent),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: Phone,
                  onSaved: (val) {
                    setState(() {
                      Phone1 = val;
                    });
                  },
                  validator: (val) {
                    if(val!.isEmpty){
                      return "Enter your phone";
                    }
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Color(0xffd67848),
                  cursorRadius: Radius.circular(10),
                  decoration: InputDecoration(
                      hintText: "Phone number",
                      // fillColor: Colors.white,
                      // filled: true,
                      // hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
                      prefixIcon: Icon(
                        Icons.call_outlined,
                        color: Color(0xffd67848),
                      ),
                      // enabled: true,
                      // enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                        // borderSide: BorderSide(color: Colors.yellowAccent),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: Email,
                  onSaved: (val) {
                    setState(() {
                      Email1 = val;
                    });
                  },
                  validator: (val) {
                    if(val!.isEmpty){
                      return "Enter your email";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Color(0xffd67848),
                  cursorRadius: Radius.circular(10),
                  decoration: InputDecoration(
                      hintText: "Email",
                      // fillColor: Colors.white,
                      // filled: true,
                      // hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xffd67848),
                      ),
                      // enabled: true,
                      // enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                        // borderSide: BorderSide(color: Colors.yellowAccent),
                      )),
                ),
              ),
            ],
          ),
        ),
        // backgroundColor: Color(0xfff6f6f6),
      ),
    );
  }
}

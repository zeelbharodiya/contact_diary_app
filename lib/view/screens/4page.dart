import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'global.dart';



class Fpage extends StatefulWidget {
  const Fpage({Key? key}) : super(key: key);

  @override
  State<Fpage> createState() => _FpageState();
}

class _FpageState extends State<Fpage> {


  bool q = true;

  File? _image;
  ImagePicker pick = ImagePicker();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? Fname2;
  String? Lname2;
  String? Phone2;
  String? Email2;

  TextEditingController Fname00 = TextEditingController();
  TextEditingController Lname00 = TextEditingController();
  TextEditingController Phone00 = TextEditingController();
  TextEditingController Email00 = TextEditingController();

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

    dynamic tick = ModalRoute.of(context)!.settings.arguments;

    // Fname00.text = tick.firstname;
    // Lname00.text = tick.lastname;
    // Phone00.text = tick.phonenumber;
    // Email00.text = tick.email;


    return
      MaterialApp(
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
              "Edit Contact",
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

                      if(_image == null)
                        {
                          _image = tick.Image;
                        }
                      Contact ca = Contact(
                        firstname: Fname2,
                        lastname: Lname2,
                        phonenumber: Phone2,
                        email: Email2,
                        Image: _image,
                      );

                     int a = Global.zeel.indexOf(tick);
                     Global.zeel[a] = ca;
                      // Navigator.of(context).pushNamedAndRemoveUntil("pageOne", (route) => false);
                    }
                    setState(() {
                      // Navigator.pushReplacementNamed(context, 'Myapp');
                      // Navigator.pushReplacementNamed(context, "pageOne");
                      Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
                    });
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
                    (q) ?
                    (tick.Image != null)
                          ? CircleAvatar(
                             radius: 80,
                             backgroundColor: Colors.grey[400],
                             backgroundImage: (tick.Image != null)
                                 ? FileImage(tick.Image!)
                                 : null,
                       ) : Image.asset("assets/images/3.png")
                        : (_image != null)
                          ? CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.grey[400],
                              backgroundImage: (_image != null)
                                  ? FileImage(_image!)
                                  : null,
                       ) : Image.asset("assets/images/3.png"),
                    // (_image != null)
                    //     ?  FloatingActionButton(
                    //     mini: true,
                    //     child: Icon(
                    //       Icons.add,
                    //       size: 35,
                    //     ),
                    //     onPressed: () {
                    //       setState(() {
                    //         getImageFromGallary();
                    //         // q = false;
                    //       });
                    //     })
                    //     :
                    FloatingActionButton(
                        mini: true,
                        child: Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() async{
                            getImageFromGallary();
                            // XFile? xfile = await pick.pickImage(source: ImageSource.camera);
                            // String path = xfile!.path;
                            // // final file = await pick.pickImage(source: ImageSource.camera);
                            // // if (file != null) {
                            // setState(() {
                            //   _image = File(path);
                            // });
                            q = false;
                          });
                        }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 75, 30, 25),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    // controller: Fname00,
                    initialValue: tick.firstname,
                    cursorColor: Color(0xffd67848),
                    cursorRadius: Radius.circular(10),
                    onSaved: (val) {
                      Fname2 = val;
                      setState(() {

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
                    // controller: Lname00,
                    initialValue: tick.lastname,
                    onSaved: (val) {
                      Lname2 = val;
                      setState(() {

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
                    // controller: Phone00,
                    initialValue: tick.phonenumber,
                    onSaved: (val) {
                      Phone2 = val;
                      setState(() {

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
                    // controller: Email00,
                    initialValue: tick.email,
                    onSaved: (val) {
                      Email2 = val;
                      setState(() {

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

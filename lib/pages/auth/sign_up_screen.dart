import 'package:borhanudiincollege/pages/auth/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:firebase_core/firebase_core.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  BuildContext? dialogContext;
  TextEditingController pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode phoneNumberFocusNode = FocusNode();
  final _formPhoneNumberKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // void submit(context) async {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0070BB),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          //physics: const ScrollPhysics(),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      "assets/images/Shaikh_Burhanuddin_Post_Graduate_College_logo.jpeg",
                      width: 100.h,
                      height: 40.w,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                  ),
                  const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xFF0070BB),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Form(
                      key: _formPhoneNumberKey,
                      child: TextFormField(
                        focusNode: phoneNumberFocusNode,
                        controller: emailController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 10),
                          hintStyle: const TextStyle(),
                          hintText: "Enter Email",
                          fillColor: const Color(0xFF0070BB),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Color(0xFF0070BB), width: 4.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                              color: Color(0xFF0070BB),
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Email is required";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Not Valid Email";
                          }
                          return null;
                        },
                        //onSaved: onsaved,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: TextFormField(
                      controller: pinController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 10),
                        hintStyle: const TextStyle(),
                        hintText: "Enter Your PIN",
                        fillColor: const Color(0xFF0070BB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF0070BB), width: 4.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF0070BB),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "PIN is required";
                        } else if (value.length < 6) {
                          return "PIN at least 6 character";
                        } else if (value.length > 8) {
                          return "PIN is not more than 6 character";
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) async {
                        // if (_formKey.currentState!.validate()) {
                        //   await AuthRepository().login(
                        //     number: phoneController.text,
                        //     context: context,
                        //     data: {
                        //       'mobile': phoneController.text,
                        //       'password': pinController.text,
                        //     },
                        //   );
                        // }
                      },
                      //onSaved: onsaved,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0070BB),
                        minimumSize: const Size(150, 40),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dialogContext = context;
                          showDialog(
                            context: dialogContext!,
                            builder: (context) => AlertDialog(
                              content: SizedBox(
                                height: 50,
                                width: 50,
                                child: Lottie.asset('assets/loading.json'),
                              ),
                            ),
                          );

                          signUp(dialogContext!, context);
                        }
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("SIGN UP"),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.login),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Hotline : ',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        "+88 02-57300525, 57300204  ",
                        style:
                            TextStyle(color: Color(0xFF0070BB), fontSize: 12),
                      ),
                      Text(
                        'Cell : ',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        "+88 01819023177",
                        style:
                            TextStyle(color: Color(0xFF0070BB), fontSize: 12),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      ' E-mail: info@sbpgc.edu.bd',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Image.asset(
          "assets/images/welcome_footer.png",
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height * 0.11,
        ),
      ),
    );
  }

  Future signUp(BuildContext context, BuildContext context1) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: pinController.text);

      await ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Account  Created')));
      Navigator.of(context).pop();
      Navigator.of(context1).push(MaterialPageRoute(
        builder: (context1) => LoginScreen(),
      ));
    } on FirebaseAuthException catch (e) {
      await ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      print(e);
      Navigator.of(context).pop();
    }
  }
}

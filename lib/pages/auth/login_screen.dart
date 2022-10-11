// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:borhanudiincollege/pages/addmission_form.dart';
import 'package:borhanudiincollege/pages/auth/sign_up_screen.dart';
import 'package:borhanudiincollege/pages/choose_screen.dart';
import 'package:borhanudiincollege/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  BuildContext? dialogContext;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  TextEditingController emailController = TextEditingController();
  BuildContext? dialogContext;
  TextEditingController pinController = TextEditingController();


StreamSubscription? connection;
  bool isoffline = false;


  @override
  void initState() {  Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    // TODO: implement initState
    
    connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isoffline = await InternetConnectionChecker().hasConnection;

      if (isoffline == false) {
      
       
      }

      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          isoffline = true;
        });
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        setState(() {
          isoffline = false;
        });
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        setState(() {
          isoffline = false;
        });
      } else if (result == ConnectivityResult.ethernet) {
        //connection is from wired connection
        setState(() {
          isoffline = false;
        });
      } else if (result == ConnectivityResult.bluetooth) {
        //connection is from bluetooth threatening
        setState(() {
          isoffline = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    connection!.cancel();
  }




  final _formKey = GlobalKey<FormState>();
  FocusNode phoneNumberFocusNode = FocusNode();
  final _formPhoneNumberKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Image.asset(
                  "assets/images/Shaikh_Burhanuddin_Post_Graduate_College_logo.jpeg",
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                // const LoginScreenBoxDecoration(
                //   boxText: "Mobile Number",
                // ),

                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Color(0xFF0070BB),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.020,
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
                      } else if (value.length < 4) {
                        return "PIN at least 4 character";
                      } else if (value.length > 8) {
                        return "PIN is not more than 6 character";
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) async {
                      signIn(dialogContext!, context);
                    },
                    //onSaved: onsaved,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      dialogContext = context;

                      if (emailController.text.isEmpty) {
                        if (_formPhoneNumberKey.currentState!.validate()) {
                          FocusScope.of(context)
                              .requestFocus(phoneNumberFocusNode);
                        }
                        setState(() {});
                      }
                      if (emailController.text.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: SizedBox(
                              height: 50,
                              width: 50,
                              child: Lottie.asset('assets/loading.json'),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Forgot PIN",
                      style: TextStyle(
                          color: Color(0xFF0070BB),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0070BB),
                      minimumSize: const Size(160, 40),
                    ),
                    onPressed: () async {
                      if (pinController.text.isEmpty &&
                          pinController.text.isEmpty) {
                      } else {
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

                          signIn(dialogContext!, context);
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("LOGIN"),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.login),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                      style: TextStyle(color: Color(0xFF0070BB), fontSize: 12),
                    ),
                    Text(
                      'Cell : ',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    Text(
                      "+88 01819023177",
                      style: TextStyle(color: Color(0xFF0070BB), fontSize: 12),
                    ),
                  ],
                ),
                const Text(
                  ' E-mail: info@sbpgc.edu.bd',
                  style: TextStyle(color: Colors.black, fontSize: 12),
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
    );
  }

  Future signIn(BuildContext context, BuildContext context1) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: pinController.text);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Logged In SuccessFully')));

      Navigator.of(context1).push(MaterialPageRoute(
        builder: (context1) => HomePage(),
      ));
    } on FirebaseAuthException catch (e) {
      await ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      print(e);
      Navigator.of(context).pop();
    }
  }
}

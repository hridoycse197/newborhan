// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:borhanudiincollege/pages/addmission_form.dart';
import 'package:borhanudiincollege/pages/auth/login_screen.dart';
import 'package:borhanudiincollege/pages/choose_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CseScreen extends StatefulWidget {
  const CseScreen({Key? key}) : super(key: key);

  @override
  State<CseScreen> createState() => _CseScreenState();
}

class _CseScreenState extends State<CseScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool check = false;
  CookieManager? cookieManager;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.green,
        child: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChooseScreen(),
                  ));
                },
                child: const Card(
                  child: ListTile(
                    title: Text('Addmission'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
                child: const Card(
                  child: ListTile(
                    title: Text('CSE DepartMent'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CseScreen(),
                  ));
                },
                child: const Card(
                  child: ListTile(
                    title: Text('SignOut'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: WebView(
          backgroundColor: Colors.green,
          initialUrl:
              'https://sbpgc.edu.bd/index.php?option=com_content&view=article&id=177&Itemid=100',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            Center(
                child: Column(
              children: const [
                Text("Loading"),
                CircularProgressIndicator(
                  strokeWidth: 40,
                ),
              ],
            ));
            print('WebView is loading (progress : $progress%)');
          },
        ),
      ),
    );
  }
}

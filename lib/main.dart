import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/SignInWidget.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MyApp());
}
_launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
          backgroundColor: Colors.black,
        ),
        body: SignInWidget(),
      ),
    );
  }
}


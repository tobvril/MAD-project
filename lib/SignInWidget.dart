import 'package:flutter/material.dart';
import 'package:project1/SignUpWidget.dart';
import 'package:project1/Home.dart';


class SignInWidget extends StatelessWidget {
  final myIDController = TextEditingController();
  final myPWDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem(context, 'images/logo.png'),
        ],
      ),
    );
  }


Widget _buildListItem(BuildContext cxt, String img) {
  return Material(
    child: Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20), // Adjust top padding for the image
              child: Container(
                width: 220,
                height: 220,
                child: Padding(
                  padding: EdgeInsets.all(8), // Add padding for the image
                  child: Image.asset(img),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(18),
              child: TextFormField(
                controller: myIDController,
                decoration: InputDecoration(
                  hintText: 'UserID',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: TextFormField(
                controller: myPWDController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(cxt).push(MaterialPageRoute(builder: (context) => HomeWidget(txtID: myIDController.text, txtPWD: myPWDController.text,)));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Change the button color here
              ),
              child: Text('Sign In'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.of(cxt).push(MaterialPageRoute(builder: (context) => SignUpWidget()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    ),
  );
}
}
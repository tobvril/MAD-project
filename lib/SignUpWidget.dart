import 'package:flutter/material.dart';
import 'Home.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.black,
      ),
      body: _buildListItem(context, 'images/logo.png'), // Call _buildListItem here
    );
  }

  Widget _buildListItem(BuildContext cxt, String img) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              width: 220,
              height: 220,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset('images/logo.png'),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(18),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Name',
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
            child: TextField(
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
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
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
            child: TextField(
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
              Navigator.of(cxt).push(MaterialPageRoute(builder: (context) => HomeWidget()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}

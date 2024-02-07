import 'package:flutter/material.dart';
import 'package:project1/AboutUsWidget.dart';
import 'package:project1/Home.dart';
import 'package:project1/ProfileWidget.dart';
import 'package:project1/main.dart';

class Successwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 310, // Adjust the height as needed
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        image: DecorationImage(
                          image: AssetImage('images/wonwoo.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Jenny',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Home'),
                    onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeWidget()));
                    },
                  ),
                  ListTile(
                    title: Text('Profile'),
                    onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileWidget()));
                    },
                  ),
                  ListTile(
                    title: Text('About Us'),
                    onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUsWidget()));
                    },
                  ),
                  Spacer(),
                  ListTile(
                    title: Text('Log Out'),
                    onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Your content goes here
        ],
      ),
    );
  }
}

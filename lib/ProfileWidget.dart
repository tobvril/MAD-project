import 'package:flutter/material.dart';
import 'package:project1/AboutUsWidget.dart';
import 'package:project1/main.dart';
import 'Home.dart';

class ProfileWidget extends StatefulWidget {
  final String txtID;
  final String txtPWD;

  const ProfileWidget({Key key, this.txtID, this.txtPWD}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String _userImagePath = 'images/wonwoo.jpg';

  void _toggleImage() {
    setState(() {
      _userImagePath =
          _userImagePath == 'images/wonwoo.jpg' ? 'images/superwoman.jpg' : 'images/wonwoo.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
              width: 310,
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
                          image: AssetImage(_userImagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.txtID,
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
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeWidget(txtID: widget.txtID, txtPWD: _userImagePath),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Profile'),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileWidget(txtID: widget.txtID, txtPWD: _userImagePath),
                        ),
                      );
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.txtID, style: TextStyle(fontSize: 30),),

            SizedBox(height: 20),
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                border: Border.all(color: Colors.blueGrey, width: 10),
                image: DecorationImage(
                  image: AssetImage(_userImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _toggleImage,
              child: Text('Change Image'),
            ),
          ],
        ),
      ),
    );
  }
}

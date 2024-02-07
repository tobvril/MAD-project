import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Welcome to About Us!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Are you DOWN TO EAT? '
                    'We were founded in Singapore but we identify as French. We love baguettes and croissants. '
                    'We also love the Eiffel Tower. It is so pretty',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text('Email'),
                        subtitle: GestureDetector(
                          onTap: () {
                           launch(_emailLaunchUri.toString());
                          },
                          child: Text(
                            'ouiouibaguette@gmail.com',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                        subtitle: GestureDetector(
                          onTap: () {
                           launch(_phoneLaunchUri.toString());
                          },
                          child: Text(
                            '62627493',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
final Uri _emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'ouiouibaguette@gmail.com',
  queryParameters: {
    'subject': 'Feedback about app'
  }
);
final Uri _phoneLaunchUri = Uri(
  scheme: 'tel',
  path: '62627493', 
);

}

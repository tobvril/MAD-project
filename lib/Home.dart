import 'package:flutter/material.dart';
import 'package:project1/AboutUsWidget.dart';
import 'package:project1/OrderWidget.dart';
import 'package:project1/ProfileWidget.dart';
import 'package:project1/main.dart';

class HomeWidget extends StatefulWidget {
  final String txtID;
  final String txtPWD;
  final String img;
  final String menu;
  final String store;

  const HomeWidget({Key key, this.txtID, this.txtPWD, this.img, this.menu, this.store}) : super(key: key);

 

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String getUserImagePath() {
    if (widget.txtID != null && widget.txtID.toLowerCase() == "jenny") {
      return 'images/wonwoo.jpg';
    } else {
      return 'images/guest.jpg';
    }
  }

  List<String> recentlyOrderedItems = [];
  TextEditingController searchController = TextEditingController();

  Map<String, Map<String, String>> menuInfo = {
    'Mac and Cheese': {'img': 'images/mac.png', 'store': 'Pastazia'},
    'cheese burger': {'img': 'images/burger.png', 'store': 'MacDonald'},
    'Fries': {'img': 'images/fries.png', 'store': 'MacDonald'},
    'Fried Rice': {'img': 'images/friedrice.png', 'store': 'XiaoLongBao'},
    'Nuggets': {'img': 'images/nugget.png', 'store': 'MacDonald'},
  };

  Widget _buildItem(BuildContext context, String menu) {
    String img = menuInfo[menu]['img'];
    String store = menuInfo[menu]['store'];

    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          menu,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        Text(
          store,
          style: TextStyle(fontSize: 10, color: Colors.black),
          textAlign: TextAlign.left,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              recentlyOrderedItems.add(menu);
            });
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderWidget(rimg: img, rmenu: menu, rstore: store, pimg: getUserImagePath())));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          child: Text('Order'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
                          image: AssetImage(getUserImagePath()),
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
                          builder: (context) => HomeWidget(txtID: widget.txtID, txtPWD: getUserImagePath(), img: widget.img),
                        ),
                      );
                    },
                  ),

                  // Inside the ListTile for 'Profile'
                  ListTile(
                    title: Text('Profile'),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileWidget(txtID: widget.txtID, txtPWD: getUserImagePath()),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('About Us'),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AboutUsWidget(),
                        ),
                      );
                    },
                  ),
                  Spacer(),
                  ListTile(
                    title: Text('Log Out'),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                 onChanged: (value) {
                  setState(() {
                    // Filter the recentlyOrderedItems based on the search query
                    if (value.isNotEmpty) {
                      recentlyOrderedItems = menuInfo.keys.where((item) => item.toLowerCase().contains(value.toLowerCase())).toList();
                    } else {
                      // If search query is empty, reset recentlyOrderedItems to all items
                      recentlyOrderedItems = menuInfo.keys.toList();
                    }
                  });
                },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Recently Ordered',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (String item in recentlyOrderedItems) 
                          _buildItem(context, item),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildItem(context, 'cheese burger'),
                        _buildItem(context, 'Mac and Cheese'),
                        _buildItem(context, 'Fries'),
                        _buildItem(context, 'Fried Rice'),
                        _buildItem(context, 'Nuggets'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

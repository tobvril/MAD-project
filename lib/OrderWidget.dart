import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/CartWidget.dart';

class OrderWidget extends StatefulWidget {
  final String rimg;
  final String rmenu;
  final String rstore;
  final String pimg;

  const OrderWidget({Key key, this.rimg, this.rmenu, this.rstore, this.pimg}) : super(key: key);

  @override
  State<OrderWidget> createState() => OrderWidgetState();
}

class OrderWidgetState extends State<OrderWidget> {
  int _likeCount = 0;
  TextEditingController _textFieldController = TextEditingController();

  void _incrementCount() {
    setState(() {
      _likeCount++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_likeCount > 0) {
        _likeCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            width: 420,
            height: 270,
            child: Image.asset(widget.rimg),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.rmenu,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.rstore,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.black),
                onPressed: _decrementCount,
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  '$_likeCount',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: _incrementCount,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartWidget(cimg: widget.rimg, cmenu: widget.rmenu, cstore: widget.rstore, cquantity: _likeCount,)));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: Text('Add To Cart'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _textFieldController,
            decoration: InputDecoration(
              labelText: 'Modifications',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

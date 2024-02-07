import 'package:flutter/material.dart';


class CartWidget extends StatefulWidget {
  final String cimg;
  final String cmenu;
  final String cstore;
  final int cquantity;

  const CartWidget({Key key, this.cimg, this.cmenu, this.cstore, this.cquantity}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  List<CartItem> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _cartItems.add(CartItem(widget.cimg, widget.cmenu, widget.cstore, widget.cquantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(_cartItems[index].img),
            title: Text(_cartItems[index].menu),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Store: ${_cartItems[index].store}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            _decrementQuantity(index);
                          },
                        ),
                        Text('Quantity: ${_cartItems[index].quantity}'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            _incrementQuantity(index);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessPage()));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          child: Text('Proceed to Checkout'),
        ),
      ),
    );
  }

  void _incrementQuantity(int index) {
    setState(() {
      _cartItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      }
    });
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Successful'),
        backgroundColor: Colors.black, // or any other color you prefer
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            'Your order was successful!',
            style: TextStyle(fontSize: 20),
          ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String img;
  final String menu;
  final String store;
  int quantity;

  CartItem(this.img, this.menu, this.store, this.quantity);
}

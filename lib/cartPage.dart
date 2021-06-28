import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/cartModel.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<MyCart>(
          builder: (context, myCart, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(myCart.cartList.length.toString()),
              FlatButton(
                child: Text('Delete One Element from Cart'),
                onPressed: () {
                  myCart.removeFromLast();
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

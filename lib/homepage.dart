import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/cartModel.dart';
import 'package:provider_demo/cartPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo'),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
            ],
          ),
          InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20),
                ),
              ))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartPage()));
              },
              child: Container(
                height: 200,
                margin: EdgeInsets.only(top: 10),
                color: Colors.grey,
                child: Center(
                  child: Consumer<MyCart>(
                    builder: (context, myCart, child) => Text(
                      myCart.cartList.length.toString(),
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              margin: EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 200,
                              height: 150,
                              child: Text(''),
                              color: Colors.grey,
                              margin: EdgeInsets.only(right: 10, top: 10),
                            ),
                            Text(
                              'Product Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Consumer<MyCart>(
                              builder: (context, myCart, child) => FlatButton(
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    myCart.addToCart(index);
                                    print(myCart.cartList);
                                  }),
                            )
                          ])),
            )
          ],
        ),
      ),
    );
  }
}

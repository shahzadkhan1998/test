import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/components/horizental_list_view.dart';
import 'package:ecommerce/components/products.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/m1.jpg"),
          AssetImage("images/m2.jpg"),
          AssetImage("images/m3.jpg"),
          AssetImage("images/m4.jpg"),
          AssetImage("images/m5.jpg"),
          AssetImage("images/products/skt2.jpeg"),
        ],
        autoplay: false,
        // animationCurve: Curves.bounceOut,
        // animationDuration: Duration(milliseconds: 1000),
        dotBgColor: Colors.transparent,
        dotSize: 4.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Online"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: Text("Muhammad Shahzad"),
              accountEmail: Text("Sk266349@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(color: Colors.redAccent),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home, color: Colors.red),
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My account"),
                leading: Icon(Icons.person, color: Colors.red),
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("my order"),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: ListTile(
                title: Text("shopping Cart"),
                leading: Icon(Icons.shopping_cart, color: Colors.red),
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favourite"),
                leading: Icon(Icons.favorite, color: Colors.red),
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Setting"),
                leading: Icon(Icons.settings, color: Colors.lightBlue),
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(Icons.help, color: Colors.blueAccent),
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //////////// Coresoul start here///////////
          image_carousel,
          //// Padding Widget/////////////
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Categores",
              style: TextStyle(),
            ),
          ),
          /////////// Horizental list view start here/////////
          HorizentalList(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Recent Product",
              style: TextStyle(),
            ),
          ),
          //////////// Gridview//////////////////
          Flexible(
            child: Product(),
          ),
        ],
      ),
    );
  }
}

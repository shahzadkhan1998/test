import 'package:flutter/material.dart';

class Cart_product extends StatefulWidget {
  @override
  _Cart_productState createState() => _Cart_productState();
}

class _Cart_productState extends State<Cart_product> {
  var product_on_cart = [
    {
      "name": "dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 180,
      "price": 125,
      "size": "M",
      "color": "Red",
      "Quantity": 1,
    },
    {
      "name": "dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 120,
      "price": 15,
      "size": "N",
      "color": "green",
      "Quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: product_on_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: product_on_cart[index]["name"],
            cart_prod_color: product_on_cart[index]["color"],
            cart_prod_qty: product_on_cart[index]["Quantity"],
            cart_prod_size: product_on_cart[index]["size"],
            cart_prod_price: product_on_cart[index]["price"],
            cart_prod_picture: product_on_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  var cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    // ignore: non_constant_identifier_names
    this.cart_prod_qty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //================= LEADING SECTION==========================//
        leading: Image.asset(
          cart_prod_picture,
          width: 80.0,
          height: 100.0,
        ),
        // ==========================TITLE SECTION ==========================//
        title: new Text(
          cart_prod_name,
          style: TextStyle(fontSize: 20.0),
        ),
        // =============== Subtitle================================//
        subtitle: new Column(
          children: [
            Row(
              // ======================= this Size
              children: [
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                //=============== Colors
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 8.0, 8.0, 8.0),
                  child: Text("color:"),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: new Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            //========== price//////////////////////

            Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$$cart_prod_price",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        trailing: new Column(
          children: [
            Flexible(
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                  ),
                  onPressed: () {}),
              flex: 2,
            ),
            Flexible(
              child: Text("$cart_prod_qty"),
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

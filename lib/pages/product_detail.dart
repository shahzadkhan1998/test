import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text("FashionApp"),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: null,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "\$${widget.product_detail_old_price}",
                          style: TextStyle(
                              color: Colors.black38,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.product_detail_new_price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //============== first Button ==================///////////////////////
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text('Size'),
                          content: Text('Choose the Size'),
                          actions: <Widget>[
                            // ignore: deprecated_member_use
                            MaterialButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(dialogContext)
                                    .pop(); // Dismiss alert dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("size"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text('Colors'),
                          content: Text('Choose the colors'),
                          actions: <Widget>[
                            // ignore: deprecated_member_use
                            MaterialButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(dialogContext)
                                    .pop(); // Dismiss alert dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Colors"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text('Quantity'),
                          content: Text('Choose the Quantity'),
                          actions: <Widget>[
                            // ignore: deprecated_member_use
                            MaterialButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(dialogContext)
                                    .pop(); // Dismiss alert dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Qty"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //============== 2nd Button ==================///////////////////////
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Buy")),
              ),
              //====== Icon of Cart============///////////
              IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: Colors.red),
                  onPressed: () {}),
              //====== Icon of favorite============///////////
              IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {}),
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Details'),
            subtitle: Text(
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                " when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                " It has survived not only five centuries, but also the leap into electronic typesetting,"
                " remaining essentially unchanged. It was popularised in the 1960s with"
                " the release of Letraset sheets containing Lorem Ipsum passages,"
                " and more recently with desktop publishing "
                "software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5, 5, 5),
                child: Text(
                  'Product name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.product_detail_name),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5, 5, 5),
                child: Text(
                  'Product brand',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Product X"),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5, 5, 5),
                child: Text(
                  'Product condition',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("New"),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Similar product"),
          ),
          //======= Similair poduct======///////////////////////
          Container(
            height: 360.0,
            child: Similar_product(),
          )
        ],
      ),
    );
  }
}

class Similar_product extends StatefulWidget {
  @override
  _Similar_productState createState() => _Similar_productState();
}

class _Similar_productState extends State<Similar_product> {
  var product_list = [
    {
      "name": "shoes",
      "picture": "images/products/hills1.jpeg",
      "old_price": 160,
      "price": 125,
    },
    {
      "name": "shoes",
      "picture": "images/products/hills2.jpeg",
      "old_price": 190,
      "price": 125,
    },
    {
      "name": "dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 180,
      "price": 125,
    },
    {
      "name": "dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 120,
      "price": 15,
    },
    {
      "name": "pant",
      "picture": "images/products/pants2.jpeg",
      "old_price": 100,
      "price": 125,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_prod(
            product_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

// ignore: camel_case_types
class Similar_Single_prod extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final product_name;
  // ignore: non_constant_identifier_names
  final prod_picture;
  // ignore: non_constant_identifier_names
  final prod_old_price;
  // ignore: non_constant_identifier_names
  final prod_price;

  Similar_Single_prod({
    // ignore: non_constant_identifier_names
    this.product_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text(" product_name"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => new ProductDetails(
                      product_detail_name: product_name,
                      product_detail_new_price: prod_price,
                      product_detail_old_price: prod_old_price,
                      product_detail_picture: prod_picture,
                    ))),
            child: GridTile(
              footer: Container(
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          product_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                      Text(
                        "\$${prod_price}",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              child: Image.asset(prod_picture, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}

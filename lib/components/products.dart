import 'package:ecommerce/pages/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  // ignore: non_constant_identifier_names
  var product_list = [
    {
      "name": "Camera",
      "picture": "images/products/pants2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "bag",
      "picture": "images/m2.jpg",
      "old_price": 120,
      "price": 100,
    },
    {
      "name": "cloth",
      "picture": "images/m3.jpg",
      "old_price": 170,
      "price": 60,
    },
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
          return Single_prod(
            product_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

// ignore: camel_case_types
class Single_prod extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final product_name;
  // ignore: non_constant_identifier_names
  final prod_picture;
  // ignore: non_constant_identifier_names
  final prod_old_price;
  // ignore: non_constant_identifier_names
  final prod_price;

  Single_prod({
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
        tag: Text(product_name),
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

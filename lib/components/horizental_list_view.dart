import 'package:flutter/material.dart';

class HorizentalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          Category(
            image_location: 'images/cats/jeans.png',
            image_caption: 'shoes',
          ),
          Category(
            image_location: 'images/cats/tshirt.png',
            image_caption: 'bag',
          ),
          Category(
            image_location: 'images/cats/formal.png',
            image_caption: 'Shirt',
          ),
          Category(
            image_location: 'images/cats/dress.png',
            image_caption: 'Shirt',
          ),
          Category(
            image_location: 'images/cats/shoe.png',
            image_caption: 'Shirt',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String image_location;
  // ignore: non_constant_identifier_names
  final String image_caption;

  // ignore: non_constant_identifier_names
  Category({this.image_location, this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location, width: 100.0, height: 80),
            subtitle: Text(image_caption),
          ),
        ),
      ),
    );
  }
}

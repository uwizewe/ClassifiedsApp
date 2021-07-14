import 'package:flutter/material.dart';
import './provider/connect.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import 'package:share/share.dart';

// ignore: must_be_immutable
class AvocadoPage extends StatelessWidget {
  final String title;

  AvocadoPage(this.title);

  String link = image + 'laptop.jpg';
  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(title);

    String link = image + loadedProduct.images;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 450,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(link), fit: BoxFit.cover)),
          ),
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(
                color: Colors.blue.shade900,
                icon: Icon(
                  Icons.share,
                ),
                onPressed: () {
                  Share.share(
                    ' Product:' +
                        title +
                        ' Price: ' +
                        loadedProduct.price.toString() +
                        ' FRW from Download image on this link:' +
                        link,
                    subject: "Product Details",
                  );
                },
              )
            ],
          ),
          Positioned(
            top: 380,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    loadedProduct.name,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    loadedProduct.price.toString() + 'FRW',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        loadedProduct.info,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star,
                        size: 14.0,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.star,
                        size: 14.0,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.star,
                        size: 14.0,
                        color: Colors.red,
                      ),
                      Text("160"),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Slider(
                    onChanged: (value) {},
                    min: 1,
                    max: 5,
                    value: 1.5,
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        color: Colors.blue.shade900,
                        textColor: Colors.white,
                        child: Text("Add to Cart"),
                        onPressed: () {},
                      )),
                  SizedBox(height: 10.0),
                  Center(child: Icon(Icons.keyboard_arrow_up)),
                  Center(
                    child: Text(
                      "Know More",
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 365,
            right: 40,
            child: CircleAvatar(
                radius: 20.0,
                foregroundColor: Colors.grey,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.favorite_border)),
          )
        ],
      ),
    );
  }
}

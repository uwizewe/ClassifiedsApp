import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/connect.dart';
import '../provider/products.dart';
import 'package:share/share.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  final double price;

  ProductDetailScreen(this.title, this.price);

  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(title);

    String link = image + loadedProduct.images;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                link,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              loadedProduct.price.toString() + "FRW",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.info,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),

            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Share'),
              onPressed: () {
                Share.share(
                  loadedProduct.name,
                  subject: image + loadedProduct.images,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

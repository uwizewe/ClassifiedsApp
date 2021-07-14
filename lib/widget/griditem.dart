import 'package:flutter/material.dart';
import '../provider/connect.dart';
import '../productdetail.dart';
import 'package:share/share.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int cost;
  ProductItem(this.id, this.title, this.imageUrl, this.cost);

  @override
  Widget build(BuildContext context) {
    String link = image + imageUrl;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AvocadoPage(title)));
          },
          child: Image.network(
            link,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              Text(
                cost.toString() + " FRW",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.share,
            ),
            onPressed: () {
              Share.share(
                ' Product:' +
                    title +
                    ' Price: ' +
                    cost.toString() +
                    ' FRW from Download image on this link:' +
                    imageUrl,
                subject: "Product Details",
              );
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}

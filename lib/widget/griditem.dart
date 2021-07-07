import 'package:flutter/material.dart';
import '../provider/connect.dart';
import '../productview.dart';
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailScreen('name', 0)));
          },
          child: Image.network(
            link,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              Icons.favorite_border,
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
          title: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              Text(
                cost.toString() + "FRW",
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
                title,
                subject: image + imageUrl,
              );
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}

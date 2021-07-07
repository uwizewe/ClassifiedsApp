import 'package:flutter/material.dart';
import '../provider/connect.dart';
import '../imageupload.dart';

// ignore: must_be_immutable
class ProductItem extends StatefulWidget {
  int id;
  String name;
  int price;
  String imange;
  String info;
  String exdate;

  ProductItem(
      this.id, this.name, this.price, this.imange, this.info, this.exdate);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    String link = image + widget.imange;
    return Container(
      child: Card(
        child: ListTile(
          leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(link),
            ),
          ),
          title: (Text(widget.name)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.price.toString() + ' ' + "FRW"),
              Text(widget.info),
              Text('EXP Date: ' + widget.exdate),
            ],
          ),
        ),
      ),
    );
  }
}

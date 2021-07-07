import 'package:flutter/material.dart';
import '../customer.dart';
import '../product.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.blue.shade900,
            title: Text('Classifieds App'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Admin Page '),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserProductsScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Customer Page'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductsGrid()));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

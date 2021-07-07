import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
import './widget/griditem.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product View"),
      ),
      body: Container(
        child: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: products.length,
          itemBuilder: (ctx, i) => ProductItem(
            products[i].name,
            products[i].name,
            products[i].images,
            products[i].price,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}

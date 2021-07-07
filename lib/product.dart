import 'package:flutter/material.dart';
import '../widget/productitem.dart';
import 'package:provider/provider.dart';
import './provider/products.dart';
import '/widget/app_drawer.dart';
import './prodactadd.dart';

class UserProductsScreen extends StatefulWidget {
  @override
  _UserProductsScreenState createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>((context), listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Product Manager'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => _refreshProducts(context),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: productsData.items.length,
                  itemBuilder: (_, i) => Column(
                    children: [
                      ProductItem(
                        productsData.items[i].id,
                        productsData.items[i].name,
                        productsData.items[i].price,
                        productsData.items[i].images,
                        productsData.items[i].info,
                        productsData.items[i].exdate,
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue.shade900,
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ProductAdd()));
          },
          label: Text("Add Product")),
    );
  }
}

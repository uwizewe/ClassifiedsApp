import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'connect.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.info,
    required this.exdate,
    required this.categorys,
  });

  int id;
  String name;
  int price;
  String images;
  String info;
  String exdate;
  String categorys;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        images: json["images"],
        info: json["info"],
        exdate: json["exdate"],
        categorys: json["categorys"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "images": images,
        "info": info,
        "exdate": exdate,
        "categorys": categorys,
      };
}

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String name) {
    return _items.firstWhere((prod) => prod.name == name);
  }

  Future<void> fetchAndSetProducts() async {
    final url = con + 'fetch';
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);

      final extractedData = productFromJson(response.body);
      print(response.body);
      // ignore: unnecessary_null_comparison
      if (extractedData == null) {
        return;
      }

      _items = extractedData;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> addProduct(String name, int price, String info, String exdate,
      String categorys) async {
    try {
      String url = con +
          'addproduct?name=' +
          name +
          '&price=' +
          price.toString() +
          '&info=' +
          info +
          '&exdate=' +
          exdate.toString() +
          '&categorys=' +
          categorys;

      final response = await http.post(
        Uri.parse(url),
      );

      print(response.body);

      var _editedProduct = Product(
        id: 0,
        name: name,
        price: price,
        images: 'image.jpg',
        info: info,
        exdate: exdate,
        categorys: categorys,
      );

      _items.add(_editedProduct);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}

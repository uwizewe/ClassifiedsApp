import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './login.dart';
import './provider/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Classifieds App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginElevenPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:store_app/Views/HomePage.dart';
import 'package:store_app/Views/add_product.dart';
import 'package:store_app/Views/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Homepage.id: (context) => Homepage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
        AddProduct.id: (context) => AddProduct(),
      },
      initialRoute: Homepage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}

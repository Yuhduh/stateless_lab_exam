import 'package:flutter/material.dart';

import 'masayon_shopping_cart_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Campus Store',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF185DF5)),
      scaffoldBackgroundColor: const Color(0xFFF4F5FA),
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: const Color(0xFF10183D),
        displayColor: const Color(0xFF10183D),
      ),
    ),
    home: const ShoppingCartPage(),
  );
}

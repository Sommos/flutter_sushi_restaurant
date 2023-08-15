import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "models/shop.dart";
import "models/filter_menu.dart";
import "pages/intro_page.dart";
import "pages/menu_page.dart";
import "pages/cart_page.dart";

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Shop>(create: (context) => Shop()),
        ChangeNotifierProvider<FilterMenu>(create: (context) => FilterMenu()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/cartpage': (context) => const CartPage(),
      }
    );
  }
}
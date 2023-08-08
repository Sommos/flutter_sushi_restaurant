import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../components/food_tile.dart";
import "../components/button.dart";
import "../theme/colors.dart";
import "../models/food.dart";
import "food_details_page.dart";

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List foodMenu = [
    // nigiri
    Food(
      name: 'Salmon Nigiri',
      price: '£7.99',
      imagePath: 'lib/images/nigiri.png',
      rating: "4.79"
    ),
    // onigiri
    Food(
      name: 'Salmon Onigiri',
      price: '£3.99',
      imagePath: 'lib/images/onigiri.png',
      rating: "4.86"
    ),
    // takoyaki
    Food(
      name: 'Takoyaki',
      price: '£4.49',
      imagePath: 'lib/images/takoyaki.png',
      rating: "4.62"
    ),
    // tobiko
    Food(
      name: 'Salmon Tobiko',
      price: '£5.29',
      imagePath: 'lib/images/tobiko.png',
      rating: "4.10"
    ),
  ];

  List _filteredFoods = [];

  void navigateToFoodDetails(int index) {
    Navigator.push(context,MaterialPageRoute(
      builder: (context) => FoodDetailsPage(food: foodMenu[index]),
    ),);
  }

  @override
  void initState() {
    super.initState();
    _filteredFoods = foodMenu;
  }

  void _filterFoods(String query) {
    setState(() {
      _filteredFoods = foodMenu
          .where((food) =>
              food.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.grey[900],
            ),
            const SizedBox(width: 2.0),
            Text(
              'Tokyo',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20.0,
                color: Colors.grey[900],
              ),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.grey[900],
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            padding: const EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // message
                    Text(
                      'Get 50% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    // redeem button
                    MyButton(
                      text: "Redeem",
                      onTap: () {},
                    ),
                  ],
                ),
                // image
                Image.asset(
                  'lib/images/takoyaki.png',
                  height: 100.0,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25.0),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: _filterFoods,
            ),
          ),

          const SizedBox(height: 25.0),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18.0,
              ),
            ),
          ),

          const SizedBox(height: 10.0),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _filteredFoods.length,
              itemBuilder: (context, index) => FoodTile(
                food: _filteredFoods[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          const SizedBox(height: 25.0),

          // popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'lib/images/tobiko.png',
                      height: 60.0,
                    ),

                    const SizedBox(width: 20.0),

                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          'Salmon Tobiko',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18.0,
                            color: Colors.grey[800],
                          ),
                        ),

                        const SizedBox(height: 10.0),

                        // price
                        Text(
                          foodMenu[3].price,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // heart
                const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.grey,
                  size: 28.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

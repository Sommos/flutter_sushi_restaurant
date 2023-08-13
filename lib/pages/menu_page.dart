import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";

import "../components/food_tile.dart";
import "../components/button.dart";
import "../models/shop.dart";
import "../theme/colors.dart";
import "food_details_page.dart";

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(context,MaterialPageRoute(
      builder: (context) => FoodDetailsPage(food: foodMenu[index]),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0.0,
        leading: const Icon(Icons.menu),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on_outlined),
            const SizedBox(width: 2.0),
            Text(
              'Tokyo',
              style: GoogleFonts.dmSerifDisplay(fontSize: 20.0),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
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
                  'lib/images/tomago_sushi.png',
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
                hintText: 'Search here',
                prefixIcon: const Icon(Icons.search),
              ),
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
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          const SizedBox(height: 25.0),

          // Popular Food section
          Padding(
            padding: const EdgeInsets.only(right: 25.0, left: 25.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Popular Food",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18.0,
                ),
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
                      'lib/images/salmon_tobiko.png',
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
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // star rating
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: primaryColor,
                    ),
                    Text(
                      foodMenu[3].rating,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                // heart
                IconButton(
                  onPressed: () {
                    // handle favorite action
                  },
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.grey,
                    size: 28.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
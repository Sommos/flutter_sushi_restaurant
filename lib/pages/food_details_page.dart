import "package:flutter/material.dart";
import "package:flutter_sushi_restaurant/components/button.dart";
import "package:google_fonts/google_fonts.dart";

import "../models/food.dart";
import "../theme/colors.dart";

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      quantityCount--;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200.0,
                  ),

                  const SizedBox(height: 25.0),

                  // rating
                  Row(
                    children: [
                      // star icon
                      Icon(
                        Icons.star,
                        color: primaryColor,
                      ),

                      const SizedBox(width: 10.0),

                      // rating
                      Text(
                        widget.food.rating,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10.0),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28.0),
                  ),

                  const SizedBox(height: 25.0),

                  // description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  Text(
                    "Golden pearls of tobiko, resembling tiny treasures from the sea, glisten atop a canvas of meticulously crafted sushi rice. Each delicate orb bursts with a burst of briny flavor, harmonizing with the rice's subtle seasoning to create a symphony of taste sensations. A culinary masterpiece that marries the ocean's bounty with the artistry of sushi craftsmanship, each bite of tobiko sushi is a journey into the depths of culinary excellence.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14.0,
                      height: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.food.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    // quantity
                    Row(
                      children: [
                        // minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        // quantity count
                        SizedBox(
                          width: 40.0,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),

                        // plus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),
                // add to cart
                MyButton(text: "Add To Cart", onTap: addToCart)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
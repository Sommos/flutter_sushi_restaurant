import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../theme/colors.dart";
import "../models/food.dart";

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: const EdgeInsets.only(left: 25.0),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(
              food.imagePath,
              height: 140.0,
            ),

            // text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 20.0),
            ),

            SizedBox(
              width: 160.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // price
                  Text(
                    food.price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),

                  Row(
                    children: [
                      // rating
                      Icon(
                        Icons.star,
                        color: primaryColor,
                      ),
                      Text(
                        food.rating,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
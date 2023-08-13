import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';
import '../components/button.dart';
import '../models/food.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  Map<Food, int> getUniqueItemsWithQuantity(List<Food> cart) {
    final uniqueItems = cart.toSet().toList();
    final uniqueItemsWithQuantity = <Food, int>{};

    for (final item in uniqueItems) {
      final count = cart.where((food) => food == item).length;
      uniqueItemsWithQuantity[item] = count;
    }

    return uniqueItemsWithQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text("My Cart"),
          elevation: 0.0,
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Food food = value.cart[index];
                  final String foodName = food.name;
                  final String foodPrice = food.price;
                  final String foodImagePath = food.imagePath;
                  final int itemCount = value.cart.where((f) => f.name == foodName).length;

                  return Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                    child: ListTile(
                      leading: Image.asset(
                        foodImagePath,
                        width: 60.0,
                        height: 60.0,
                      ),
                      title: Row(
                        children: [
                          Text(
                            foodName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          if(itemCount > 1)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'x$itemCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                        ],
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                        onPressed: () => removeFromCart(food, context),
                      ),
                    ),
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Pay Now",
                onTap: () {
                  // TODO: implement pay now function
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
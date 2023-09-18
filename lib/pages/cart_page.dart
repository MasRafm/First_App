import 'package:first_app/components/button.dart';
import 'package:first_app/models/food.dart';
import 'package:first_app/models/shop.dart';
import 'package:first_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({supertkey});

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              title: Text("Keranjang"),
              elevation: 0,
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

                        return Container(
                          decoration: BoxDecoration(color: secondaryColor),
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: ListTile(
                            title: Text(
                              foodName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              foodPrice,
                              style: const TextStyle(color: Colors.grey),
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
                      }),
                ),
                MyButton(
                  text: "Bayar",
                  onTap: () {},
                )
              ],
            )));
  }
}

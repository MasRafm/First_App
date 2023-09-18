import 'package:first_app/components/button.dart';
import 'package:first_app/components/food_tile.dart';
import 'package:first_app/models/shop.dart';
import 'package:first_app/pages/food_detail_page.dart';
import 'package:first_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<StatefulWidget> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetailPage(
                  food: foodMenu[index],
                )));
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
        elevation: 0,
        title: Text(
          'Sushi',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dapatkan 10% Promo',
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                    text: "Reedem",
                    onTap: () {},
                  ),
                ],
              ),
              Image.asset(
                'lib/images/sushi.png',
                height: 100,
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                hintText: "Cari disini..."),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Menu Sushi",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
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
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'lib/images/1.png',
                    height: 60,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Salmon Eggs",
                        style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Rp.25.000",
                        style: TextStyle(color: Colors.grey[700]),
                      )
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.favorite_outline,
                color: Colors.grey,
                size: 28,
              )
            ],
          ),
        )
      ]),
    );
  }
}

import 'package:first_app/components/button.dart';
import 'package:first_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/shop.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantityCount = 0;
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();

      shop.addToCart(widget.food, quantityCount);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: Text(
            "Berhasil ditambahkan",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Deskripsi",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Terbuat dari telur salmon segar dari ikan yang baru ditangkap dari kapal dan langsung didistribusikan kerestoran. Apa itu Sushi? Sushi merujuk pada hidangan khas Jepang yang terdiri atas dua bagian, yaitu nasi (shari) dan makanan yang diletakkan di atas nasi tersebut (neta). Nasi yang digunakan untuk shari pada umumnya menggunakan nasi Jepang yang dicampurkan dengan gula, dan cuka, sehingga terasa sedikit manis dan asam.",
                  style: TextStyle(color: Colors.grey[600], height: 2),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: primaryColor,
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\Rp.${widget.food.price}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryColor, shape: BoxShape.circle),
                      child: IconButton(
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: decrementQuantity,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          quantityCount.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryColor, shape: BoxShape.circle),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: incrementQuantity,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(text: "Tambah Pesanan", onTap: addToCart)
          ]),
        )
      ]),
    );
  }
}

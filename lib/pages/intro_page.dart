import 'package:first_app/components/button.dart';
import 'package:first_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 25),
              Text(
                "DELICOUS SUSHI",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset('lib/images/6.png'),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "THE TASTE OF JAPANESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Sushi, sajian kuliner Jepang yang memukau, menggoda lidah dengan harmoni sempurna antara nasi yang dimasak dengan cuka beras dan berbagai bahan segar yang terdiri dari ikan, daging, sayuran, atau telur.',
                style: TextStyle(color: Colors.grey[300], height: 2),
              ),
              const SizedBox(height: 25),
              MyButton(
                  text: "Mulai",
                  onTap: () {
                    Navigator.pushNamed(context, '/menupage');
                  })
            ]),
      ),
    );
  }
}

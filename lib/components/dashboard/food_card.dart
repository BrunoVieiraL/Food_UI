import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../views/food_page.dart';
import 'food_tabs.dart';

class FoodCard extends StatelessWidget {
  final String foodName;
  final Color backgroundColor;
  final String imagePath;
  final String price;
  final Color textColor;
  const FoodCard({
    Key? key,
    required this.foodName,
    required this.backgroundColor,
    required this.imagePath,
    required this.price,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return FoodPage(
                    heroTag: foodName,
                    imagePath: imagePath,
                    foodname: foodName,
                    priceItem: price);
              },
            ),
          );
        },
        child: Container(
          height: 175,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: foodName,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                foodName,
                style: GoogleFonts.notoSans(
                  fontSize: 17,
                  color: textColor,
                ),
              ),
              Text(
                'R\$' + price,
                style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowFoods extends StatelessWidget {
  const ShowFoods({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: const [
        FoodTab(),
        FoodTab(),
        FoodTab(),
        FoodTab(),
      ],
    );
  }
}

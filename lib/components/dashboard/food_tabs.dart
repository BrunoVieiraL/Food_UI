import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({Key? key}) : super(key: key);

  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        _buildListItem('Hot Dog', 4.0, '6', 'assets/hotdog.png'),
        _buildListItem('Pizza Mista', 5.0, '12', 'assets/pizza.png')
      ],
    ));
  }

  _buildListItem(String foodName, rating, String price, String imgPath) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
                width: 210.0,
                child: Row(children: [
                  Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: const Color(0xFFFFE3DF)),
                      child: Center(
                          child:
                              Image.asset(imgPath, height: 50.0, width: 50.0))),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(foodName,
                          style: GoogleFonts.notoSans(
                              fontSize: 14.0, fontWeight: FontWeight.w400)),
                      SmoothStarRating(
                          allowHalfRating: false,
                          onRatingChanged: (star) {
                            setState(() {
                              rating = star;
                            });
                          },
                          starCount: 5,
                          rating: rating,
                          color: const Color(0xFFFFD143),
                          borderColor: const Color(0xFFFFD143),
                          size: 15.0,
                          spacing: 0.0),
                      Row(
                        children: <Widget>[
                          Text(
                            '\$' + price,
                            style: GoogleFonts.lato(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                textStyle:
                                    const TextStyle(color: Color(0xFFF68D7F))),
                          ),
                          const SizedBox(width: 3.0),
                          Text(
                            '\$' '18',
                            style: GoogleFonts.lato(
                                fontSize: 12.0,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                                textStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.4))),
                          )
                        ],
                      )
                    ],
                  )
                ])),
            FloatingActionButton(
              heroTag: foodName,
              mini: true,
              onPressed: () {},
              child: const Center(child: Icon(Icons.add, color: Colors.white)),
              backgroundColor: const Color(0xFFFE7D6A),
            )
          ],
        ));
  }
}

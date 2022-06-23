import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodPage extends StatefulWidget {
  final String imagePath, foodname, priceItem, heroTag;
  const FoodPage({
    Key? key,
    required this.heroTag,
    required this.imagePath,
    required this.foodname,
    required this.priceItem,
  }) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  double netPrice = 0;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Stack(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.redAccent.shade100,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            blurRadius: 6,
                            spreadRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(Icons.shopping_cart),
                      ),
                    ),
                    Positioned(
                      top: 1,
                      right: 4,
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            '1',
                            style: GoogleFonts.notoSans(
                              fontSize: 7,
                              textStyle: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.foodname.toUpperCase(),
                style: GoogleFonts.notoSans(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xFFFE7D6A).withOpacity(0.1),
                                blurRadius: 6,
                                spreadRadius: 6,
                                offset: const Offset(5, 11)),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.pink,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xFFFE7D6A).withOpacity(0.1),
                                blurRadius: 6,
                                spreadRadius: 6,
                                offset: const Offset(5, 11)),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: const Center(
                          child: Icon(
                            Icons.restore,
                            color: Colors.pink,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                width: 125,
                color: Colors.white,
                child: Center(
                  child: Text(
                    '\$' + (int.parse(widget.priceItem) * quantity).toString(),
                    style: GoogleFonts.notoSans(
                        fontSize: 40,
                        color: const Color(0xFF5E6166),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 225,
                decoration: const BoxDecoration(
                  color: Color(0xFFFE7D6A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 105,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 17,
                            onPressed: () {
                              ajustarQuantidade('MINUS');
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xFFFE7D6A),
                            ),
                          ),
                          Text(
                            quantity.toString(),
                            style: GoogleFonts.notoSans(
                                fontSize: 14,
                                color: const Color(0xFFFE7D6A),
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                            iconSize: 17,
                            onPressed: () {
                              ajustarQuantidade('PLUS');
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xFFFE7D6A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Adicionar',
                      style: GoogleFonts.notoSans(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void ajustarQuantidade(String valor) {
    switch (valor) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}

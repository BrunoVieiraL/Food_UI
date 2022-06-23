import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/dashboard/food_card.dart';
import '../components/dashboard/padding_text.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6.0,
                        spreadRadius: 4.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: const Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage('assets/man.png'),
                        fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
          ),
          const PaddingText(texto: 'Buscar por'),
          const PaddingText(texto: 'receitas'),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              padding: const EdgeInsets.only(left: .5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  hintStyle: GoogleFonts.notoSans(fontSize: 14),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const FoodCard(
                    foodName: 'Hamburguer',
                    backgroundColor: Colors.amberAccent,
                    imagePath: 'assets/burger.png',
                    price: '25',
                    textColor: Colors.black),
                FoodCard(
                  foodName: 'Taco',
                  backgroundColor: Colors.green.shade300,
                  imagePath: 'assets/taco.png',
                  price: '20',
                  textColor: Colors.black,
                ),
                FoodCard(
                  foodName: 'Sanduíche',
                  backgroundColor: Colors.pink.shade100,
                  imagePath: 'assets/sandwich.png',
                  price: '10',
                  textColor: Colors.black,
                ),
                FoodCard(
                  foodName: 'Batata Frita',
                  backgroundColor: Colors.yellow.shade400,
                  imagePath: 'assets/fries.png',
                  price: '7',
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TabBar(
              tabs: const [
                Tab(
                  child: Text('Fast Food'),
                ),
                Tab(
                  child: Text('Sobremesas'),
                ),
                Tab(
                  child: Text('Outros'),
                ),
                Tab(
                  child: Text('Favoritos'),
                ),
              ],
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.notoSans(
                  fontSize: 16, fontWeight: FontWeight.w700),
              unselectedLabelStyle: GoogleFonts.notoSans(
                  fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 450,
            child: ShowFoods(tabController: tabController),
          )
        ],
      ),
    );
  }
}


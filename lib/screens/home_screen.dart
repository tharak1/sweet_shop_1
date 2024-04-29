import 'package:flutter/material.dart';
import 'package:sweet_shop/models/categories.dart';
import 'package:sweet_shop/models/sweet_model.dart';
import 'package:sweet_shop/screens/sweets_screen.dart';
import 'package:sweet_shop/widgets/coursel.dart';
import 'package:sweet_shop/widgets/homebutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Categories> totallist = [
      Categories(
        name: 'Traditional',
        imgurl: 'assets/traditional/cover_traditional.jpg',
        categorysweets: [
          Sweet(
            id: '1',
            imgurl: 'assets/traditional/ariselu.jpeg',
            name: 'Ariselu',
            price: 150,
            avalibility: true,
          ),
          Sweet(
            id: '2',
            imgurl: 'assets/traditional/Boondi-Laddu-1.jpg',
            name: 'Boondi Laddu',
            price: 200,
            avalibility: true,
          ),
          Sweet(
            id: '3',
            imgurl: 'assets/traditional/jelebi.jpg',
            name: 'jelebi',
            price: 150,
            avalibility: true,
          ),
          Sweet(
            id: '4',
            imgurl: 'assets/traditional/kajjikaya.jpeg',
            name: 'Kajjikaya',
            price: 100,
            avalibility: true,
          ),
        ],
      ),
      Categories(
        name: 'Milk Sweets',
        imgurl: 'assets/milk_sweets/cover_milk.webp',
        categorysweets: [
          Sweet(
            id: '11',
            imgurl: 'assets/milk_sweets/doodhapeda.jpeg',
            name: 'doodhapeda',
            price: 180,
            avalibility: true,
          ),
          Sweet(
            id: '12',
            imgurl: 'assets/milk_sweets/kalakand.jpeg',
            name: 'kalakand',
            price: 300,
            avalibility: true,
          ),
          Sweet(
            id: '13',
            imgurl: 'assets/milk_sweets/kova.jpeg',
            name: 'kova',
            price: 80,
            avalibility: true,
          ),
        ],
      ),
      Categories(
        name: 'Dry Fruits',
        imgurl: 'assets/dryfruit/cover_dryfruit.jpg',
        categorysweets: [
          Sweet(
            id: '11',
            imgurl: 'assets/dryfruit/halwa.webp',
            name: 'halwa',
            price: 180,
            avalibility: true,
          ),
          Sweet(
            id: '12',
            imgurl: 'assets/dryfruit/kajuburfi.jpg',
            name: 'kajuburfi',
            price: 300,
            avalibility: true,
          ),
          Sweet(
            id: '13',
            imgurl: 'assets/dryfruit/laddu.jpeg',
            name: 'laddu',
            price: 80,
            avalibility: true,
          ),
        ],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        toolbarHeight: MediaQuery.of(context).size.height / 9,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Hi,user", style: TextStyle(fontSize: 25)),
                  Text("welcome", style: TextStyle(fontSize: 20)),
                ],
              ),
            ],
          ),
        ),
        leadingWidth: double.infinity,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: Column(
          children: [
            Text(
              'Today\'s Special',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            ComplicatedImageDemo(),
            Text(
              'Categories',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 3 / 2.5,
                ),
                itemCount: totallist.length,
                itemBuilder: (context, index) => HomeButton(
                  assetspath: totallist[index].imgurl,
                  imgName: totallist[index].name,
                  functionpg: SweetsScreen(
                    sweetslist: totallist[index].categorysweets,
                    categoryname: totallist[index].name,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

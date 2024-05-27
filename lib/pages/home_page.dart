import 'package:app_delivery/components/my_description_box.dart';
import 'package:app_delivery/components/my_drawer.dart';
import 'package:app_delivery/components/my_sliver_app_bar.dart';
import 'package:app_delivery/components/my_tab_bar.dart';
import 'package:app_delivery/models/food.dart';
import 'package:app_delivery/models/restaurant.dart';
import 'package:app_delivery/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_current_location.dart';
import '../components/my_food_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  // tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length:FoodCategory.values.length, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //Sort out and return the list of food items based on the selected category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  //retunr list of food items based on the selected category
  List<Widget> _getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return GridView.builder(
        itemCount: categoryMenu.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de columnas
          crossAxisSpacing: 0, // Espaciado horizontal entre las columnas
          mainAxisSpacing: 8.0, // Espaciado vertical entre las filas
          childAspectRatio: 0.75, // Ajusta la proporción según tus necesidades
        ),
        physics: NeverScrollableScrollPhysics(), // Si no quieres que se desplace
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food item
          final food = categoryMenu[index];
          return Padding(
            padding: const EdgeInsets.only(top:20.0, left: 10, right: 10),
            child: FoodTile(
              food: food,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food)),
              ),
            ),
          );
        },
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>[
          MySliverAppBar(
            title: MyTabBar(
              tabController: _tabController,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  indent: 20,
                  endIndent: 20,
                ),
                //my current location
                MyCurrentLocation(),
                //description box
                MyDescriptionBox(),
              ]
            ),
          )
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child){
            return TabBarView(
              controller: _tabController,
              children: _getFoodInThisCategory(restaurant.menu),
            );
          },
        )
      ),
    );
  }
}

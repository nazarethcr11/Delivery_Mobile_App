import 'package:app_delivery/components/my_button.dart';
import 'package:app_delivery/models/food.dart';
import 'package:app_delivery/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }){
    //initialize selected addons to false
    for (Addon addon in food.availableAddons){
      selectedAddons[addon] = false;
    }
    }
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add food to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons){
    //close the current food page to go back to menu page
    Navigator.pop(context);
    //get currently selected addons
    List<Addon> currentlySelectAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SingleChildScrollView(
            child: Column(
              children:[
                //food image
                Image.asset(widget.food.imagePath,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(widget.food.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),),
                      const SizedBox(height: 4,),
                      //food price
                      Text('\$${widget.food.price.toString()}', style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                      const SizedBox(height: 4,),
                      //food description
                      Text(widget.food.description,style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                      const SizedBox(height: 4,),
                      Divider(color: Theme.of(context).colorScheme.secondary, thickness: 2,),
                      //text addons
                      const SizedBox(height: 2,),
                      Text('Addons', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary),),
                      //food addons list
                      const SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 2,),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          itemCount: widget.food.availableAddons.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index){
                            //get individual addon
                            Addon addon = widget.food.availableAddons[index];
                            //return addon checkbox
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text('\$${addon.price.toString()}'),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //add to cart button
                MyButton(
                  onTap: ()=> addToCart(widget.food, widget.selectedAddons),
                  text: "Add to Cart",),
                SizedBox(height: 20,)
              ]
            ),
          ),
        ),
        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
                  margin: EdgeInsets.only(left: 20,),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
            ),
          ),
        ),
      ],
      ),
    );
  }
}


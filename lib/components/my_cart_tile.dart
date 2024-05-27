import 'package:app_delivery/components/my_quantity_selector.dart';
import 'package:app_delivery/models/cart_item.dart';
import 'package:app_delivery/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({
    super.key,
    required this.cartItem,
});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder:(context, restaurant, child)=> Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.surface,
            offset: const Offset(4, 8),
            blurRadius: 4,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children:[
          Padding(
            padding: const EdgeInsets.only(top:8.0, left: 18.0, right: 18.0, bottom: 4.0),
            child: Row(
              children: [
                //food image
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                ),
                const SizedBox(width: 14,),
                //food name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //food name
                    Text(cartItem.food.name, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary),),
                    const SizedBox(height: 10,),
                    //increase or decrease quantity buttons
                    MyQuantitySelector(
                      quantity: cartItem.quantity,
                      food: cartItem.food,
                      onDecrement: (){
                        restaurant.removeFromCart(cartItem);
                      },
                      onIncrement: (){
                        restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                      },
                    ),
                  ],
                ),
                const Spacer(),
                Text('\$'+cartItem.food.price.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary),),
              ],
            ),
          ),
          //addons
          SizedBox(
            height: cartItem.selectedAddons.isEmpty? 0 : 50,
            child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                children: cartItem.selectedAddons.map((addon)=> Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: FilterChip(
                      label: Row(
                        children: [
                          //addon name
                          Text(addon.name),
                          //addon price
                          Text(' (+\$${addon.price})', ),
                        ],
                      ),
                      onSelected: (value){},
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                      ),
                    //border color
                  ),
                )).toList(),
            ),
          )
        ]
      ),
    ));
  }
}

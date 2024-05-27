import 'package:app_delivery/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyReceipt extends StatelessWidget {
  const MyReceipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Thank you for your order!', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              child: Consumer<Restaurant>(
                builder: (context, restaurant,child)=>
                    Text(restaurant.displayCartRecipe(), style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
              ),
            ),
            const SizedBox(height: 20),
            Text("Estimated delivery time is: 4:11 pm", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
          ],
        ),
      ),
    );
  }
}

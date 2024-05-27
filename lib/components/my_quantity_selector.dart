import 'package:app_delivery/models/food.dart';
import 'package:flutter/material.dart';

class MyQuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const MyQuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onDecrement,
    required this.onIncrement,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //decrement button
            GestureDetector(
              onTap: onDecrement,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.surface,
                      offset: Offset(1, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.remove,
                  size: 17,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            //quantity count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 14,
                child: Center(
                  child: Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
            ),
            //increment button
            GestureDetector(
              onTap: onIncrement,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.surface,
                      offset: Offset(1, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  size: 17,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ],
        ),
    );
  }
}

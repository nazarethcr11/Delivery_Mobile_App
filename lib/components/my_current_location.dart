import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({Key? key}) : super(key: key);

  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text('Your Location'),
      content: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: 'Enter your address',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            textController.clear();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            //update the address
            String newAddress = textController.text;
            context.read<Restaurant>().setDeliveryAddress(newAddress);
            Navigator.of(context).pop();
            textController.clear();
          },
          child: Text('Save'),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text('Deliver Now',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        ),
        GestureDetector(
          onTap: () => openLocationSearchBox(context),
          child: Row(
            children: [
              //address
              Icon(
                Icons.location_on,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              Consumer<Restaurant>(
                  builder: (context, restaurant,child)=>Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
              //drop down menu
              Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}

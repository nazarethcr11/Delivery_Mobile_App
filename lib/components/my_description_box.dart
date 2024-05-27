import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //textstyle
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 20, right:20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
                Column(
                  children: [
                    Text('\$5.00', style: myPrimaryTextStyle,),
                    Text('Delivery Fee', style: mySecondaryTextStyle,),
                  ],
                ),
                //delivery time
                Column(
                  children: [
                    Text('30-40 min', style: myPrimaryTextStyle,),
                    Text('Delivery Time', style: mySecondaryTextStyle,),
                  ],
                ),
              ],
            ),
          );
  }
}

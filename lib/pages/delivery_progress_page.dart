import 'package:app_delivery/components/my_receipt.dart';
import 'package:app_delivery/pages/home_page.dart';
import 'package:app_delivery/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({Key? key}) : super(key: key);

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  //get access to the database
  FirestoreService db= FirestoreService();

  @override
  void initState() {
    super.initState();

    //if we get to this page, submit order to db
    String receipt= context.read<Restaurant>().displayCartRecipe();
    db.saveOrder(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        /*leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
            //clear cart
            context.read<Restaurant>().clearCart();
          },
        ),
         */
        title: const Text('Delivery in Progress'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: Column(
        children:[
          MyReceipt(),
        ]
      )
    );
  }

  // Costume Bottom Navigation Bar - Message/Call Delivery driver
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //profile pic of delivery driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: (){},
            ),
          ),
          const SizedBox(width: 10,),
          //driver details
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).colorScheme.inversePrimary),),
              Text('Driver', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              //message button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: (){},
                ),
              ),
              const SizedBox(width: 1,),
              //call button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                  onPressed: (){},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

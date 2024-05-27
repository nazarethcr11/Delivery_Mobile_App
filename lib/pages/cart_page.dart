import 'package:app_delivery/components/my_button.dart';
import 'package:app_delivery/components/my_cart_tile.dart';
import 'package:app_delivery/models/restaurant.dart';
import 'package:app_delivery/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child){
      //cart
      final userCart = restaurant.cart;
      //scaffold ui
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                showDialog(context: context,
                    builder: (context)=>AlertDialog(
                      title: const Text('Are you sure to clear Cart?'),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: Text('Clear'),
                        ),
                      ],
                    ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            //list of cart items
            Expanded(
              child: Column(
                children:[
                  userCart.isEmpty
                  ? const Expanded(
                      child: Center(
                          child: Text("Cart is Empty ..."),
                      ),
                  )
                  :Expanded(
                      child: ListView.builder(itemBuilder: (context, index){
                        //get indivual cart item
                        final cartItem = userCart[index];
                        //return cart tile ui
                        return MyCartTile(cartItem: cartItem);
                        },
                        itemCount: userCart.length,
                      ),
                  ),
                ]
              ),
            ),
            //button to pay
            MyButton(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentPage())),
                text: "Go to checkout (\$${restaurant.totalPrice.toStringAsFixed(2)})",
            ),
            SizedBox(height: 20,),
          ],
        ),
      );
    });
  }
}

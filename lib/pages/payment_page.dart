import 'package:app_delivery/components/my_button.dart';
import 'package:app_delivery/pages/delivery_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //user wants to pay
  void userTapped() {
    if (formKey.currentState!.validate()) {
      //payment logic
      showDialog(
          context: context,
          builder: (context)=> AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Text('Confirm Payment', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary), ),
            content: SingleChildScrollView(
              child: ListBody(
                children:[
                  Text('Card Number: $cardNumber', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  Text('Expiry Date: $expiryDate', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  Text('Card Holder Name: $cardHolderName', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  Text('CVV Code: $cvvCode', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                ],
              )
            ),
            actions: [
              //cancel button
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Cancel', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
              ),
              //ok button
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const DeliveryProgressPage()
                      )
                  );
                },
                child: Text('Yes', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
              ),
            ],
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              // credit card
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (p0) {},
              ),
              // credit card form
            //text in white
              CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                    isCvvFocused = data.isCvvFocused;
                  });
                },
                formKey: formKey,
              ),
              const SizedBox(height: 20),
              // checkout button
              MyButton(
                onTap: userTapped,
                text: "Pay now",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
  }
}

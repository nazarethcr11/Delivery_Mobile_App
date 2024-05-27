import 'package:app_delivery/components/my_button.dart';
import 'package:app_delivery/components/my_textfield.dart';
import 'package:app_delivery/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap}) ;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login function
  void login() async{
   //get the instance of auth service
    final _authService = AuthService();
    //try to login
    try{
      await _authService.signInWithEmailAndPassword(emailController.text, passwordController.text,);
    }
    catch(e){
      //show error message
      showDialog(
          context: context,
          builder: (context)=> AlertDialog(
            title: Text(e.toString()),
          )
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.delivery_dining,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 20),
            //message, app slogan
            Text(
              'Food Delivery App',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            //email textfield
            MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false
            ),
            const SizedBox(height: 10),
            //password textfield
            MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true
            ),
            const SizedBox(height: 10),
            //sing in button
            MyButton(
                onTap: login,
                text: 'Sign In'
            ),
            const SizedBox(height: 20),
            // Not a member? Register Now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}

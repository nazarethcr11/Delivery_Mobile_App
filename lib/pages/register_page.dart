import 'package:app_delivery/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap}) ;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  //register method
  void register() async{
    //get the auth service
    final _authService = AuthService();

    //check if the password and confirm password match
    if(passwordController.text == confirmPasswordController.text){
      //register the user
      try {
        await _authService.registerWithEmailAndPassword(
            emailController.text, passwordController.text);
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
    else{
      //show error message
      showDialog(
          context: context,
          builder: (context)=> const AlertDialog(
            title: Text('Passwords do not match'),
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
                "Lets's create an account",
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
              //confirm password textfield
              MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true
              ),
              const SizedBox(height: 10),
              //sing up button
              MyButton(
                  onTap: () {
                    register();
                  },
                  text: 'Sign Up'
              ),
              const SizedBox(height: 20),
              // Already a member? Login here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login here',
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

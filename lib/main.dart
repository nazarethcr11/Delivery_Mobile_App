import 'package:app_delivery/firebase_options.dart';
import 'package:app_delivery/services/auth/auth_gate.dart';
import 'package:app_delivery/services/auth/login_or_register.dart';
import 'package:app_delivery/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/restaurant.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(providers: [
      //theme provider
      ChangeNotifierProvider(create: (context)=>ThemeProvider()),
      //restaurant provider
      ChangeNotifierProvider(create: (context)=>Restaurant()),
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

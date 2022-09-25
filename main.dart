 import 'package:flutter/material.dart';
import 'package:login/categories_provider.dart';
import 'package:login/home_provider.dart';
import 'package:login/login_provider.dart';
import 'package:login/register.dart';
import 'package:provider/provider.dart';



import 'login.dart';
// ignore_for_file: prefer_const_constructors
void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
  return MultiProvider(
    providers: [
     ChangeNotifierProvider(create: (context) =>  HomeProvider(),),
     ChangeNotifierProvider(create: (context) =>  CategoryProvider(),),
     ChangeNotifierProvider(create: (context) =>  LoginProvider(),),

    ]
  , child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
   )
    
    );
  }
}

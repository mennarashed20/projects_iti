
import 'package:flutter/material.dart';
import 'package:projects_iti/dummy_projects/ecommerce/ecommerce_prodact.dart';
//import 'package:projects_iti/dummy_projects/login_screen/login_screen.dart';
//import 'package:projects_iti/dummy_projects/login_task/loginscreen_task.dart';
//import 'package:projects_iti/dummy_projects/messengeer/widgets/messenger_screen.dart';
//import 'dummy_projects/whatsapp/whatsapp.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {


    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ECommerceProdact(),
    );
  }
}
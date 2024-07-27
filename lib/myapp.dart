
import 'package:flutter/material.dart';
//import 'package:projects_iti/dummy_projects/login_page/login_screen.dart';

//import 'package:projects_iti/dummy_projects/messengeer/widgets/messenger_screen.dart';

import 'dummy_projects/login_page/widgets_model/login_screen.dart';



//import 'dummy_projects/whatsapp/whatsapp.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {


    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginScreen(),
    );
  }
}
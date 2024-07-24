import 'package:flutter/material.dart';

import 'dummy_projects/whatsapp/whatsapp.dart';





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {


    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Whatsapp(),
    );
  }
}

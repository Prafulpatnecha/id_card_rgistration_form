import 'package:flutter/material.dart';
import 'package:id_card_rgistration_form/controller/routes.dart';

class IdCardApp extends StatelessWidget {
  const IdCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}

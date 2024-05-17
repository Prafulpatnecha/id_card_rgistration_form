import 'package:flutter/material.dart';
import 'package:id_card_rgistration_form/home/cardshow/cardview.dart';
import '../home/homefile/homescreen.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes={
    '/':(context)=>const HomePage(),
    '/view':(context)=>const CardView(),
  };
}
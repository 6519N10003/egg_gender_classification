// ignore_for_file: prefer_const_constructors, camel_case_types, depend_on_referenced_packages

import 'package:egg_gender_classifide/views/egg_splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(egg_gender_classifide());
}

class egg_gender_classifide extends StatefulWidget {
  const egg_gender_classifide({super.key});

  @override
  State<egg_gender_classifide> createState() => _egg_gender_classifideState();
}

class _egg_gender_classifideState extends State<egg_gender_classifide> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:EggSplash (),
    );
  }}
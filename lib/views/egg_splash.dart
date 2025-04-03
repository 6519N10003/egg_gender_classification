// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, depend_on_referenced_packages

import 'package:egg_gender_classifide/views/egg_home.dart';
import 'package:flutter/material.dart';

class EggSplash extends StatefulWidget {
  const EggSplash({super.key});

  @override
  State<EggSplash> createState() => _EggSplashState();
}

class _EggSplashState extends State<EggSplash> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => EggHome_ui()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color.fromARGB(255, 255, 207, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/logo1.png',
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
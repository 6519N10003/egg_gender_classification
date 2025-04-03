// ignore_for_file: depend_on_referenced_packages, prefer_const_literals_to_create_immutables, prefer_const_constructors, override_on_non_overriding_member

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:egg_gender_classifide/views/egg_about.dart';
import 'package:egg_gender_classifide/views/egg_advancesearch.dart';
import 'package:egg_gender_classifide/views/egg_dashboard.dart';

class EggHome_ui extends StatefulWidget {
  const EggHome_ui({super.key});

  @override
  State<EggHome_ui> createState() => _EggHome_uiState();
}

class _EggHome_uiState extends State<EggHome_ui> {
  final PageController _pageController = PageController();
  final List<String> imgList = [
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_pageController.page == imgList.length - 1) {
        _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        backgroundColor: Colors.yellow,
        toolbarHeight: 80,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_egg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/machine.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Egg Gender Classification Machine Mk.1",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.white,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EggHome_ui()));
              },
            ),
            ListTile(
              leading: Icon(Icons.timeline),
              title: Text("Dashboard"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EggDashboard_ui()));
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Advanced Search"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EggAdvancesearch_ui()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EggAbout_ui()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.yellow.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imgList[index],
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            SmoothPageIndicator(
              controller: _pageController,
              count: imgList.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.black,
                dotColor: Colors.grey,
              ),
            ),
            SizedBox(height: 100),

            ElevatedButton(
                onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EggDashboard_ui()),
                 );
               },
               style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                ),
               
               child: Text("ดูผลลัพธิ์", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.redAccent)),
            ),

            SizedBox(height: 100),
            Text("Egg Gender Classification Machine", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Text("Create by SAU Powered by AI", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

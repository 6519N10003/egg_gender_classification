// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:egg_gender_classifide/views/egg_about.dart';
import 'package:egg_gender_classifide/views/egg_dashboard.dart';
import 'package:egg_gender_classifide/views/egg_home.dart';
import 'package:flutter/material.dart';

class EggAdvancesearch_ui extends StatefulWidget {
  const EggAdvancesearch_ui({super.key});

  @override
  State<EggAdvancesearch_ui> createState() => _EggAdvancesearch_uiState();
}

class _EggAdvancesearch_uiState extends State<EggAdvancesearch_ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: Text('Advance Search'),
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
                  color: Colors.black, // สีข้อความ
                  shadows: [
                  Shadow(
                    blurRadius: 6, // ขนาดเบลอ
                    color: Colors.white, // สีขอบ
                    offset: Offset(0, 0), // การเลื่อนขอบ (สามารถปรับให้ดูดีขึ้น)
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
            Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EggHome_ui()));
          },
        ),
        ListTile(
          leading: Icon(Icons.timeline),
          title: Text("Dashboard"),
          onTap: () {
           Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EggDashboard_ui()));
          },
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text("Advanced Search"),
          onTap: () {
            Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EggAdvancesearch_ui()));
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("about"),
          onTap: () {
            Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EggAbout_ui()));
          },
        ),
      ],
    ),
  ),
   body: Container(
        color: Colors.yellow.shade100,
        ),
    );
  }
}
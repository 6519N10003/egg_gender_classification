// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:egg_gender_classifide/views/egg_advancesearch.dart';
import 'package:egg_gender_classifide/views/egg_dashboard.dart';
import 'package:egg_gender_classifide/views/egg_home.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // เพิ่ม package url_launcher

class EggAbout_ui extends StatefulWidget {
  const EggAbout_ui({super.key});

  @override
  State<EggAbout_ui> createState() => _EggAbout_uiState();
}

class _EggAbout_uiState extends State<EggAbout_ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EggDashboard_ui()));
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Advanced Search"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EggAdvancesearch_ui()));
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
        color: Colors.yellow.shade100, // สีพื้นหลัง body เป็นสีเหลืองอ่อน
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9, // กำหนดความกว้างของ Container เป็น 80% ของหน้าจอ
            height: MediaQuery.of(context).size.height * 0.85, // กำหนดความสูงของ Container เป็น 60% ของหน้าจอ
            decoration: BoxDecoration(
              color: Colors.white, // สีพื้นหลัง Container เป็นสีขาว
              borderRadius: BorderRadius.circular(10), // กำหนดขอบโค้งของ Container
            ),
            // เพิ่มเนื้อหาที่คุณต้องการใน Container นี้
            // เช่น Text, Image, Column, Row, ListView, etc.
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Egg Gender Classification",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black, // สีข้อความ
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Machine Mk.1",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black, // สีข้อความ
                      ),
                    ),
                  ),
                  Image.asset('assets/images/machine.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'จัดทำโดย',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'นักศึกษามหาวิทยาลัยเอเชียอาคเนย์',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'สาขาวิศวกรรมคอมพิวเตอร์',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ภายใต้ชื่อกลุ่ม เครื่องคัดแยกเพศไข่ไก่ด้วยปัญญาประดิษฐ์',
                    style: TextStyle(fontSize: 16),
                  ),

                  //ใส่ image buttun 3 อันในแภวเดียวกัน//
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildWebsiteButton(
                          'assets/images/button2.png', 'https://en.sau.ac.th'), // ปุ่มเปิดเว็บไซต์ 1
                      _buildWebsiteButton(
                          'assets/images/button1.png', 'https://www.facebook.com/sau.university/'), // ปุ่มเปิดเว็บไซต์ 2
                      _buildCallButton('assets/images/button3.png', '0810838027'), // ปุ่มโทรออก
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWebsiteButton(String imagePath, String url) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
          );
        }
      },
      child: Image.asset(
        imagePath,
        width: 60, // ปรับขนาดปุ่มได้ตามต้องการ
        height: 60, // ปรับขนาดปุ่มได้ตามต้องการ
      ),
    );
  }

  Widget _buildCallButton(String imagePath, String phoneNumber) {
    return GestureDetector(
      onTap: () async {
        final Uri launchUri = Uri(
          scheme: 'tel',
          path: phoneNumber,
        );
        if (await canLaunchUrl(launchUri)) {
          await launchUrl(launchUri);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch call to $phoneNumber')),
          );
        }
      },
      child: Image.asset(
        imagePath,
        width: 60, // ปรับขนาดปุ่มได้ตามต้องการ
        height: 60, // ปรับขนาดปุ่มได้ตามต้องการ
      ),
    );
  }
}
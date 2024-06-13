import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:fitness_final/features/user_auth/presentation/pages/login_page.dart";
import 'package:fitness_final/features/user_auth/presentation/pages/exr_page.dart';
import 'package:fitness_final/features/user_auth/presentation/pages/profile_page.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> exr = [
    {
      "name": "Вправи на прес",
      "description": "Прокачай свій прес",
      "image": "assets/press.png",
      "level": "Рівень: Легко",
    },
    {
      "name": "Вправи на спину",
      "description": "Прокачай свою спину",
      "image": "assets/spina.png",
      "level": "Рівень: Середній",
    },
    {
      "name": "Вправи на ноги",
      "description": "Прокачай свої ноги",
      "image": "assets/legs.jpg",
      "level": "Рівень: Складний",
    },
    {
      "name": "Вправи на руки",
      "description": "Прокачай свої руки",
      "image": "assets/arms.jpg",
      "level": "Рівень: Смерть",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Головна сторінка"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                PageTransition(type: PageTransitionType.fade, child: LoginPage()),
              );
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(type: PageTransitionType.fade, child: ProfilePage()),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.purple],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/company_logo.png',
                height: 70,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: exr.length,
                itemBuilder: (context, index) {
                  return exrItem(
                    name: exr[index]["name"],
                    description: exr[index]["description"],
                    image: exr[index]["image"],
                    level: exr[index]["level"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class exrItem extends StatelessWidget {
  final String? name;
  final String? description;
  final String? image;
  final String? level;

  const exrItem({
    this.name,
    this.description,
    this.image,
    this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                image!,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(description!),
                  SizedBox(height: 5),
                  Text(
                    level!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: ExrPage (
                      exrName: name!,
                      exrDescription: description!,
                      exrImage: image!,
                      exrPrice: level!,
                    ),
                  ),
                );
              },
              child: Text("Перегляд"),
            ),
          ],
        ),
      ),
    );
  }
}

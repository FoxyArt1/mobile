import 'package:flutter/material.dart';

class ExrPage extends StatelessWidget {
  final String exrName;
  final String exrDescription;
  final String exrImage;
  final String exrPrice;

  const ExrPage({
    required this.exrName,
    required this.exrDescription,
    required this.exrImage,
    required this.exrPrice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$exrName"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.purple],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Image.asset(
                  exrImage,
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                Text(
                  exrName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  exrDescription,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  exrPrice,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  "1. Бурпі  2. Турецький підйом 3. Мертва тяга зі штангою 4. Випади з жимом над головою                    5. Планка з підйомом руки і ноги",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Повернутись назад"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

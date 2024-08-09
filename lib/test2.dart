import 'package:flutter/material.dart';


class test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          buildPage('Lock it up this summer', 'Locksmiths', 'images/lock1.png'),
          buildPage('Secure your home', 'Home Security', 'images/lock2.png'),
          buildPage('Protect your valuables', 'Safes', 'images/lock3.png'),
        ],
      ),
    );
  }

  Widget buildPage(String title, String buttonText, String imagePath) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.search),
                label: Text(buttonText),
                style: ElevatedButton.styleFrom(
                  // primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }
}

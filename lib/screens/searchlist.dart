import 'package:flutter/material.dart';


class searchlist extends StatelessWidget {
  const searchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCAD3D3),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 120,
              color: Colors.blue,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 120,
                    height: double.infinity,
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.green,
                  child: Column(children: [
                    Expanded(child: Container(color: Colors.pink,)),
                    Expanded(child: Container(color: Colors.amber)),
                    Expanded(child: Container(color: Colors.deepOrange,)),
                    Expanded(child: Container(color: Colors.deepPurple,)),

                  ]),
                ))
              ]),
            )
          ],
        ),
      )),
    );
  }
}

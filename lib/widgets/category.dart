import "package:flutter/material.dart";

class CategoryGrid   extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:SafeArea(
      child: Container(
        height: 250,
        width: 180,
        child: Stack(
          children: [
            Container(
              // height: 250,
              // width: 180,
              //  color: Colors.amber,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.amber ),
              // child: Image.asset(""),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 100,
                width: double.infinity,
                //  color: Colors.amber,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.red ),
              ),
            ),
        ],),
      ),
    ) ,);
  }
}
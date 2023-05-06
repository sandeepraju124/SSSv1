import "package:flutter/material.dart";

class CategoryGrid   extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // number of columns
    crossAxisSpacing: 2, // spacing between columns
    mainAxisSpacing: 20, // spacing between rows
  ),
      itemCount: 10, 
      itemBuilder: (BuildContext context, int index){
        return Center(
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),color:Colors.amber,
              
               ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("images/food.jpg",fit: BoxFit.cover, )),
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.white70 ),
              child: Center(child: Text("FOOD",style: TextStyle(fontSize: 17), )),
            ),
          ),
      ],),
    );
      })
    // Center(
    //   child: Stack(
    //     children: [
    //       Container(
    //         height: 250,
    //         width: 180,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),color:Colors.amber,
              
    //            ),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(15),
    //           child: Image.asset("images/food.jpg",fit: BoxFit.cover, )),
    //       ),
    //       Positioned(
    //         left: 0,
    //         right: 0,
    //         bottom: 10,
    //         child: Container(
    //           margin: EdgeInsets.symmetric(horizontal: 10),
    //           height: 100,
    //           width: double.infinity,
    //           //  color: Colors.amber,
    //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.white70 ),
    //           child: Center(child: Text("FOOD",style: TextStyle(fontSize: 17), )),
    //         ),
    //       ),
    //   ],),
    // )
     ,);
  }
}
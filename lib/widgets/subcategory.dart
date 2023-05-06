import "package:flutter/material.dart";
import "package:sssv1/providers/sub_category_provider.dart";
import 'package:provider/provider.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});



  @override
  Widget build(BuildContext context) {
    var SubCategoryData = Provider.of<SubcategoryProvider>(context, listen: false);
    return Scaffold(
      body: 
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // number of columns
    crossAxisSpacing: 40, // spacing between columns
    mainAxisSpacing:40, // spacing between rows
  ) ,
        itemCount: 1,
        itemBuilder: (context, index) {
          return 
          Column(
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                children: [
                    Container(
              decoration: BoxDecoration(
                boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)),
                    ),
                    Align(
              alignment: Alignment.center,
              child: Container(
                height: 90,
                width: 90,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                borderRadius: BorderRadius.circular(100),
                image:const DecorationImage(
                  image: AssetImage("images/food.gif"),
                  fit: BoxFit.fill,
                ),
                // shape: BoxShape.circle
              )),
                    )
                  ]),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
            height: 40, 
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Text("FOOD", style: TextStyle(color: Colors.white)), 
            
            )
          ],
        )
        ;
        },
        
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:sssv1/providers/sub_category_provider.dart";
import 'package:provider/provider.dart';
import "package:sssv1/utils/navigator.dart";
import 'package:sssv1/screens/SubCategoryList.dart';

class Subcategory extends StatefulWidget {


  
  String subCat;
  Subcategory({super.key, required this.subCat});

  @override
  State<Subcategory> createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {


@override
  void initState() {
    super.initState();
    var data = Provider.of<SubcategoryProvider>(context, listen: false);
    data.subCategoryProvider(widget.subCat);
    // print("init called");

  }
  


  @override
  Widget build(BuildContext context) {
    // print("build");
    var data = Provider.of<SubcategoryProvider>(context);
    // print('loading1 ${data.isLoading}');
    // data.subCategoryProvider(widget.subCat);
    // print('loading2 ${data.isLoading}');

    
    return Scaffold(
      appBar: AppBar(title: Text(widget.subCat)),
      body: data.isLoading  ? Center(child: Image.asset("images/loading2.gif"),) : 
      // data.isLoading  ? Center(child: CircularProgressIndicator()) : 
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: data.subcategoryData?.subcategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing:20,
          // childAspectRatio: 170 / 250,
          childAspectRatio: 150 / 230,
        ) ,
          itemBuilder:(BuildContext context,int int){
            return 
            SizedBox(
            // height: 220,
            // width: 150,
            // color: Colors.amber,
            child: GestureDetector(
              onTap: (){
                Navigators().navigatorPush(context, SubCategoryList(subCat:data.subcategoryData!.subcategories[int].toString() ,));
                // print(data.subcategoryData!.subcategories[int]);
                // print("clicked");
              },
              child: Column(children: [
                Expanded(
                  flex: 78,
                  child: Stack(
                    children: [
                      Container(
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent,
                        borderRadius: BorderRadius.circular(10),
                        image:const DecorationImage(image: AssetImage("images/darkback2.jpg", ),
                        fit: BoxFit.cover) ),
            
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 85,
                        width: 85,
                        // color: Colors.lightGreen,
                        decoration: BoxDecoration(
                        color: Colors.black38,
                    borderRadius: BorderRadius.circular(100),
                    image:const DecorationImage(
                      image: AssetImage("images/food.gif"),
                      fit: BoxFit.fill,
                    ),
                    // shape: BoxShape.circle
                  )
                      ),
                    )
                    ],
                  ),
                ),
                const SizedBox(height: 13,),
                Expanded(
                  flex: 22,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                      child: Center(child: Text(data.subcategoryData!.subcategories[int].toString(), style:const TextStyle(color: Colors.white),)),
                      
                  ),
                )
              ]),
            ),
                  )
      
          ;
          } ,
        ),
      ),

      );
  }
}
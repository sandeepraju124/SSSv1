//  prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sssv1/providers/sub_category_list.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/screens/RealEstateProfile.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';


class SubCategoryList extends StatefulWidget {
  String subCat;
  SubCategoryList({Key? key, required this.subCat}) : super(key: key);

  @override
  _SubCategoryListState createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {

  @override
  void initState() {
    super.initState();
    var data = Provider.of<SubcategoryListProvider>(context, listen: false);
    data.subCategoryListProvider(widget.subCat);
    // print("suncat");
    // print(widget.subCat);


  }


  @override
  Widget build(BuildContext context) {
    var data = Provider.of<SubcategoryListProvider>(context);
 
    return Scaffold(
      appBar: AppBar(title: Text(widget.subCat)),
      body: data.isLoading  ? Center(child: Image.asset("images/loading2.gif"),) :
      // data.isLoading  ? Center(child: CircularProgressIndicator()) :
      Material(
              child: ListView.builder(
                itemCount: data.subcategoryListData?.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigators().navigatorPush(context, testing2(uid:data.subcategoryListData![index].businessUid ));
                      Navigators().navigatorPush(context, RealEstateProfile(uid:data.subcategoryListData![index].businessUid ));
                    },
                    child: Column(
                      children: [
                       const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 70,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // color: Colors.blueAccent,
                                    borderRadius:
                                       const BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        offset:const Offset(0, 10),
                                        blurRadius: 40,
                                        spreadRadius: 0,
                                        color:const Color.fromARGB(255, 35, 35, 37)
                                            .withOpacity(0.30),
                                        // color: tgPrimaryColor.withOpacity(0.30),
                                      ),
                                    ],
                                  ),
                                  // margin: EdgeInsets.all(10),
                                  // height: 100,
                                  // color: Color.fromRGBO(68, 138, 255, 1),
                                  child: Row(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.all(14),
                                          // color: Colors.indigoAccent,
                                          width: 75,
                                          height: 75,
                                          child: Image.network(
                                            // snapshot.data![index]['image'],
                                            "https://plus.unsplash.com/premium_photo-1682800179834-c05e7c7d0a09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",

                                            fit: BoxFit.fill,
                                          )),
                                      Expanded(
                                        child: Container(
                                          margin:const EdgeInsets.only(top: 8, bottom: 8),
                                          // color: Colors.red,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data.subcategoryListData![index].businessName,
                                                    // widget.data["name"],
                                                    //  "Kritunga Restaurant",
                                                    
                                                           
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1),
                                                const Text(
                                                    "5/f 18 on lane ST, central hong kong near hong",
                                                    // provider.data[int].address,maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.grey,
                                                    ),overflow:TextOverflow.ellipsis ,
                                                    maxLines: 2,
                                                    )
                                              ]),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              /////// 2nd half of the container ///////////////

                              Expanded(
                                flex: 30,
                                child: Stack(
                                  children: [
                                    Container(
                                    decoration: BoxDecoration(
                                      // color: Color(0xfffffafa),
                                      color: Colors.white,
                                      borderRadius:
                                         const BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          offset:const Offset(0, -22),
                                          blurRadius: 40,
                                          spreadRadius: 0,
                                          // color:
                                          //     Color(0xFF0073FF).withOpacity(0.10),
                                          color: tgPrimaryColor.withOpacity(0.30),
                                        ),
                                      ],
                                    ),
                                    // margin: EdgeInsets.all(10),
                                    // height: 100,
                                    // color: Colors.greenAccent,
                                    
                                  ),
                                  
                                 const Align(
                                    alignment: Alignment.center,
                                    child: Text("4.5⭐",style: TextStyle(fontSize: 16))),
                                  const  Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text("344 💬",style: TextStyle(fontSize: 11, color: Colors.grey))),
                                    ),
                                  const  Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text("30 km", style: TextStyle(fontSize: 11, color: Colors.grey),)),
                                    ),

                                    ]
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}

import "package:flutter/material.dart";
import "package:sssv1/models/business_profile.dart";
import "package:sssv1/providers/business_profile_provider.dart";
import "package:sssv1/providers/sub_category_provider.dart";
import "package:provider/provider.dart";


class testing2 extends StatefulWidget {
  String uid;
  testing2({super.key,required this.uid });

  @override
  State<testing2> createState() => _testing2State();
}

class _testing2State extends State<testing2> {


  @override
  void initState() {
    super.initState();
    var data = Provider.of<BusinessProfileProvider>(context, listen: false);
    data.businessProfileProvider(widget.uid);
    print(widget.uid);
  }


  @override
  Widget build(BuildContext context) {
   
    var data = Provider.of<BusinessProfileProvider>(context);
     
    // searchlist.subCategoryProvider("retail");
    // SubcategoryProvider().subCategoryProvider("retail");
    return Scaffold(
      body: data.isLoading  ? Center(child: CircularProgressIndicator()) : 
      Scaffold(
                backgroundColor: Color(0xffCAD3D3),
                body: SafeArea(
                  child: ListView(
                    shrinkWrap: true,
                    // scrollDirection: Axis.vertical,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 160,
                            width: double.infinity,
                            color: Colors.green,
                            child: Image.asset(
                              "images/restaurant/restaurant1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: -65,
                            child: Center(
                              child: Container(
                                height: 110,
                                width: 210,
                                // color: Colors.redAccent,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child:
                                    Stack(clipBehavior: Clip.none, children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, left: 2, right: 2),
                                    child: Container(
                                      height: 40,
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                          data.businessProfileData!.businessName.toString(),
                                          // widget.idpasses,
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontSize: 18,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffCAD3D3),
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            child: const Icon(
                                              Icons.filter_outlined,
                                            ),
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              color: Color(0xffCAD3D3),
                                              shape: BoxShape.circle,
                                            )),
                                      )),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            color: Color(0xffCAD3D3),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: -25,
                                    child: Center(
                                      child: Container(
                                          height: 85,
                                          width: 80,
                                          // width: double.infinity,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1683406004728-e69d720c37a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                                            ),
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                          )),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text("gumadi pandu"
                          // rescomments.data.length.toString()
                          ),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 13),
                                child: Container(
                                    child: Image.asset("images/setting.png",
                                        height: 10,
                                        fit: BoxFit.none,
                                        color: Color(0xff5F6368)),
                                    height: 60,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    )),
                              )),
                          Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 13),
                                child: Container(
                                    child: const Icon(
                                      Icons.filter_outlined,
                                      color: Color(0xff5F6368),
                                    ),
                                    height: 60,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    )),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 110,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(children: [
                          Expanded(
                              child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Status",
                                      style: TextStyle(
                                          fontFamily: "Roboto", fontSize: 20)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Text(widget.idpasses),
                                  Text(

                                    "status",
                                      // widget.idpasses,
                                      style: const TextStyle(
                                          fontFamily: "Roboto",
                                          color: Colors.green))
                                ]),
                            // color: Colors.blueGrey,
                          )),
                          const VerticalDivider(
                              color: Colors.grey,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20),
                          Expanded(
                              child: Container(
                            // color: Colors.amber,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Premium",
                                      style: TextStyle(
                                          fontFamily: "Roboto", fontSize: 20)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Icon(
                                    Icons.currency_rupee_rounded,
                                    size: 20,
                                    color: Colors.red,
                                  )
                                ]),
                          )),
                          const VerticalDivider(
                              color: Colors.grey,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20),
                          Expanded(
                              child: Container(
                            // color: Colors.pink,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Dine",
                                      style: TextStyle(
                                          fontFamily: "Roboto", fontSize: 20)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("viidi peru enti",
                                      // rescomments.data.length.toString(),
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          color: Colors.green))
                                ]),
                          )),
                          const VerticalDivider(
                              color: Colors.grey,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20),
                          Expanded(
                              child: Container(
                            // color: Colors.deepOrange,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Type",
                                      style: TextStyle(
                                          fontFamily: "Roboto", fontSize: 20)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Only Veg',
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          color: Colors.green))
                                ]),
                          ))
                        ]),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 120,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(height: 10),
                      // comment section whole container
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                            itemCount:
                                // GetData().getCommentsLength(),
                                2,
                            // rescomments.data[0].comments.length,
                            shrinkWrap: true,
                            // scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext, int) =>
                                Text("skip for now")

                            ),
                      )
                    ],
                  ),
                ),
      
      ),
    );
  }
}
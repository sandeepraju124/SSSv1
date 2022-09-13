import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchList extends StatelessWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: const Color(0xffCAD3D3),
      body: ListView.builder(itemCount: 6,itemBuilder: (BuildContext, int) =>
        Column(
          children: [
            Gap(10),
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            spreadRadius: 0,
                            color:
                                Color.fromARGB(255, 35, 35, 37).withOpacity(0.30),
                          ),
                        ],
                      ),
                      // margin: EdgeInsets.all(10),
                      // height: 100,
                      // color: Color.fromRGBO(68, 138, 255, 1),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.all(13),
                              // color: Colors.indigoAccent,
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "images/restaurant/restaurant2.jpg",
                                fit: BoxFit.fill,
                              )),
                          Expanded(
                            child: Container(
                              // width: double.infinity,
                              // color: Colors.tealAccent,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // height: 40,
                                        margin:
                                            EdgeInsets.only(left: 10, top: 20),
                                        // height: 10,
                                        // color: Color.fromRGBO(255, 152, 0, 1),
                                        child: const Text("Kritunga Restaurant",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10, top: 3),
                                        // color: Colors.pinkAccent,
                                        child: Text(
                                            "5/f 18 on lane ST, central hong kong",
                                            style: TextStyle(color: Colors.grey)),
                                      ),
                                    )
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // 2nd half of the container
                  Expanded(
                    flex: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Color(0xfffffafa),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, -22),
                            blurRadius: 40,
                            spreadRadius: 0,
                            color: Color(0xFF0073FF).withOpacity(0.10),
                          ),
                        ],
                      ),
                      // margin: EdgeInsets.all(10),
                      // height: 100,
                      // color: Colors.greenAccent,
                      child: Column(children: [
                        Expanded(
                            flex: 65,
                            child: Container(
                              margin: EdgeInsets.only(top: 12),
                              // color: Colors.grey,
                              child: Row(                             
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("4.5", style: TextStyle(fontSize: 20)),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text("⭐",style: TextStyle(fontSize: 10),),
                                  // Text("398",textAlign:TextAlign.start ,style: TextStyle(fontSize: 10),)
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 35,
                          child: Container(
                            child: Row(
                              children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 14),
                                    // color: Colors.redAccent,
                                    child: Text(
                                      "342",
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.grey
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    // color: Colors.deepPurple,
                                     child: Text('30 KM Away',style: TextStyle(
                                      fontSize: 8,
                                        color: Colors.grey
                                      ),)),
                              )
                            ]),
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

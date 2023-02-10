import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import "package:provider/provider.dart";
import 'package:sssv1/providers/searchlist_provider.dart';


class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}




class _SearchListState extends State<SearchList> {

  @override
  void initState() {
  // print('this is init in SearchList');
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("this is after init state ");
      var provider = Provider.of<SearchlistProvider>(context, listen: false);
      // var searchlist = Provider.of<SearchlistProvider>(context, listen: false);
      // auth.resProv;
      provider.resProv();
      // searchlist.resProv(); 
    }); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('search list ui called');
    // var provider = Provider.of<SearchlistProvider>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    return Consumer<SearchlistProvider>(
      builder: (BuildContext context, provider, Widget? child) { 
        // print('build calling after change notifier');
            return Scaffold(
        // backgroundColor: const Color(0xffCAD3D3),
        // provider.data.length
        body: ListView.builder(itemCount:  provider.data.length,itemBuilder: (BuildContext, int) =>
          Column(
            children: [
              Gap(10),
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
                                child: Image.network(
                                  // "images/restaurant/restaurant2.jpg",
                                  provider.data[int].dpImage,
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
                                          child: 
                                          Text(provider.data[int].restaurantName,
                                          // const Text("Kritunga Restaurant",
                                          
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10, top: 3),
                                          // color: Colors.pinkAccent,
                                          child: Text(
                                              // "5/f 18 on lane ST, central hong kong",
                                              provider.data[int].address,maxLines: 2,
                                              style: TextStyle(color: Colors.grey,)),
                                        ),
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
                                  children:  [
                                    Text(provider.data[int].rating.toString(), style: TextStyle(fontSize: 20)),
                                    const SizedBox(
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
                                      child: const Text(
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
                                       child: const Text('30 KM Away',style: TextStyle(
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
       },
      
    );
  }
}

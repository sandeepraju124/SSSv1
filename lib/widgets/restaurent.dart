import 'package:flutter/material.dart';
import 'package:sssv1/providers/restaurent_provider.dart';
import 'package:provider/provider.dart';

class restaurant extends StatelessWidget {
  const restaurant({
    Key? key,
  }) : super(key: key);
  final text =
      "In this paper, we construct two fast iterative methods to solve pseudomonotone variational inequalities in real Hilbert spaces. The advantag";

  @override
  Widget build(BuildContext context) {
    return Consumer<restaurentProvider>(
      builder: ((context, provider, child) => SizedBox(
            height: 270,
            width: double.infinity,
            // color: Colors.yellow,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                itemCount: provider.data.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 150,
                        // height: 20,
                        // color: Colors.green,
                        child: Column(children: [
                          // Column1 RestaurentImage
                          Container(
                            // color: Colors.amber,
                            height: 200,
                            child: Image.asset(
                                fit: BoxFit.cover,
                                "images/restaurant/restaurant1.jpg"),
                          ),
                          // Column2 RestaurentName and Rating
                          Container(
                              height: 30,
                              // color: Colors.pink,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(flex: 60,
                                    child: Container(
                                      // color: Colors.deepPurpleAccent,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 6),
                                        child: Expanded(
                                          child: Text(provider.data[index].name,
                                              maxLines: 1,
                                              overflow:TextOverflow.ellipsis ,
                                              style:
                                                  TextStyle(color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 40,
                                    child: Container(margin: EdgeInsets.only(left: 5),
                                      // color: Colors.blue,
                                        child: Row(
                                      children: [
                                        Text(provider.data[index].rating.toString(),style: TextStyle(fontSize: 13),),
                                        const Icon(
                                          Icons.star,
                                          size: 13,
                                          color: Colors.yellow,
                                        ),
                                        Expanded(
                                          child: Text(
                                            provider.data[index].reviewers.toString(),overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        )
                                      ],
                                    )),
                                  ),
                                ],
                              )),
                              // Column3 Description
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Container(
                              // color: Colors.teal,
                              child: Text(provider.data[index].desp,overflow:TextOverflow.ellipsis ,maxLines: 3,
                                  style: const TextStyle(
                                      fontSize: 11, color: Colors.grey)),
                            ),
                          ))
                        ]),
                      ),
                    )),
          )),
    );
  }
}

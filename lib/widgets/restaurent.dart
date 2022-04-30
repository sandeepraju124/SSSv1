import 'package:flutter/material.dart';

class restaurant extends StatelessWidget {
  const restaurant({
    Key? key,
  }) : super(key: key);
  final text =
      "In this paper, we construct two fast iterative methods to solve pseudomonotone variational inequalities in real Hilbert spaces. The advantag";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      // color: Colors.yellow,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 150,
                  // height: 20,
                  // color: Colors.green,
                  child: Column(children: [
                    Container(
                      // color: Colors.amber,
                      height: 200,
                      child: Image.asset(
                          fit: BoxFit.cover,
                          "images/restaurant/restaurant1.jpg"),
                    ),
                    Container(
                        height: 30,
                        // color: Colors.pink,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Text("Tatva",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Row(
                              children: const [
                                Text('4.5'),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '375',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            )
                          ],
                        )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Container(
                        // color: Colors.teal,
                        child: Text(text,
                            style:
                                TextStyle(fontSize: 11, color: Colors.white)),
                      ),
                    ))
                  ]),
                ),
              )),
    );
  }
}

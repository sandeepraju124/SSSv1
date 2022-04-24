import 'package:flutter/material.dart';

class restaurant extends StatelessWidget {
  const restaurant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
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
              color: Colors.green,
              child: Column(children: [
                Container(
                  color: Colors.amber,height: 200,

                  // child: const Image(fit:BoxFit.fill ,
                  //     image: NetworkImage('https://images.unsplash.com/photo-1598276952428-9a9bf2645144?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80')
                  // ),
                ),
                Expanded(child: Container(color: Colors.teal,))
              ]),
            ),
          )),
    );
  }
}
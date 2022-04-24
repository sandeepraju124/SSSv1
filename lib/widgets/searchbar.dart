// search bar with row [icon][extended -> text field][icon]
// sample image name -> searchbar
import 'package:flutter/material.dart';

class searchbar extends StatelessWidget {
  const searchbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 18,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          child: Row(children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.grey,
              ),
            ),
            Expanded(
                child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "search"))),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_horiz, size: 30, color: Colors.grey),
            )
          ]),
          decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          // color: Colors.black12,
          height: 65,
          width: double.infinity,
        ),
      )
    ]);
  }
}
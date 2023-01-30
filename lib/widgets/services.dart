// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';

import 'package:sssv1/screens/searchlist.dart';

class Services extends StatelessWidget {
  const Services({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        margin: EdgeInsets.only(right: 8),
        height: 200,
        width: double.infinity,
        // color: Colors.amber,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(children: [
          Expanded(
              child: Container(
            // color: Colors.yellow,
            child: Row(children: [
              Expanded(
                  child: Container(
                // color: Colors.greenAccent,
                child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xffc4c4c4), shape: BoxShape.circle),
                        child: Image.asset('images/services/caricon.png'),
                      ),
                    ),
                  ),
                  const Text('car wash')
                ]),
              )),
              Expanded(
                  child: Container(
                child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                      child: GestureDetector(
                        onTap: () {
                          // var searchlist = Provider.of<SearchlistProvider>(context, listen: false);
                          // searchlist.resProv();
                          print('navigation called');

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SearchList()));
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xffc4c4c4), shape: BoxShape.circle),
                          child: Image.asset('images/services/restaurant.png'),
                        ),
                      ),
                    ),
                  ),
                  const Text('Restaurants')
                ]),
                // color: Colors.deepOrangeAccent,
              )),
              Expanded(
                  child: Column(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color(0xffc4c4c4), shape: BoxShape.circle),
                      child: Image.asset('images/services/realestate.png'),
                    ),
                  ),
                ),
                const Text('real estate')
              ])),
              Expanded(
                  child: Container(
                // color: Colors.lime,
                child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xffc4c4c4), shape: BoxShape.circle),
                        child: Image.asset('images/services/plumbing.png'),
                      ),
                    ),
                  ),
                  const Text('plumbing')
                ]),
              )),
            ]),
          )),
          Expanded(
            child: Container(
                // color: Colors.pinkAccent,
                child: Row(
              children: [
                Expanded(
                    child: Container(
                  // color: Colors.black45,
                  child: Column(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xffc4c4c4), shape: BoxShape.circle),
                          child: Image.asset('images/services/gym.png'),
                        ),
                      ),
                    ),
                    const Text('health')
                  ]),
                )),
                Expanded(
                    child: Container(
                        // color: Colors.deepOrange,
                        child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 15, 3, 5),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xffc4c4c4), shape: BoxShape.circle),
                        child: Image.asset('images/services/gymm.png'),
                      ),
                    ),
                  ),
                  const Text('gym')
                ]))),
                Expanded(
                    child: Container(
                        // color: Colors.white,
                        child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 15, 3, 3),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xffc4c4c4), shape: BoxShape.circle),
                        child: Image.asset('images/services/bar.png'),
                      ),
                    ),
                  ),
                  const Text('bar')
                ]))),
                Expanded(
                    child: Container(
                        // color: Colors.black12,
                        child: Column(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 15, 2, 3),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xffc4c4c4), shape: BoxShape.circle),
                        child: const Align(
                            alignment: Alignment.center, child: Text('MORE')),
                      ),
                    ),
                  ),
                  const Text('gym')
                ]))),
              ],
            )),
          ),
          const SizedBox(
            height: 7,
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        height: 200,
        width: double.infinity,
        // color: Colors.amber,
        decoration: const BoxDecoration(
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
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xffc4c4c4), shape: BoxShape.circle),
                        child: Image.asset('images/services/pickers.png'),
                      ),
                    ),
                  ),
                  const Text('pickers')
                ]),
                // color: Colors.deepOrangeAccent,
              )),
              Expanded(
                  child: Container(
                // color: Colors.teal,
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
                ]),
              )),
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
                        child: const Align(alignment: Alignment.center  ,child: Text('MORE')),
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

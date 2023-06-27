
import 'package:flutter/material.dart';
import 'package:sssv1/utils/constants.dart';

class Services extends StatelessWidget {
  const Services({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1),
            color: secondaryColor5LightTheme,
            borderRadius:const BorderRadius.all(Radius.circular(10))),
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
                            color: Colors.white
                            , shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('images/services/carwash.png'),
                        ),
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
                          // print('navigation called');

                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => SearchList())
                          //     );
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('images/services/cutlery.png'),
                          ),
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
                          color: Colors.white
                          // secondaryColor10LightTheme
                          , shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('images/services/estateagent.png'),
                      ),
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
                            color: secondaryColor10LightTheme, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('images/services/plumber.png'),
                        ),
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
                              color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('images/services/fitness.png'),
                          ),
                        ),
                      ),
                    ),
                    const Text('Gym')
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
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('images/services/barber.png'),
                        ),
                      ),
                    ),
                  ),
                  const Text('Barber')
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
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('images/services/champagne.png'),
                        ),
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
                            color: secondaryColor10LightTheme, shape: BoxShape.circle),
                        child: const Align(
                            alignment: Alignment.center, child: Text('MORE', style: TextStyle(fontSize: 10),)),
                      ),
                    ),
                  ),
                  const Text('more')
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

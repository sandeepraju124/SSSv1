// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:sssv1/providers/askcommunity_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/utils/constants.dart';

// class AskForCommunityWidget extends StatefulWidget {
//   final String uid;

//   const AskForCommunityWidget({Key? key, required this.uid}) : super(key: key);

//   @override
//   _AskForCommunityWidgetState createState() => _AskForCommunityWidgetState();
// }

// class _AskForCommunityWidgetState extends State<AskForCommunityWidget> {
//   Map<int, bool> showRemainingAnswers = {};

//   @override
//   void initState() {
//     super.initState();
//       // var data = Provider.of<AskCommunityProvider>(context, listen: false);
//       // data.askCommunityProvider(widget.uid);

//   }

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<AskCommunityProvider>(context);
//     return data.isLoading
//         ? Center(child: CircularProgressIndicator())
//         : ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: data.askCommunityData?.data.length,
//             itemBuilder: (BuildContext context,int int) {
//               var question = data.askCommunityData!.data[int];
//               var answers = question.answers;
//               var hasRemainingAnswers =
//                   answers.length > 2 && !showRemainingAnswers.containsKey(int);
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       question.question,
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: hasRemainingAnswers ? 2 : answers.length,
//                     itemBuilder: (BuildContext context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           answers[index].answer,
//                           style: TextStyle(fontSize: 14, color: Colors.grey),
//                         ),
//                       );
//                     },
//                   ),
//                   if (hasRemainingAnswers)
//                   GestureDetector(
//                     onTap: (){
//                       setState(() {
//                         showRemainingAnswers[int] = true;
//                       });
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//                       height: 30,
//                       width: double.infinity,

//                       decoration: BoxDecoration(
//                         // color: Colors.grey,
//                         border: Border.all(color: secondaryColor20LightTheme)
//                       ),
//                       child: Text("Show ${answers.length - 2} more answers"),
//                     ),
//                   ),
//                     // ElevatedButton(
//                     //   style: ButtonStyle(iconColor:MaterialStateProperty.all(Colors.cyanAccent) ),
//                     //   onPressed: () {
//                     //     setState(() {
//                     //       print("pressed");
//                     //       showRemainingAnswers[int] = true;
//                     //     });
//                     //   },
//                     //   child: Text("Show ${answers.length - 2} more answers"),
//                     // ),
//                   const Divider(),
//                 ],
//               );
//             },
//           );
//   }
// }

////////////////////// new code  //////////////////////////////////

///// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sssv1/Askcommunitypages/questions.dart';
// import 'package:sssv1/Ask%20community/questions.dart';

// import '../Ask community/askcomm.dart';

// import '../screens/popup.dart';
import '../utils/constants.dart';

class Askcommpage extends StatefulWidget {
  const Askcommpage({super.key});

  @override
  State<Askcommpage> createState() => _AskcommpageState();
}

class _AskcommpageState extends State<Askcommpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Ask The Community',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
    
              //////// first elevated button
              SizedBox(
                height: 60,
                width: 500,
                child: Padding(
                  // padding: const EdgeInsets.all(15.0),
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tgPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () {
                        // Navigator.of(context)
                        //     .push(HeroDialogRoute(builder: (context) {
                        //   return AskCommPage();
                        // }));
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Questionpage(id: "");
                        }));
                      },
                      child: Text(
                        'Ask',
                        style: TextStyle(
                          color: tgPrimaryText,
                          fontSize: 21,
                        ),
                      )),
                ),
              ),
    
              //////////// second elevated button //////////
              SizedBox(
                height: 60,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          // foregroundColor: tgPrimaryColor,
                          side: BorderSide(color: tgPrimaryColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () {
                        // Navigator.of(context)
                        //     .push(HeroDialogRoute(builder: (context) {
                        //   return Answerpage();
                        // }));
    
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Questionpage(
                            id: '',
                          );
                        }));
                      },
                      child: Text(
                        '.........',
                        style: TextStyle(
                          color: tgPrimaryText,
                          fontSize: 21,
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

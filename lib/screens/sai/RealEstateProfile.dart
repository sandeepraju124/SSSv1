// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables



import 'package:flutter/Material.dart';
import 'package:sssv1/comments/commentpost.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/comments_provider.dart';
import 'package:sssv1/widgets/Askthecommunity.dart';
import 'package:sssv1/screens/sai/mapscreen.dart';
import 'package:sssv1/screens/sai/popup.dart';
import 'package:provider/provider.dart';

import 'package:sssv1/utils/constants.dart';

class RealEstateProfile extends StatefulWidget {
  String uid;
  RealEstateProfile({super.key, required this.uid});
  

  @override
  _RealEstateProfileState createState() => _RealEstateProfileState();
}

class _RealEstateProfileState extends State<RealEstateProfile> {
  void _showModalbottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        // barrierColor: tgPrimaryColor,
        builder: (context) => DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5,
            minChildSize: 0,
            builder: (context, scrollController) => SingleChildScrollView(
                  controller: scrollController,
                  child: CommentPostPage(),
                )));
  }



  @override
  void initState() {
    // print(widget.uid);
    super.initState();
    var data = Provider.of<BusinessProfileProvider>(context, listen: false);
    data.businessProfileProvider(widget.uid);
    var dataAsk = Provider.of<AskCommunityProvider>(context, listen: false);
    dataAsk.askCommunityProvider(widget.uid);
    var datacomments = Provider.of<CommentSectionProvider>(context, listen: false);
    datacomments.commentSectionProvider(widget.uid);
    // print(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    // var dataAsk = Provider.of<AskCommunityProvider>(context);
    var data = Provider.of<BusinessProfileProvider>(context);
    var datacomments = Provider.of<CommentSectionProvider>(context);
    // Map<int, bool> showRemainingAnswers = {};
    // final _commentcontroller = TextEditingController();

    return 
    Scaffold(
      floatingActionButton: FloatingActionButton(
        shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
    side: BorderSide(color: Colors.white),
  ) ,
        
        
        onPressed: () {
          // _showModalbottomSheet(context);

        },
        backgroundColor: tgPrimaryColor,
        child: Icon(
          Icons.add,
          color: tgPrimaryText,
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: tgPrimaryColor,
        title: data.isLoading  ? Center(child: Text(""),) : 
        Text(
          data.businessProfileData!.businessName.toString(),
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black54,
        ),
        shape: Border(bottom: BorderSide(color: tgDarkPrimaryColor)),
      ),
      body: data.isLoading  ? Center(child: Image.asset("images/loading2.gif"),) :
      // data.isLoading  ? Center(child: CircularProgressIndicator()) :
      ListView(
        // shrinkWrap: true,
        //     scrollDirection: Axis.vertical,
        //     physics: const ScrollPhysics(),
        children: [
          Stack(
            clipBehavior: Clip.none,

            /////////// top image ///////////////

            children: [
              Container(
                color: Colors.grey,
                height: 150,
                width: double.infinity,
                child: Image.network(
                  // data!['imagenext'],
                  "https://images.unsplash.com/photo-1495954380655-01609180eda3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                  fit: BoxFit.cover,
                ),
              ),

              ///second image ////////////
              Positioned(
                left: -12,
                right: -12,
                bottom: -75,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: tgPrimaryColor,
                        width: 1.5,
                      ),
                      color: Colors.white
                      ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  // color: Colors.white,
                  height: 110,
                  width: double.infinity,
                  child: Row(children: [
                    Expanded(
                      flex: 28,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: tgPrimaryColor,
                        )),
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        height: double.infinity,
                        // color: Colors.lightBlue,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1511884642898-4c92249e20b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
                          // "https://images.unsplash.com/photo-1605276374104-dee2a0ed3cd6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 45,
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          // color: Colors.deepPurple,
                          child: Column(children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 18),
                                  child: Text(
                                      data.businessProfileData!.businessName
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                ),
                              ),
                            ),
                            Divider(
                              endIndent: 10,
                              color: Colors
                                  .grey, // Optional - set the color of the divider
                              thickness:
                                  1, // Optional - set the thickness of the divider
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, right: 10),
                                  child: Text(
                                      "this is located on the bank od reaver with 2 bedrooms",
                                      style: TextStyle(color: Colors.grey)),
                                ),
                              ),
                            ),
                          ]),
                        )),
                    Container(
                      width: 1,
                      height: 90, // Set the height of the vertical line
                      color: Colors.grey, // Set the color of the vertical line
                    ),
                    Expanded(
                        flex: 27,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          height: double.infinity,
                          // color: Colors.pink,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("12,000 PM"),
                                Text("24000 Dpst"),
                                Text("20 sft")
                              ]),
                        )),
                  ]),

                  // width: 50,
                ),
              ),
            ],
          ),

          //////// //////////////////////
          ///

          SizedBox(
            height: 82,
          ),

          Divider(
            color: Colors.blueGrey,
            thickness: .7,
          ),

          //////// services ///////////////
          ///
          ///////Icon BUTTONS //////////////////////

          Container(
            width: double.infinity,
            height: 100,
            // color: Colors.redAccent,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    // color: Colors.grey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 65,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: tgPrimaryColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_comment_outlined),
                                iconSize: 26,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Text(
                            "Ask Community",
                            style: TextStyle(fontSize: 12),
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.grey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 65,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: tgPrimaryColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.call),
                                iconSize: 26,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Text(
                            "Call",
                            style: TextStyle(fontSize: 12),
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.grey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 65,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: tgPrimaryColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.comment_bank_sharp),
                                iconSize: 26,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Text(
                            "Add Review",
                            style: TextStyle(fontSize: 12),
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.grey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 65,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: tgPrimaryColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_a_photo_outlined),
                                iconSize: 26,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Text(
                            "Add Photo",
                            style: TextStyle(fontSize: 12),
                          )
                        ]),
                  ),
                ),
              ],

              // SizedBox(height: 10),
              // Text(
              //   'Add Review',
              //   style: TextStyle(fontSize: 12),
              // ),
            ),
          ),

          Divider(
            color: Colors.blueGrey,
            thickness: .7,
          ),

          ////////////// small description ////////////////////

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Know About them',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: Text(
                    data.businessProfileData!.businessDescription.toString(),
                    // 'If the sentence is the essential soul to express oneself in their own way, you in creating new knowledge but also enhance your brain function.',
                    style: TextStyle(color: tgSecondaryText),
                  ),
                ),
              ),
            ],
          ),

          Divider(
            color: Colors.blueGrey,
            thickness: .7,
          ),

          /////////////////// MAP Implement ///////////////////////

          SizedBox(
            width: double.infinity,
            height: 300,
            // color: Colors.white,
            child: MapScreenPage(),
          ),

          SizedBox(
            height: 8,
          ),

          Divider(
            color: Colors.blueGrey,
            thickness: .7,
          ),

          ///////////////////// ASK COMMUNITY WIDGET //////////////

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Ask The Community',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          

          AskForCommunityWidget(uid: widget.uid,),

          Divider(
            color: Colors.blueGrey,
            thickness: .7,
          ),
          GestureDetector(
            onTap: () {
          _showModalbottomSheet(context);
        },
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
                  )
              ),
              child: Text("Comments ${datacomments.getCommentsData!.comments.length}", style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          )
          

          
        ],
      ),
    );
  }
}

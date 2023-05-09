import 'package:flutter/material.dart';
import 'package:sssv1/providers/askcommunity_provider.dart';
import 'package:provider/provider.dart';


class AskForCommunity extends StatefulWidget {
  String uid ;
  AskForCommunity({super.key,required this.uid});

  @override
  State<AskForCommunity> createState() => _AskForCommunityState();
}

class _AskForCommunityState extends State<AskForCommunity> {


  @override
  void initState() {
    var data = Provider.of<AskCommunityProvider>(context, listen: false);
    data.askCommunityProvider(widget.uid);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AskCommunityProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Ask for community"),
      ),
      body: data.isLoading ? Center(child: CircularProgressIndicator()) : 
      ListView.builder(
        itemCount: data.askCommunityData?.data.length,
        itemBuilder: (BuildContext, int){
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Text(data.askCommunityData!.data[int].question),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.askCommunityData?.data[int].answers.length,
                    itemBuilder: (BuildContext, index){
                      return Text(data.askCommunityData!.data[int].answers[index].answer);
                    }),
                )
              ],
            ),
          );
        },

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sssv1/providers/rescomments_provider.dart';
import 'package:sssv1/providers/restaurent_provider.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/screens/profile.dart';

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
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                itemCount: provider.data.length,
                itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: ()async {
                    var rescomments = Provider.of<rescommentsProvider>(context, listen: false);
                    await rescomments.resProv(provider.data[index].name);
                    print("checking restaurent name ");
                    print(provider.data[index].name);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => profile(idpasses: provider.data[index].name,)));
                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.only(left: 14),
                    // height: 20,
                    // color: Colors.green,
                    child: Column(children: [
                      // Column1 RestaurentImage
                      Container(
                        // color: Colors.amber,
                        height: 200,
                        child: Image.network(
                            fit: BoxFit.cover,
                            // "https://assets.vogue.in/photos/61b3753015fc923d29d9b585/2:3/w_2560%2Cc_limit/Silly-Food-Image-4-819x1024.jpeg"
                            provider.data[index].image
                            ),
                      ),
                      // Column2 RestaurentName and Rating
                      SizedBox(
                          height: 30,
                          // color: Colors.pink,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(provider.data[index].name,
                                    // maxLines: 1,
                                    overflow:TextOverflow.ellipsis ,
                                    style:
                                        const TextStyle(color: Colors.black)),
                              ),
                              Expanded(
                                child: Container(margin: const EdgeInsets.only(left: 5),
                                  // color: Colors.blue,
                                    child: Row(
                                  children: [
                                    Text(provider.data[index].rating.toString(),style: const TextStyle(fontSize: 13),),
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
                          child: Container(
                            // color: Colors.teal,
                            child: Text(provider.data[index].desp,overflow:TextOverflow.ellipsis ,maxLines: 3,
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.grey)),
                          ))
                    ]),
                  ),
                )),
          )),
    );
  }
}

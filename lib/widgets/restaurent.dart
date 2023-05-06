import 'package:flutter/material.dart';
import 'package:sssv1/models/business_models.dart';
import 'package:sssv1/network_calling/http.dart';



class Restaurant extends StatelessWidget {
  const Restaurant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Business>>(
      future: Http().fetchBusinessData("https://revolution.azurewebsites.net/subcategory/restaurant"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Business> businesses = snapshot.data!;
          return SizedBox(
          height: 270,
          width: double.infinity,
          // color: Colors.yellow,
          child: ListView.builder(

              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              itemCount: businesses.length,
              itemBuilder: (BuildContext context, int index) 
              
              {
                Business business = businesses[index];
                  return GestureDetector(
                    onTap: () async {
                      
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => restaurantProfile(
                      //           id: provider.data[index].id,
                      //         ))
                      //         );
                    },
                    child: Container(
                      width: 150,
                      // ignore: prefer_const_constructors
                      margin: EdgeInsets.only(left: 14),
                      // height: 20,
                      // color: Colors.green,
                      child: Column(children: [
                        // Column1 RestaurentImage
                        Container(
                          // color: Colors.amber,
                          height: 200,
                          child: Image.network(
                            business.profileImage,

                              fit: BoxFit.cover,
                              // "https://assets.vogue.in/photos/61b3753015fc923d29d9b585/2:3/w_2560%2Cc_limit/Silly-Food-Image-4-819x1024.jpeg"
                              // provider.data[index].image
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
                                  child: Text(
                                    business.businessName,
                                    // "something",
                                    // provider.data[index].name,
                                      // maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.black)),
                                ),
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      // color: Colors.blue,
                                      child: Row(
                                        children: [
                                          Text(
                                            "3.2"
                                            // provider.data[index].rating
                                            //     .toString(),
                                            // style:
                                            //     const TextStyle(fontSize: 13),
                                          ),
                                          const Icon(
                                            Icons.star,
                                            size: 13,
                                            color: Colors.yellow,
                                          ),
                                          Expanded(
                                            child: Text("211"
                                              // provider.data[index].reviews
                                              //     .toString(),
                                              // overflow: TextOverflow.ellipsis,
                                              // style: TextStyle(fontSize: 13),
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
                          child: Text(
                            business.businessDescription,
                            // provider.data[index].despription,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey)
                                  ),
                        ))
                      ]),
                    ),


                  );
              }
              
              
              
                  
                  ),
        );
    //       ListView.builder(
    //         itemCount: businesses.length,
    //         itemBuilder: (context, index) {
    //           Business business = businesses[index];
    //           return ListTile(
    //   title: Text(business.businessName),
    //   subtitle: Text(business.category),
    // );
    //         },
    //       );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Failed to fetch data'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

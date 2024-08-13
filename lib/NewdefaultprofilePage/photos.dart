// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:sssv1/providers/service_provider.dart';

// class AddPhotos extends StatefulWidget {
//   @override
//   State<AddPhotos> createState() => _AddPhotosState();
// }

// class _AddPhotosState extends State<AddPhotos> {
//   // List<File> _images = [];
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     var data = Provider.of<ServicesProvider>(context);
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               flex: 80,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 16),
//                         child: Text(
//                           "Total Images ${data.BusinessData!.images!.length}",
//                           style: TextStyle(fontSize: 17, color: Colors.grey),
//                         ),
//                       ),
//                       GridView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         padding: EdgeInsets.all(16),
//                         shrinkWrap: true,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                         ),
//                         itemCount: data.BusinessData!.images!.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return GestureDetector(
//                             onTap: () {
//                               // Navigate to fullscreen image
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => FullScreenImage(
//                                       imageUrl:
//                                           data.BusinessData!.images![index]),
//                                 ),
//                               );
//                             },
//                             child: GridTile(
//                               child: Container(
//                                 color: Colors.blue,
//                                 margin: EdgeInsets.all(4),
//                                 child: Image.network(
//                                   data.BusinessData!.images![index],
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//   }
// }


class AddPhotos extends StatefulWidget {
  @override
  State<AddPhotos> createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ServicesProvider>(context);

    // Check if images data is available
    var images = data.BusinessData?.images ?? [];
    bool hasImages = images.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 80,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          hasImages
                              ? "Total Images ${images.length}"
                              : "Total Images 0",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ),
                      if (hasImages)
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(16),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: images.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigate to fullscreen image
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FullScreenImage(
                                        imageUrl: images[index]),
                                  ),
                                );
                              },
                              child: GridTile(
                                child: Container(
                                  color: Colors.blue,
                                  margin: EdgeInsets.all(4),
                                  child: Image.network(
                                    images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      if (!hasImages)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'No images to display',
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FullScreenImage extends StatefulWidget {
  final String imageUrl;

  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Implement delete functionality
              // deleteImage();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Container(
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width * 0.8, // Adjust as needed
            height:
                MediaQuery.of(context).size.height * 0.8, // Adjust as needed
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.contain, // Ensure the entire image is visible
            ),
          ),
        ),
      ),
    );
  }
}

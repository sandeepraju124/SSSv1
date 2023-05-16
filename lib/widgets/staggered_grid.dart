import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:provider/provider.dart';


class StaggeredGridq extends StatelessWidget {
  // final List<String> imageUrls = [
  //   'https://images.unsplash.com/photo-1682091036572-b90b02dd347e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
  //   'https://images.unsplash.com/photo-1684140044332-8b5285c699f3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
  //   'https://images.unsplash.com/photo-1683914791767-764d03299719?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=401&q=80',
  //   // Add more image URLs to the list
  // ];

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BusinessProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Random Images'),
      ),
      body: GridView.builder(
        itemCount: data.businessProfileData?.images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenImage(imageUrl: data.businessProfileData!.images[index]),
                ),
              );
            },
            child: Image.network(
              data.businessProfileData!.images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.black,
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}

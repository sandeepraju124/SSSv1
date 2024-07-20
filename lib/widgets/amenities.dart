// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/providers/service_provider.dart';
// import 'package:sssv1/utils/constants.dart';

// class AmenitiesGridView extends StatefulWidget {
//   const AmenitiesGridView({super.key});

//   @override
//   _AmenitiesGridViewState createState() => _AmenitiesGridViewState();
// }

// class _AmenitiesGridViewState extends State<AmenitiesGridView> {
//   void _showAllAmenitiesBottomSheet(BuildContext context, List<String> amenities) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'All Amenities',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: tgDarkPrimaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Expanded(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: amenities.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return ListTile(
//                       leading: const Icon(
//                         Icons.check,
//                         color: tgPrimaryColor,
//                         size: 20,
//                       ),
//                       title: Text(
//                         amenities[index],
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text(
//                   'Close',
//                   style: TextStyle(
//                     color: tgPrimaryColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     var servidedata = Provider.of<ServicesProvider>(context);
//     int initialAmenitiesCount = 3;

//     if (servidedata.BusinessData == null ||
//         servidedata.BusinessData!.amenities == null) {
//       return const Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.0),
//         child: Text(
//           "No amenities available",
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.black54,
//           ),
//         ),
//       );
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//           child: Text(
//             "Amenities",
//             style: TextStyle(
//               fontSize: 19,
//               fontWeight: FontWeight.bold,
//               color: tgDarkPrimaryColor,
//               decoration: TextDecoration.underline,
//             ),
//           ),
//         ),
//         servidedata.BusinessData!.amenities!.isNotEmpty
//             ? ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: servidedata.BusinessData!.amenities!.length >
//                         initialAmenitiesCount
//                     ? initialAmenitiesCount
//                     : servidedata.BusinessData!.amenities!.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 4.0, horizontal: 16.0),
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.check_circle,
//                           color: tgPrimaryColor,
//                           size: 20,
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: Text(
//                             servidedata.BusinessData!.amenities![index],
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               )
//             : const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Text(
//                   "No amenities available",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ),
//         if (servidedata.BusinessData!.amenities!.length > initialAmenitiesCount)
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: TextButton(
//               onPressed: () => _showAllAmenitiesBottomSheet(
//                   context, servidedata.BusinessData!.amenities!),
//               child: const Text(
//                 'More ...',
//                 style: TextStyle(
//                   color: tgDarkPrimaryColor,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/utils/constants.dart';

class AmenitiesGridView extends StatefulWidget {
  const AmenitiesGridView({super.key});

  @override
  _AmenitiesGridViewState createState() => _AmenitiesGridViewState();
}

class _AmenitiesGridViewState extends State<AmenitiesGridView> {
  void _showAllAmenitiesBottomSheet(
      BuildContext context, List<String> amenities) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Text(
                      'All Amenities',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: tgDarkPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: amenities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.check,
                            color: tgPrimaryColor,
                            size: 20,
                          ),
                          title: Text(
                            amenities[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          color: tgPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var servidedata = Provider.of<ServicesProvider>(context);
    int initialAmenitiesCount = 3;

    if (servidedata.BusinessData == null ||
        servidedata.BusinessData!.amenities == null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Amenities",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Container(
              // margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 70,
              color: tgPrimaryColor,
            ),
            Text(
              "No amenities available for this business",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            // Divider(
            //   color: Colors.grey[200],
            //   thickness: 5,
            // ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Text(
            "Amenities",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          // margin: const EdgeInsets.only(top: 4),
          height: 2,
          width: 70,
          color: tgPrimaryColor,
        ),
        servidedata.BusinessData!.amenities!.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: servidedata.BusinessData!.amenities!.length >
                        initialAmenitiesCount
                    ? initialAmenitiesCount
                    : servidedata.BusinessData!.amenities!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: tgPrimaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            servidedata.BusinessData!.amenities![index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "No amenities available",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
        if (servidedata.BusinessData!.amenities!.length > initialAmenitiesCount)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: () => _showAllAmenitiesBottomSheet(
                  context, servidedata.BusinessData!.amenities!),
              child: const Text(
                'More ...',
                style: TextStyle(
                  color: tgDarkPrimaryColor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// //
// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';
// import 'package:sssv1/providers/service_provider.dart';
// import 'package:sssv1/utils/constants.dart';

// class AmenitiesGridView extends StatefulWidget {
//   const AmenitiesGridView({super.key});

//   @override
//   _AmenitiesGridViewState createState() => _AmenitiesGridViewState();
// }

// class _AmenitiesGridViewState extends State<AmenitiesGridView> {
//   void _showAllAmenitiesDialog(BuildContext context, List<String> amenities) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           title: const Text(
//             'All Amenities',
//             style: TextStyle(
//               // fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: tgDarkPrimaryColor,
//             ),
//           ),
//           content: SizedBox(
//             width: double.maxFinite,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: amenities.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   leading: const Icon(
//                     Icons.check,
//                     color: tgPrimaryColor,
//                     size: 20,
//                   ),
//                   title: Text(
//                     amenities[index],
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text(
//                 'Close',
//                 style: TextStyle(
//                   color: tgPrimaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     var servidedata = Provider.of<ServicesProvider>(context);
//     int initialAmenitiesCount = 3;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//           child: Container(
//             decoration: BoxDecoration(
//                 border: Border(bottom: BorderSide(color: tgDarkPrimaryColor))),
//             child: Text(
//               "Amenities",
//               style: TextStyle(
//                 fontSize: 19,
//                 // fontWeight: FontWeight.bold,
//                 // color: tgPrimaryColor,
//               ),
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
//               onPressed: () => _showAllAmenitiesDialog(
//                   context, servidedata.BusinessData!.amenities!),
//               child: const Text(
//                 'More ...',
//                 style: TextStyle(
//                   color: tgDarkPrimaryColor,
//                   // fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/providers/business_profile_provider.dart';
// import 'package:sssv1/providers/service_provider.dart';
// import 'package:sssv1/utils/constants.dart';

// class AmenitiesGridView extends StatefulWidget {
//   const AmenitiesGridView({super.key});

//   @override
//   _AmenitiesGridViewState createState() => _AmenitiesGridViewState();
// }

// class _AmenitiesGridViewState extends State<AmenitiesGridView> {
//   void _showAllAmenitiesDialog(BuildContext context, List<String> amenities) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           title: const Text(
//             'All Amenities',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: tgPrimaryColor,
//             ),
//           ),
//           content: SizedBox(
//             width: double.maxFinite,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: amenities.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   leading: const Icon(
//                     Icons.check_circle,
//                     color: tgPrimaryColor,
//                     size: 20,
//                   ),
//                   title: Text(
//                     amenities[index],
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text(
//                 'Close',
//                 style: TextStyle(
//                   color: tgPrimaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     var servidedata = Provider.of<ServicesProvider>(context);
//     int initialAmenitiesCount = 6;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//           child: Text(
//             "Amenities",
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: tgPrimaryColor,
//             ),
//           ),
//         ),
//         servidedata.BusinessData!.amenities!.isNotEmpty
//             ? Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: servidedata.BusinessData!.amenities!.length > initialAmenitiesCount
//                       ? initialAmenitiesCount
//                       : servidedata.BusinessData!.amenities!.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemBuilder: (BuildContext context, int index) {
//                     return Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 3,
//                       shadowColor: tgPrimaryColor.withOpacity(0.2),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.check_circle,
//                               color: tgPrimaryColor,
//                               size: 30,
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               servidedata.BusinessData!.amenities![index],
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
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
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () => _showAllAmenitiesDialog(context, servidedata.BusinessData!.amenities!),
//                 child: const Text(
//                   'More ...',
//                   style: TextStyle(
//                     color: tgPrimaryColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/providers/business_profile_provider.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/utils/constants.dart';

class AmenitiesGridView extends StatefulWidget {
  const AmenitiesGridView({super.key});

  @override
  _AmenitiesGridViewState createState() => _AmenitiesGridViewState();
}

class _AmenitiesGridViewState extends State<AmenitiesGridView> {
  void _showAllAmenitiesDialog(BuildContext context, List<String> amenities) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'All Amenities',
            style: TextStyle(
              fontSize: 20,
              color: tgDarkPrimaryColor,
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
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
                      fontSize: 14.4,
                      color: Colors.black87,
                    ),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(
                  color: tgPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
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
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "No amenities available",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: tgDarkPrimaryColor))),
            child: Text(
              "Amenities",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ),
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
              onPressed: () => _showAllAmenitiesDialog(
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

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:sssv1/models/service_models.dart';
// import 'package:sssv1/providers/service_provider.dart';

// class BusinessStatus extends StatefulWidget {
//   @override
//   _BusinessStatusState createState() => _BusinessStatusState();
// }

// class _BusinessStatusState extends State<BusinessStatus> {

//   final Map<String, Map<String, dynamic>> operatingHours = {
//     "Friday": {"close": null, "closed": true, "open": null, "open24": false},
//     "Monday": {
//       "close": "11:59 PM",
//       "closed": false,
//       "open": "12:00 AM",
//       "open24": true
//     },
//     "Thursday": {"close": null, "closed": true, "open": null, "open24": false},
//     "Tuesday": {
//       "close": "11:59 PM",
//       "closed": false,
//       "open": "12:00 AM",
//       "open24": false
//     },
//     "Wednesday": {"close": null, "closed": true, "open": null, "open24": false}
//   };
//   // @override
//   // void initState() {
//   //   var servicesData = Provider.of<ServicesProvider>(context, listen: false);
//   //   final List<OpeningHour>? operatingHours = servicesData.BusinessData!.openingHours;
//   // }

//   bool isBusinessOpen() {
//     String today = DateFormat('EEEE').format(DateTime.now());
//     Map<String, dynamic> todayHours = operatingHours[today]!;

//     if (todayHours["closed"] == true) return false;
//     if (todayHours["open24"] == true) return true;

//     DateTime now = DateTime.now();
//     DateFormat format = DateFormat("hh:mm a");
//     DateTime openTime = format.parse(todayHours["open"]);
//     DateTime closeTime = format.parse(todayHours["close"]);

//     openTime = DateTime(now.year, now.month, now.day, openTime.hour, openTime.minute);
//     closeTime = DateTime(now.year, now.month, now.day, closeTime.hour, closeTime.minute);

//     return now.isAfter(openTime) && now.isBefore(closeTime);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var servicesData = Provider.of<ServicesProvider>(context);
//     final data = servicesData.BusinessData!.operatingHours;
//     bool isOpen = isBusinessOpen();
//     return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           SizedBox(width: 5),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 color: isOpen ? Colors.green[100] : Colors.red[100],
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   // BoxShadow(
//                   //   color: Colors.grey.withOpacity(0.5),
//                   //   spreadRadius: 5,
//                   //   blurRadius: 7,
//                   //   offset: Offset(0, 3),
//                   // ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     isOpen ? Icons.check_circle_outline : Icons.highlight_off,
//                     // size: 100,
//                     color: isOpen ? Colors.green : Colors.red,
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     isOpen ? "We are Open!" : "Sorry, we are Closed",
//                     style: TextStyle(
//                       // fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: isOpen ? Colors.green : Colors.red,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(width: 20),
//           Expanded(
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => OperatingHoursScreen(operatingHours: operatingHours)),
//                 );
//               },
//               child: Text("View All Operating Hours", style: TextStyle(fontSize: 12)),
//             ),
//           ),
//           SizedBox(width: 5),
//         ],
//       );
//   }
// }

// class OperatingHoursScreen extends StatelessWidget {
//   final Map<String, Map<String, dynamic>> operatingHours;

//   OperatingHoursScreen({required this.operatingHours});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Operating Hours"),
//       ),
//       body: ListView(
//         children: operatingHours.keys.map((day) {
//           Map<String, dynamic> hours = operatingHours[day]!;
//           return ListTile(
//             title: Text(day),
//             subtitle: Text(hours["closed"]
//                 ? "Closed"
//                 : hours["open24"]
//                     ? "Open 24 hours"
//                     : "${hours["open"]} - ${hours["close"]}"),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/service_models.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/utils/constants.dart';

class BusinessStatus extends StatefulWidget {
  const BusinessStatus({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BusinessStatusState createState() => _BusinessStatusState();
}

class _BusinessStatusState extends State<BusinessStatus> {
  bool isBusinessOpen(Map<String, Map<String, dynamic>> operatingHours) {
    String today = DateFormat('EEEE').format(DateTime.now());
    Map<String, dynamic>? todayHours = operatingHours[today];

    if (todayHours == null) return false;
    if (todayHours["closed"] == true) return false;
    if (todayHours["open24"] == true) return true;

    DateTime now = DateTime.now();
    DateFormat format = DateFormat("hh:mm a");
    DateTime openTime = format.parse(todayHours["open"]);
    DateTime closeTime = format.parse(todayHours["close"]);

    openTime =
        DateTime(now.year, now.month, now.day, openTime.hour, openTime.minute);
    closeTime = DateTime(
        now.year, now.month, now.day, closeTime.hour, closeTime.minute);

    return now.isAfter(openTime) && now.isBefore(closeTime);
  }

  @override
  Widget build(BuildContext context) {
    var servicesData = Provider.of<ServicesProvider>(context);
    if (servicesData.BusinessData == null ||
        servicesData.BusinessData!.operatingHours == null) {
      return Center(child: CircularProgressIndicator());
    }
    final data = servicesData.BusinessData!.operatingHours!.toMap();
    bool isOpen = isBusinessOpen(data);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 5),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isOpen ? Colors.green[100] : Colors.red[100],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                // BoxShadow(
                //   color: Colors.grey.withOpacity(0.5),
                //   spreadRadius: 5,
                //   blurRadius: 7,
                //   offset: Offset(0, 3),
                // ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isOpen ? Icons.check_circle_outline : Icons.highlight_off,
                  // size: 100,
                  color: isOpen ? Colors.green : Colors.red,
                ),
                SizedBox(width: 10),
                Text(
                  isOpen ? "We are Open!" : "Sorry, we are Closed today",
                  style: TextStyle(
                    // fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isOpen ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OperatingHoursScreen(operatingHours: data)),
              );
            },
            child: Text("View All Operating Hours",
                style: TextStyle(fontSize: 12)),
          ),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}

// class OperatingHoursScreen extends StatelessWidget {
//   final Map<String, Map<String, dynamic>> operatingHours;

//   OperatingHoursScreen({required this.operatingHours});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: tgPrimaryColor,
//         elevation: 8,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(Icons.keyboard_arrow_left_rounded),
//         ),
//         title: Text(
//           "Operating Hours",
//           style: TextStyle(
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: operatingHours.keys.map((day) {
//           Map<String, dynamic> hours = operatingHours[day]!;
//           return ListTile(
//             title: Text(day),
//             subtitle: Text(hours["closed"]
//                 ? "Closed"
//                 : hours["open24"]
//                     ? "Open 24 hours"
//                     : "${hours["open"]} - ${hours["close"]}"),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

class OperatingHoursScreen extends StatelessWidget {
  final Map<String, Map<String, dynamic>> operatingHours;

  const OperatingHoursScreen({Key? key, required this.operatingHours})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tgPrimaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
          ),
        ),
        title: const Text(
          "Operating Hours",
          style: TextStyle(fontSize: 17.3),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: operatingHours.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          String day = operatingHours.keys.elementAt(index);
          Map<String, dynamic> hours = operatingHours[day]!;
          return _buildDayTile(day, hours);
        },
      ),
    );
  }

  Widget _buildDayTile(String day, Map<String, dynamic> hours) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              day,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              _getHoursString(hours),
              style: TextStyle(
                fontSize: 14.5,
                color: hours["closed"]
                    ? const Color.fromARGB(255, 181, 23, 12)
                    : Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getHoursString(Map<String, dynamic> hours) {
    if (hours["closed"]) return "Closed";
    if (hours["open24"]) return "Open 24 hours";
    return "${hours["open"]} - ${hours["close"]}";
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/service_models.dart';
import 'package:sssv1/providers/service_provider.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:sssv1/utils/navigator.dart';

class BusinessStatusTest extends StatefulWidget {
  const BusinessStatusTest({super.key});

  @override
  _BusinessStatusTestState createState() => _BusinessStatusTestState();
}

class _BusinessStatusTestState extends State<BusinessStatusTest> {
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
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Lottie.asset("images/EmptyState.json", height: 100),
              Text(
                "no data available",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      );
    }
    final data = servicesData.BusinessData!.operatingHours!.toMap();
    bool isOpen = isBusinessOpen(data);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            navigatorPush(
              context,
              OperatingHoursScreen(operatingHours: data),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              // boxShadow: ,
              borderRadius: BorderRadius.circular(15.0),
              color: isOpen ? Colors.green[50] : Colors.red[50],
            ),
            // width: MediaQuery.of(context).size.width * 0.9,

            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(15.0),
            // ),
            // color: isOpen ? Colors.green[50] : Colors.red[50],
            // elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Icon(
                    isOpen ? Icons.check_circle_outline : Icons.highlight_off,
                    color: isOpen ? Colors.green : Colors.red,
                    size: 22,
                  ),
                  SizedBox(width: 10),
                  Text(
                    isOpen ? "We are Open!" : "Sorry, we are Closed",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isOpen ? Colors.green : Colors.red,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: isOpen ? Colors.green : Colors.red,
                    size: 13,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     // primary: tgPrimaryColor,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) =>
        //             OperatingHoursScreen(operatingHours: data),
        //       ),
        //     );
        //   },
        //   child: Text(
        //     "View All Operating Hours",
        //     style: TextStyle(fontSize: 16),
        //   ),
        // ),
      ],
    );
  }
}

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

import 'package:flutter/material.dart';
import 'package:sssv1/models/business_profile.dart';
import 'package:sssv1/providers/allbusinesses.dart';
import 'package:sssv1/screens/defaultprofile.dart';
import 'package:sssv1/utils/constants.dart';
import "package:provider/provider.dart";
import 'package:sssv1/utils/navigator.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late List<Businessprofile>? filteredBusinesses;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    print("init");
    var data = Provider.of<AllBusinessListProvider>(context, listen: false);
    data.allBusinessListProvider();
    filteredBusinesses = [];
  }

  void filterBusinesses(String query) {
    var data = Provider.of<AllBusinessListProvider>(context, listen: false);
    filteredBusinesses = data.allBusinessListData!
        .where((business) =>
            business.businessName.toLowerCase().contains(query.toLowerCase()) ||
            // business.subCategory.toLowerCase().contains(subcatogery.toLowerCase()))
            business.businessUid.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AllBusinessListProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Form(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: secondaryColor10LightTheme
                          // border: Border.all(
                          //   color: Colors.grey,
                          //   width: 1,
                          // ),
                          ),
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: (value) {
                          filterBusinesses(value);
                          print("value $value");
                        },
                        textInputAction: TextInputAction.search,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "eg. food",
                            prefixIcon: Icon(Icons.business_sharp)),
                      ),
                    ))),
            Expanded(
                child: ListView.builder(
                    itemCount: filteredBusinesses?.length,
                    itemBuilder: (BuildContext context, int int) {
                      final business = filteredBusinesses![int];
                      // print("business ${business.businessUid}");
                      return GestureDetector(
                        onTap: () {
                          print("business ${business.businessName}");
                          Navigators().navigatorPush(
                              context,
                              DefaultProfile(
                                uid: business.businessUid,
                              ));
                        },
                        child: ListTile(
                          title: Text(business.businessName),
                          subtitle: Text(business.subCategory),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

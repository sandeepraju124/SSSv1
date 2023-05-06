import "package:flutter/material.dart";
import "package:sssv1/providers/sub_category_provider.dart";
import "package:provider/provider.dart";


class testing extends StatefulWidget {
  const testing({super.key});

  @override
  State<testing> createState() => _testingState();
}

class _testingState extends State<testing> {
  @override
  Widget build(BuildContext context) {
   
    var searchlist = Provider.of<SubcategoryProvider>(context );
     String? name = searchlist.subcategoryData?.subcategories[3];
    searchlist.subCategoryProvider("retail");
    // SubcategoryProvider().subCategoryProvider("retail");
    return Scaffold(
      body: searchlist.subcategoryData != null ? Center(child: Text(name.toString())
      ) : Center(child: Text("nodata")),
    );
  }
}
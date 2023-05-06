import "package:flutter/material.dart";
import "package:sssv1/providers/sub_category_provider.dart";
import "package:provider/provider.dart";


class testing2 extends StatefulWidget {
  const testing2({super.key});

  @override
  State<testing2> createState() => _testing2State();
}

class _testing2State extends State<testing2> {
  @override
  Widget build(BuildContext context) {
   
    var searchlist = Provider.of<SubcategoryProvider>(context);
     String? name = searchlist.subcategoryData?.subcategories[1];
    // searchlist.subCategoryProvider("retail");
    // SubcategoryProvider().subCategoryProvider("retail");
    return Scaffold(
      body: Center(child: Text(name.toString())),
    );
  }
}
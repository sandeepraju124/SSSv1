// // To parse this JSON data, do
// //
// //     final businesscategoriesmodel = businesscategoriesmodelFromJson(jsonString);

// import 'dart:convert';

// List<Businesscategoriesmodel> businesscategoriesmodelFromJson(String str) =>
//     List<Businesscategoriesmodel>.from(
//         json.decode(str).map((x) => Businesscategoriesmodel.fromJson(x)));

// String businesscategoriesmodelToJson(List<Businesscategoriesmodel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Businesscategoriesmodel {
//   List<String> beautySpas;
//   List<String> education;
//   List<String> homeServices;
//   List<String> nightlife;
//   String id;

//   Businesscategoriesmodel({
//     required this.beautySpas,
//     required this.education,
//     required this.homeServices,
//     required this.nightlife,
//     required this.id,
//   });

//   factory Businesscategoriesmodel.fromJson(Map<String, dynamic> json) =>
//       Businesscategoriesmodel(
//         beautySpas: List<String>.from(json["Beauty & Spas"].map((x) => x)),
//         education: List<String>.from(json["Education"].map((x) => x)),
//         homeServices: List<String>.from(json["Home Services"].map((x) => x)),
//         nightlife: List<String>.from(json["Nightlife"].map((x) => x)),
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Beauty & Spas": List<dynamic>.from(beautySpas.map((x) => x)),
//         "Education": List<dynamic>.from(education.map((x) => x)),
//         "Home Services": List<dynamic>.from(homeServices.map((x) => x)),
//         "Nightlife": List<dynamic>.from(nightlife.map((x) => x)),
//         "_id": id,
//       };
// }

import 'dart:convert';

class Businesscategoriesmodel {
  final Map<String, List<String>> categories;
  final String id;

  Businesscategoriesmodel({required this.categories, required this.id});

  factory Businesscategoriesmodel.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      Map<String, List<String>> categoriesMap = {};
      json[0].forEach((key, value) {
        if (key != "_id") {
          categoriesMap[key] = List<String>.from(value);
        }
      });

      return Businesscategoriesmodel(
        categories: categoriesMap,
        id: json[0]["_id"],
      );
    } else {
      throw Exception('No data found');
    }
  }

  Map<String, dynamic> toJson() => {
        ...categories,
        "_id": id,
      };
}

Businesscategoriesmodel businesscategoriesmodelFromJson(String str) =>
    Businesscategoriesmodel.fromJson(json.decode(str));

String businesscategoriesmodelToJson(Businesscategoriesmodel data) =>
    json.encode(data.toJson());

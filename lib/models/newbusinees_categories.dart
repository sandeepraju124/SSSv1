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

// class Businesscategoriesmodel {
//   final Map<String, List<String>> categories;
//   final String id;

//   Businesscategoriesmodel({required this.categories, required this.id});

//   factory Businesscategoriesmodel.fromJson(List<dynamic> json) {
//     if (json.isNotEmpty) {
//       Map<String, List<String>> categoriesMap = {};
//       json[0].forEach((key, value) {
//         if (key != "_id") {
//           categoriesMap[key] = List<String>.from(value);
//         }
//       });

//       return Businesscategoriesmodel(
//         categories: categoriesMap,
//         id: json[0]["_id"],
//       );
//     } else {
//       throw Exception('No data found');
//     }
//   }

//   Map<String, dynamic> toJson() => {
//         ...categories,
//         "_id": id,
//       };
// }

// Businesscategoriesmodel businesscategoriesmodelFromJson(String str) =>
//     Businesscategoriesmodel.fromJson(json.decode(str));

// String businesscategoriesmodelToJson(Businesscategoriesmodel data) =>
//     json.encode(data.toJson());

// class BusinessCategories {
//   final String id;
//   final List<Category> beautyAndSpas;
//   final List<Category> education;
//   final List<Category> food;
//   final List<Category> homeServices;
//   final List<Category> nightlife;
//   final List<Category> retail;
//   final List<Category> shopping;

//   BusinessCategories({
//     required this.id,
//     required this.beautyAndSpas,
//     required this.education,
//     required this.food,
//     required this.homeServices,
//     required this.nightlife,
//     required this.retail,
//     required this.shopping,
//   });

//   factory BusinessCategories.fromJson(Map<String, dynamic> json) {
//     return BusinessCategories(
//       id: json['_id'],
//       beautyAndSpas: (json['Beauty & Spas'] as List).map((item) => Category.fromJson(item)).toList(),
//       education: (json['Education'] as List).map((item) => Category.fromJson(item)).toList(),
//       food: (json['Food'] as List).map((item) => Category.fromJson(item)).toList(),
//       homeServices: (json['Home Services'] as List).map((item) => Category.fromJson(item)).toList(),
//       nightlife: (json['Nightlife'] as List).map((item) => Category.fromJson(item)).toList(),
//       retail: (json['Retail'] as List).map((item) => Category.fromJson(item)).toList(),
//       shopping: (json['Shopping'] as List).map((item) => Category.fromJson(item)).toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'Beauty & Spas': beautyAndSpas.map((item) => item.toJson()).toList(),
//       'Education': education.map((item) => item.toJson()).toList(),
//       'Food': food.map((item) => item.toJson()).toList(),
//       'Home Services': homeServices.map((item) => item.toJson()).toList(),
//       'Nightlife': nightlife.map((item) => item.toJson()).toList(),
//       'Retail': retail.map((item) => item.toJson()).toList(),
//       'Shopping': shopping.map((item) => item.toJson()).toList(),
//     };
//   }
// }

// class Category {
//   final int priority;
//   final String subcategory;

//   Category({
//     required this.priority,
//     required this.subcategory,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       priority: json['priority'],
//       subcategory: json['subcategory'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'priority': priority,
//       'subcategory': subcategory,
//     };
//   }
// }

// To parse this JSON data, do
//
//     final businessCategories = businessCategoriesFromJson(jsonString);

List<BusinessCategories> businessCategoriesFromJson(String str) =>
    List<BusinessCategories>.from(
        json.decode(str).map((x) => BusinessCategories.fromJson(x)));

String businessCategoriesToJson(List<BusinessCategories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessCategories {
  List<BeautySpa> beautySpas;
  List<BeautySpa> education;
  List<BeautySpa> food;
  List<BeautySpa> homeServices;
  List<BeautySpa> nightlife;
  List<BeautySpa> retail;
  List<BeautySpa> shopping;
  String id;

  BusinessCategories({
    required this.beautySpas,
    required this.education,
    required this.food,
    required this.homeServices,
    required this.nightlife,
    required this.retail,
    required this.shopping,
    required this.id,
  });

  factory BusinessCategories.fromJson(Map<String, dynamic> json) =>
      BusinessCategories(
        beautySpas: List<BeautySpa>.from(
            json["Beauty & Spas"].map((x) => BeautySpa.fromJson(x))),
        education: List<BeautySpa>.from(
            json["Education"].map((x) => BeautySpa.fromJson(x))),
        food: List<BeautySpa>.from(
            json["Food"].map((x) => BeautySpa.fromJson(x))),
        homeServices: List<BeautySpa>.from(
            json["Home Services"].map((x) => BeautySpa.fromJson(x))),
        nightlife: List<BeautySpa>.from(
            json["Nightlife"].map((x) => BeautySpa.fromJson(x))),
        retail: List<BeautySpa>.from(
            json["Retail"].map((x) => BeautySpa.fromJson(x))),
        shopping: List<BeautySpa>.from(
            json["Shopping"].map((x) => BeautySpa.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "Beauty & Spas": List<dynamic>.from(beautySpas.map((x) => x.toJson())),
        "Education": List<dynamic>.from(education.map((x) => x.toJson())),
        "Food": List<dynamic>.from(food.map((x) => x.toJson())),
        "Home Services":
            List<dynamic>.from(homeServices.map((x) => x.toJson())),
        "Nightlife": List<dynamic>.from(nightlife.map((x) => x.toJson())),
        "Retail": List<dynamic>.from(retail.map((x) => x.toJson())),
        "Shopping": List<dynamic>.from(shopping.map((x) => x.toJson())),
        "_id": id,
      };
}

class BeautySpa {
  int priority;
  String subcategory;

  BeautySpa({
    required this.priority,
    required this.subcategory,
  });

  factory BeautySpa.fromJson(Map<String, dynamic> json) => BeautySpa(
        priority: json["priority"],
        subcategory: json["subcategory"],
      );

  Map<String, dynamic> toJson() => {
        "priority": priority,
        "subcategory": subcategory,
      };
}

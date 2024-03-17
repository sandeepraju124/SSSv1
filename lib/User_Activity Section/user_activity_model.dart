// // To parse this JSON data, do
// //
// //     final userActivityModel = userActivityModelFromJson(jsonString);

// // ignore_for_file: constant_identifier_names

// import 'dart:convert';

// UserActivityModel userActivityModelFromJson(String str) =>
//     UserActivityModel.fromJson(json.decode(str));

// String userActivityModelToJson(UserActivityModel data) =>
//     json.encode(data.toJson());

// class UserActivityModel {
//   List<UserActivityModelAnswer> answers;
//   List<Comment> comments;
//   List<Question> questions;

//   UserActivityModel({
//     required this.answers,
//     required this.comments,
//     required this.questions,
//   });

//   factory UserActivityModel.fromJson(Map<String, dynamic> json) =>
//       UserActivityModel(
//         answers: (json["answers"] as List?)
//                 ?.map((x) => UserActivityModelAnswer.fromJson(x))
//                 .toList() ??
//             [],
//         comments: (json["comments"] as List?)
//                 ?.map((x) => Comment.fromJson(x))
//                 .toList() ??
//             [],
//         questions: (json["questions"] as List?)
//                 ?.map((x) => Question.fromJson(x))
//                 .toList() ??
//             [],
//       );
//   Map<String, dynamic> toJson() => {
//         "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
//         "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
//         "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
//       };
// }

// class UserActivityModelAnswer {
//   Adetails adetails;
//   String? answer;
//   BusinessName businessName;
//   BusinessUid businessUid;

//   UserActivityModelAnswer({
//     required this.adetails,
//     this.answer,
//     required this.businessName,
//     required this.businessUid,
//   });

//   factory UserActivityModelAnswer.fromJson(Map<String, dynamic> json) =>
//       UserActivityModelAnswer(
//         adetails: Adetails.fromJson(json["adetails"]),
//         answer: json["answer"] as String?,
//         businessName: businessNameValues.map[json["business_name"]] ??
//             BusinessName
//                 .unknown, // Replace 'unknown' with a valid default value
//         businessUid: businessUidValues.map[json["business_uid"]] ??
//             BusinessUid.unknown, // Replace 'unknown' with a valid default value
//       );
//   Map<String, dynamic> toJson() => {
//         "adetails": adetails.toJson(),
//         "answer": answer,
//         "business_name": businessNameValues.reverse[businessName],
//         "business_uid": businessUidValues.reverse[businessUid],
//       };
// }

// class Adetails {
//   DateTime createdAt;
//   String? answerid;
//   User? userid;

//   Adetails({
//     required this.createdAt,
//     this.answerid,
//     required this.userid,
//   });

//   factory Adetails.fromJson(Map<String, dynamic> json) => Adetails(
//         createdAt: DateTime.parse(json["created_at"]),
//         answerid: json["answerid"], // Parse this field
//         userid: json["userid"] != null ? userValues.map[json["userid"]] : null,
//       );

//   Map<String, dynamic> toJson() => {
//         "created_at": createdAt.toIso8601String(),
//         "answerid": answerid,
//         "userid": userValues.reverse[userid],
//       };
// }

// enum User {
//   NJ_NA_HK1_FD_JP_JVH_N_SG1_A3_AJFZ5762,
//   THE_0_O5_QK_R4_FRH_R4_UZ3_X_UKD_ZB_TJLSK_I2
// }

// final userValues = EnumValues({
//   "NjNAHk1FdJPJvhNSg1a3AJFZ5762": User.NJ_NA_HK1_FD_JP_JVH_N_SG1_A3_AJFZ5762,
//   "0O5qkR4FrhR4Uz3xUkdZbTjlskI2":
//       User.THE_0_O5_QK_R4_FRH_R4_UZ3_X_UKD_ZB_TJLSK_I2
// });

// enum BusinessName {
//   DESIGNER_CLOTHING_BOUTIQUE,
//   PIZZA_HUT,
//   SUNITHA_NILAYAM,
//   unknown
// }

// final businessNameValues = EnumValues({
//   "Designer Clothing Boutique": BusinessName.DESIGNER_CLOTHING_BOUTIQUE,
//   "Pizza Hut": BusinessName.PIZZA_HUT,
//   "sunitha nilayam": BusinessName.SUNITHA_NILAYAM
// });

// enum BusinessUid {
//   DESRET7283940183475,
//   PIZFOO4357128905678,
//   SPIFOO1653834921137,
//   unknown
// }

// final businessUidValues = EnumValues({
//   "DESRET7283940183475": BusinessUid.DESRET7283940183475,
//   "PIZFOO4357128905678": BusinessUid.PIZFOO4357128905678,
//   "SPIFOO1653834921137": BusinessUid.SPIFOO1653834921137,
// });

// class Comment {
//   String businessName;
//   String businessUid;
//   String comment;
//   DateTime createdAt;
//   int rating;
//   User? userId;
//   String? username;

//   Comment({
//     required this.businessName,
//     required this.businessUid,
//     required this.comment,
//     required this.createdAt,
//     required this.rating,
//     required this.userId,
//     this.username,
//   });

//   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
//         businessName: json["business_name"],
//         businessUid: json["business_uid"],
//         comment: json["comment"],
//         createdAt: DateTime.parse(json["created_at"]),
//         rating: json["rating"],
//         userId:
//             json['user_id'] != null ? userValues.map[json['user_id']] : null,
//         username: json['username'],
//       );

//   Map<String, dynamic> toJson() => {
//         "business_name": businessName,
//         "business_uid": businessUid,
//         "comment": comment,
//         "created_at": createdAt.toIso8601String(),
//         "rating": rating,
//         "user_id": userValues.reverse[userId],
//         "username": username,
//       };
// }

// class Question {
//   List<QuestionAnswer> answers;
//   String businessName;
//   String businessUid;
//   Qdetails qdetails;
//   String question;

//   Question({
//     required this.answers,
//     required this.businessName,
//     required this.businessUid,
//     required this.qdetails,
//     required this.question,
//   });

//   factory Question.fromJson(Map<String, dynamic> json) => Question(
//         answers: List<QuestionAnswer>.from(
//             json["answers"].map((x) => QuestionAnswer.fromJson(x))),
//         businessName: json["business_name"],
//         businessUid: json["business_uid"],
//         qdetails: Qdetails.fromJson(json["qdetails"]),
//         question: json["question"],
//       );

//   Map<String, dynamic> toJson() => {
//         "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
//         "business_name": businessName,
//         "business_uid": businessUid,
//         "qdetails": qdetails.toJson(),
//         "question": question,
//       };
// }

// class QuestionAnswer {
//   Adetails adetails;
//   String? answer;

//   QuestionAnswer({
//     required this.adetails,
//     this.answer,
//   });

//   factory QuestionAnswer.fromJson(Map<String, dynamic> json) => QuestionAnswer(
//         adetails: Adetails.fromJson(json["adetails"]),
//         answer: json["answer"],
//       );

//   Map<String, dynamic> toJson() => {
//         "adetails": adetails.toJson(),
//         "answer": answer,
//       };
// }

// class Qdetails {
//   DateTime createdAt;
//   String questionid;
//   User? userid;
//   DateTime? updatedAt;

//   Qdetails({
//     required this.createdAt,
//     required this.questionid,
//     required this.userid,
//     this.updatedAt,
//   });

//   factory Qdetails.fromJson(Map<String, dynamic> json) => Qdetails(
//         createdAt: DateTime.parse(json["created_at"]),
//         questionid: json["questionid"],
//         userid: json["userid"] != null ? userValues.map[json["userid"]] : null,
//         updatedAt: json["updated_at"] != null
//             ? DateTime.parse(json["updated_at"])
//             : null,
//       );

//   Map<String, dynamic> toJson() => {
//         "created_at": createdAt.toIso8601String(),
//         "questionid": questionid,
//         "userid": userValues.reverse[userid],
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }

// // class EnumValues<T> {
// //   Map<String, T> map;
// //   late Map<T, String> reverseMap;

// //   EnumValues(this.map);

// //   Map<T, String> get reverse {
// //     reverseMap = map.map((k, v) => MapEntry(v, k));
// //     return reverseMap;
// //   }
// // }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map) {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//   }

//   Map<T, String> get reverse => reverseMap;
// }

// // To parse this JSON data, do

// //     final userActivityModel = userActivityModelFromJson(jsonString);

// // import 'dart:convert';

// // UserActivityModel userActivityModelFromJson(String str) =>
// //     UserActivityModel.fromJson(json.decode(str));

// // String userActivityModelToJson(UserActivityModel data) =>
// //     json.encode(data.toJson());

// // class UserActivityModel {
// //   List<UserActivityModelAnswer> answers;
// //   List<Comment> comments;
// //   List<Question> questions;

// //   UserActivityModel({
// //     required this.answers,
// //     required this.comments,
// //     required this.questions,
// //   });

// //   factory UserActivityModel.fromJson(Map<String, dynamic> json) {
// //     print('Parsing UserActivityModel from JSON: $json');
// //     return UserActivityModel(
// //       answers: List<UserActivityModelAnswer>.from(
// //           json["answers"].map((x) => UserActivityModelAnswer.fromJson(x))),
// //       comments:
// //           List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
// //       questions: List<Question>.from(
// //           json["questions"].map((x) => Question.fromJson(x))),
// //     );
// //   }

// //   Map<String, dynamic> toJson() => {
// //         "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
// //         "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
// //         "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
// //       };
// // }

// // class UserActivityModelAnswer {
// //   Details adetails;
// //   String answer;
// //   BusinessName businessName;
// //   BusinessUid businessUid;

// //   UserActivityModelAnswer({
// //     required this.adetails,
// //     required this.answer,
// //     required this.businessName,
// //     required this.businessUid,
// //   });

// //   factory UserActivityModelAnswer.fromJson(Map<String, dynamic> json) =>
// //       UserActivityModelAnswer(
// //         adetails: Details.fromJson(json["adetails"]),
// //         answer: json["answer"],
// //         businessName: businessNameValues.map[json["business_name"]]!,
// //         businessUid: businessUidValues.map[json["business_uid"]]!,
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "adetails": adetails.toJson(),
// //         "answer": answer,
// //         "business_name": businessNameValues.reverse[businessName],
// //         "business_uid": businessUidValues.reverse[businessUid],
// //       };
// // }

// // class Details {
// //   String? answerid;
// //   DateTime createdAt;
// //   User? userid; // Make this field nullable
// //   DateTime? updatedAt;
// //   String? questionid;

// //   Details({
// //     this.answerid,
// //     required this.createdAt,
// //     this.userid, // Now this can be null
// //     this.updatedAt,
// //     this.questionid,
// //   });

// //   factory Details.fromJson(Map<String, dynamic> json) => Details(
// //         answerid: json["answerid"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         userid: json["userid"] != null
// //             ? userValues.map[json["userid"]]
// //             : null, // This is now correct
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         questionid: json["questionid"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "answerid": answerid,
// //         "created_at": createdAt.toIso8601String(),
// //         "userid": userid != null
// //             ? userValues.reverse[userid]
// //             : null, // Handle null userid
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "questionid": questionid,
// //       };
// // }

// // enum User { sn1TgI5CCtafjInyeP2oqLy7KkC3 }

// // final userValues = EnumValues(
// //     {"sn1TGI5CCtafjInyeP2oqLy7KkC3": User.sn1TgI5CCtafjInyeP2oqLy7KkC3});

// // enum BusinessName { nexusMall, pizzaHut, sweetCravingsBakery }

// // final businessNameValues = EnumValues({
// //   "Nexus Mall": BusinessName.nexusMall,
// //   "Pizza Hut": BusinessName.pizzaHut,
// //   "Sweet Cravings Bakery": BusinessName.sweetCravingsBakery
// // });

// // enum BusinessUid {
// //   nex1O16051534921137,
// //   pizFoo4357128905678,
// //   sweFoo1659634920974
// // }

// // final businessUidValues = EnumValues({
// //   "NEX1O16051534921137": BusinessUid.nex1O16051534921137,
// //   "PIZFOO4357128905678": BusinessUid.pizFoo4357128905678,
// //   "SWEFOO1659634920974": BusinessUid.sweFoo1659634920974
// // });

// // class Comment {
// //   BusinessName businessName;
// //   BusinessUid businessUid;
// //   String comment;
// //   DateTime createdAt;
// //   int rating;
// //   String? reviewId;
// //   DateTime? updatedAt;
// //   User userId;
// //   Username username;

// //   Comment({
// //     required this.businessName,
// //     required this.businessUid,
// //     required this.comment,
// //     required this.createdAt,
// //     required this.rating,
// //     this.reviewId,
// //     this.updatedAt,
// //     required this.userId,
// //     required this.username,
// //   });

// //   // factory Comment.fromJson(Map<String, dynamic> json) => Comment(
// //   //       businessName: businessNameValues.map[json["business_name"]]!,
// //   //       businessUid: businessUidValues.map[json["business_uid"]]!,
// //   //       comment: json["comment"],
// //   //       createdAt: DateTime.parse(json["created_at"]),
// //   //       rating: json["rating"],
// //   //       reviewId: json["review_id"],
// //   //       updatedAt: json["updated_at"] == null
// //   //           ? null
// //   //           : DateTime.parse(json["updated_at"]),
// //   //       userId: userValues.map[json["user_id"]]!,
// //   //       username: usernameValues.map[json["username"]]!,
// //   //     );

// //   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
// //         businessName: businessNameValues.map[json["business_name"]]!,
// //         businessUid: businessUidValues.map[json["business_uid"]]!,
// //         comment: json["comment"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         rating: json["rating"],
// //         reviewId: json["review_id"],
// //         updatedAt: json["updated_at"] == null
// //             ? null
// //             : DateTime.parse(json["updated_at"]),
// //         userId: json["user_id"] != null
// //             ? userValues.map[json["user_id"]]!
// //             : throw ArgumentError("userId cannot be null"),
// //         username: usernameValues.map[json["username"]]!,
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "business_name": businessNameValues.reverse[businessName],
// //         "business_uid": businessUidValues.reverse[businessUid],
// //         "comment": comment,
// //         "created_at": createdAt.toIso8601String(),
// //         "rating": rating,
// //         "review_id": reviewId,
// //         "updated_at": updatedAt?.toIso8601String(),
// //         "user_id": userValues.reverse[userId],
// //         "username": usernameValues.reverse[username],
// //       };
// // }

// // enum Username { baada }

// // final usernameValues = EnumValues({"baada ": Username.baada});

// // class Question {
// //   List<QuestionAnswer> answers;
// //   BusinessName businessName;
// //   BusinessUid businessUid;
// //   Details qdetails;
// //   String question;

// //   Question({
// //     required this.answers,
// //     required this.businessName,
// //     required this.businessUid,
// //     required this.qdetails,
// //     required this.question,
// //   });

// //   factory Question.fromJson(Map<String, dynamic> json) => Question(
// //         answers: List<QuestionAnswer>.from(
// //             json["answers"].map((x) => QuestionAnswer.fromJson(x))),
// //         businessName: businessNameValues.map[json["business_name"]]!,
// //         businessUid: businessUidValues.map[json["business_uid"]]!,
// //         qdetails: Details.fromJson(json["qdetails"]),
// //         question: json["question"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
// //         "business_name": businessNameValues.reverse[businessName],
// //         "business_uid": businessUidValues.reverse[businessUid],
// //         "qdetails": qdetails.toJson(),
// //         "question": question,
// //       };
// // }

// // class QuestionAnswer {
// //   Details adetails;
// //   String answer;

// //   QuestionAnswer({
// //     required this.adetails,
// //     required this.answer,
// //   });

// //   factory QuestionAnswer.fromJson(Map<String, dynamic> json) => QuestionAnswer(
// //         adetails: Details.fromJson(json["adetails"]),
// //         answer: json["answer"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "adetails": adetails.toJson(),
// //         "answer": answer,
// //       };
// // }

// // // class EnumValues<T> {
// // //   Map<String, T> map;
// // //   late Map<T, String> reverseMap;

// // //   EnumValues(this.map);

// // //   Map<T, String> get reverse {
// // //     reverseMap = map.map((k, v) => MapEntry(v, k));
// // //     return reverseMap;
// // //   }

// // class EnumValues<T> {
// //   Map<String, T> map;
// //   Map<T, String> reverseMap;

// //   EnumValues(this.map) : reverseMap = map.map((k, v) => MapEntry(v, k));

// //   Map<T, String> get reverse => reverseMap;
// // }

// To parse this JSON data, do
//
//     final userActivityModel = userActivityModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

UserActivityModel userActivityModelFromJson(String str) =>
    UserActivityModel.fromJson(json.decode(str));

String userActivityModelToJson(UserActivityModel data) =>
    json.encode(data.toJson());

class UserActivityModel {
  List<UserActivityModelAnswer> answers;
  List<Comment> comments;
  List<Question> questions;

  UserActivityModel({
    required this.answers,
    required this.comments,
    required this.questions,
  });

  factory UserActivityModel.fromJson(Map<String, dynamic> json) =>
      UserActivityModel(
        answers: List<UserActivityModelAnswer>.from(
            json["answers"].map((x) => UserActivityModelAnswer.fromJson(x))),
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class UserActivityModelAnswer {
  Adetails adetails;
  String answer;
  String businessName;
  String businessUid;

  UserActivityModelAnswer({
    required this.adetails,
    required this.answer,
    required this.businessName,
    required this.businessUid,
  });

  // factory UserActivityModelAnswer.fromJson(Map<String, dynamic> json) =>
  //     UserActivityModelAnswer(
  //       adetails: Adetails.fromJson(json["adetails"]),
  //       answer: json["answer"],
  //       businessName: json["business_name"],
  //       businessUid: json["business_uid"],
  //     );

  factory UserActivityModelAnswer.fromJson(Map<String, dynamic> json) =>
      UserActivityModelAnswer(
        adetails: Adetails.fromJson(json["adetails"]),
        answer: json["answer"] ?? "", // provide a default value if null
        businessName:
            json["business_name"] ?? "", // provide a default value if null
        businessUid:
            json["business_uid"] ?? "", // provide a default value if null
      );

  Map<String, dynamic> toJson() => {
        "adetails": adetails.toJson(),
        "answer": answer,
        "business_name": businessName,
        "business_uid": businessUid,
      };
}

class Adetails {
  String answerid;
  DateTime createdAt;
  User userid;
  List<DateTime>? updatedAt;

  Adetails({
    required this.answerid,
    required this.createdAt,
    required this.userid,
    this.updatedAt,
  });

  factory Adetails.fromJson(Map<String, dynamic> json) => Adetails(
        answerid: json["answerid"],
        createdAt: DateTime.parse(json["created_at"]),
        userid:
            json["userid"] != null && userValues.map.containsKey(json["userid"])
                ? userValues.map[json["userid"]]!
                : User.unknown,
// Provide a default value if user id is null

        updatedAt: json["updated_at"] == null
            ? null
            : (json["updated_at"] is List<dynamic>
                ? List<DateTime>.from(
                    json["updated_at"].map((x) => DateTime.parse(x)))
                : null),
      );

  Map<String, dynamic> toJson() => {
        "answerid": answerid,
        "created_at": createdAt.toIso8601String(),
        "userid": userValues.reverse[userid],
        "updated_at": updatedAt == null
            ? []
            : List<dynamic>.from(updatedAt!.map((x) => x.toIso8601String())),
      };
}

enum User { S4_V_SYG3_CIN_RWJO6_V9_NR_J08_R_ZD8_W1, unknown }

final userValues = EnumValues({
  "S4vSYG3CinRwjo6V9NrJ08rZD8w1": User.S4_V_SYG3_CIN_RWJO6_V9_NR_J08_R_ZD8_W1
});

enum BusinessName {
  DESIGNER_CLOTHING_BOUTIQUE,
  PIZZA_HUT,
  SUNITHA_NILAYAM,
  unknown
}

final businessNameValues = EnumValues({
  "Designer Clothing Boutique": BusinessName.DESIGNER_CLOTHING_BOUTIQUE,
  "Pizza Hut": BusinessName.PIZZA_HUT,
  "sunitha nilayam": BusinessName.SUNITHA_NILAYAM
});

enum BusinessUid {
  DESRET7283940183475,
  PIZFOO4357128905678,
  SPIFOO1653834921137,
  unknown
}

final businessUidValues = EnumValues({
  "DESRET7283940183475": BusinessUid.DESRET7283940183475,
  "PIZFOO4357128905678": BusinessUid.PIZFOO4357128905678,
  "SPIFOO1653834921137": BusinessUid.SPIFOO1653834921137,
});

class Comment {
  String businessName;
  String businessUid;
  String comment;
  DateTime createdAt;
  int rating;
  String reviewId;
  DateTime? updatedAt;
  User userId;
  String username;

  Comment({
    required this.businessName,
    required this.businessUid,
    required this.comment,
    required this.createdAt,
    required this.rating,
    required this.reviewId,
    this.updatedAt,
    required this.userId,
    required this.username,
  });

  // factory Comment.fromJson(Map<String, dynamic> json) => Comment(
  //       businessName: json["business_name"],
  //       businessUid: json["business_uid"],
  //       comment: json["comment"],
  //       createdAt: DateTime.parse(json["created_at"]),
  //       rating: json["rating"],
  //       reviewId: json["review_id"],
  //       updatedAt: json["updated_at"] == null
  //           ? null
  //           : DateTime.parse(json["updated_at"]),
  //       userId: userValues.map[json["user_id"]]!,
  //       username: json["username"],
  //     );

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        businessName:
            json["business_name"] ?? "", // provide a default value if null
        businessUid:
            json["business_uid"] ?? "", // provide a default value if null
        comment: json["comment"] ?? "", // provide a default value if null
        createdAt: DateTime.parse(json["created_at"]),
        rating: json["rating"] ?? 0, // provide a default value if null
        reviewId: json["review_id"] ?? "", // provide a default value if null
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userId: userValues.map[json["user_id"]] ??
            User.unknown, // provide a default value if null
        username: json["username"] ?? "", // provide a default value if null
      );

  Map<String, dynamic> toJson() => {
        "business_name": businessName,
        "business_uid": businessUid,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "rating": rating,
        "review_id": reviewId,
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userValues.reverse[userId],
        "username": username,
      };
}

class Question {
  List<QuestionAnswer> answers;
  String businessName;
  String businessUid;
  Qdetails qdetails;
  String question;

  Question({
    required this.answers,
    required this.businessName,
    required this.businessUid,
    required this.qdetails,
    required this.question,
  });

  // factory Question.fromJson(Map<String, dynamic> json) => Question(
  //       answers: List<QuestionAnswer>.from(
  //           json["answers"].map((x) => QuestionAnswer.fromJson(x))),
  //       businessName: json["business_name"],
  //       businessUid: json["business_uid"],
  //       qdetails: Qdetails.fromJson(json["qdetails"]),
  //       question: json["question"],
  //     );

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        answers: List<QuestionAnswer>.from(
            (json["answers"] ?? []).map((x) => QuestionAnswer.fromJson(x))),
        businessName:
            json["business_name"] ?? "", // provide a default value if null
        businessUid:
            json["business_uid"] ?? "", // provide a default value if null
        qdetails: Qdetails.fromJson(
            json["qdetails"] ?? {}), // provide a default value if null
        question: json["question"] ?? "", // provide a default value if null
      );

  Map<String, dynamic> toJson() => {
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "business_name": businessName,
        "business_uid": businessUid,
        "qdetails": qdetails.toJson(),
        "question": question,
      };
}

class QuestionAnswer {
  Adetails adetails;
  String answer;

  QuestionAnswer({
    required this.adetails,
    required this.answer,
  });

  factory QuestionAnswer.fromJson(Map<String, dynamic> json) => QuestionAnswer(
        adetails: Adetails.fromJson(json["adetails"] ?? {}),
        answer: json["answer"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "adetails": adetails.toJson(),
        "answer": answer,
      };
}

class Qdetails {
  DateTime createdAt;
  String questionid;
  DateTime? updatedAt;
  User userid;

  Qdetails({
    required this.createdAt,
    required this.questionid,
    this.updatedAt,
    required this.userid,
  });

  // factory Qdetails.fromJson(Map<String, dynamic> json) => Qdetails(
  //       createdAt: DateTime.parse(json["created_at"]),
  //       questionid: json["questionid"],
  //       updatedAt: json["updated_at"] == null
  //           ? null
  //           : DateTime.parse(json["updated_at"]),
  //       userid: userValues.map[json["userid"]]!,
  //     );

  factory Qdetails.fromJson(Map<String, dynamic> json) => Qdetails(
        createdAt: DateTime.parse(json["created_at"]),
        questionid: json["questionid"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        userid: json["userid"] != null
            ? userValues.map[json["userid"]] ?? User.unknown
            : User.unknown,
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "questionid": questionid,
        "updated_at": updatedAt?.toIso8601String(),
        "userid": userValues.reverse[userid],
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

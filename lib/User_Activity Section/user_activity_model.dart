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
        answers: (json["answers"] as List?)
                ?.map((x) => UserActivityModelAnswer.fromJson(x))
                .toList() ??
            [],
        comments: (json["comments"] as List?)
                ?.map((x) => Comment.fromJson(x))
                .toList() ??
            [],
        questions: (json["questions"] as List?)
                ?.map((x) => Question.fromJson(x))
                .toList() ??
            [],
      );
  Map<String, dynamic> toJson() => {
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class UserActivityModelAnswer {
  Adetails adetails;
  String? answer;
  BusinessName businessName;
  BusinessUid businessUid;

  UserActivityModelAnswer({
    required this.adetails,
    this.answer,
    required this.businessName,
    required this.businessUid,
  });

  factory UserActivityModelAnswer.fromJson(Map<String, dynamic> json) =>
      UserActivityModelAnswer(
        adetails: Adetails.fromJson(json["adetails"]),
        answer: json["answer"],
        businessName: businessNameValues.map[json["business_name"]] ??
            BusinessName
                .unknown, // Replace 'unknown' with a valid default value
        businessUid: businessUidValues.map[json["business_uid"]] ??
            BusinessUid.unknown, // Replace 'unknown' with a valid default value
      );
  Map<String, dynamic> toJson() => {
        "adetails": adetails.toJson(),
        "answer": answer,
        "business_name": businessNameValues.reverse[businessName],
        "business_uid": businessUidValues.reverse[businessUid],
      };
}

class Adetails {
  DateTime createdAt;
  User? userid;

  Adetails({
    required this.createdAt,
    required this.userid,
  });

  factory Adetails.fromJson(Map<String, dynamic> json) => Adetails(
        createdAt: DateTime.parse(json["created_at"]),
        // userid: userValues.map[json["userid"]]!,
        userid: json["userid"] != null ? userValues.map[json["userid"]] : null,
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "userid": userValues.reverse[userid],
      };
}

enum User {
  NJ_NA_HK1_FD_JP_JVH_N_SG1_A3_AJFZ5762,
  THE_0_O5_QK_R4_FRH_R4_UZ3_X_UKD_ZB_TJLSK_I2
}

final userValues = EnumValues({
  "NjNAHk1FdJPJvhNSg1a3AJFZ5762": User.NJ_NA_HK1_FD_JP_JVH_N_SG1_A3_AJFZ5762,
  "0O5qkR4FrhR4Uz3xUkdZbTjlskI2":
      User.THE_0_O5_QK_R4_FRH_R4_UZ3_X_UKD_ZB_TJLSK_I2
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
  User? userId;

  Comment({
    required this.businessName,
    required this.businessUid,
    required this.comment,
    required this.createdAt,
    required this.rating,
    required this.userId,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        businessName: json["business_name"],
        businessUid: json["business_uid"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        rating: json["rating"],
        userId:
            json['user_id'] != null ? userValues.map[json['user_id']] : null,
      );

  Map<String, dynamic> toJson() => {
        "business_name": businessName,
        "business_uid": businessUid,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "rating": rating,
        "user_id": userValues.reverse[userId],
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

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        answers: List<QuestionAnswer>.from(
            json["answers"].map((x) => QuestionAnswer.fromJson(x))),
        businessName: json["business_name"],
        businessUid: json["business_uid"],
        qdetails: Qdetails.fromJson(json["qdetails"]),
        question: json["question"],
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
  String? answer;

  QuestionAnswer({
    required this.adetails,
    this.answer,
  });

  factory QuestionAnswer.fromJson(Map<String, dynamic> json) => QuestionAnswer(
        adetails: Adetails.fromJson(json["adetails"]),
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "adetails": adetails.toJson(),
        "answer": answer,
      };
}

class Qdetails {
  DateTime createdAt;
  String questionid;
  User? userid;

  Qdetails({
    required this.createdAt,
    required this.questionid,
    required this.userid,
  });

  factory Qdetails.fromJson(Map<String, dynamic> json) => Qdetails(
        createdAt: DateTime.parse(json["created_at"]),
        questionid: json["questionid"],
        userid: json["userid"] != null ? userValues.map[json["userid"]] : null,
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "questionid": questionid,
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

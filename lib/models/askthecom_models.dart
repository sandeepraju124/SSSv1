// To parse this JSON data, do
//
//     final askTheCommunityModels = askTheCommunityModelsFromJson(jsonString);

import 'dart:convert';

AskTheCommunityModels askTheCommunityModelsFromJson(String str) =>
    AskTheCommunityModels.fromJson(json.decode(str));

String askTheCommunityModelsToJson(AskTheCommunityModels data) =>
    json.encode(data.toJson());

class AskTheCommunityModels {
  String id;
  String businessUid;
  List<Datum> data;

  AskTheCommunityModels({
    required this.id,
    required this.businessUid,
    required this.data,
  });

  factory AskTheCommunityModels.fromJson(Map<String, dynamic> json) =>
      AskTheCommunityModels(
        id: json["_id"],
        businessUid: json["business_uid"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "business_uid": businessUid,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  List<Answer> answers;
  Qdetails qdetails;
  String question;

  Datum({
    required this.answers,
    required this.qdetails,
    required this.question,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        qdetails: Qdetails.fromJson(json["qdetails"]),
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "qdetails": qdetails.toJson(),
        "question": question,
      };
}

class Answer {
  Adetails adetails;
  String answer;

  Answer({
    required this.adetails,
    required this.answer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        adetails: Adetails.fromJson(json["adetails"]),
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "adetails": adetails.toJson(),
        "answer": answer,
      };
}

class Adetails {
  String createdAt;
  String userid;

  Adetails({
    required this.createdAt,
    required this.userid,
  });

  factory Adetails.fromJson(Map<String, dynamic> json) => Adetails(
        createdAt: json["created_at"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "userid": userid,
      };
}

class Qdetails {
  String createdAt;
  String questionid;
  String userid;

  Qdetails({
    required this.createdAt,
    required this.questionid,
    required this.userid,
  });

  factory Qdetails.fromJson(Map<String, dynamic> json) => Qdetails(
        createdAt: json["created_at"],
        questionid: json["questionid"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "questionid": questionid,
        "userid": userid,
      };
}

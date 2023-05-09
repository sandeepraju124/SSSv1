// To parse this JSON data, do
//
//     final askTheCommunityModels = askTheCommunityModelsFromJson(jsonString);

import 'dart:convert';

AskTheCommunityModels askTheCommunityModelsFromJson(String str) => AskTheCommunityModels.fromJson(json.decode(str));

String askTheCommunityModelsToJson(AskTheCommunityModels data) => json.encode(data.toJson());

class AskTheCommunityModels {
    String id;
    String businessUid;
    List<Datum> data;

    AskTheCommunityModels({
        required this.id,
        required this.businessUid,
        required this.data,
    });

    factory AskTheCommunityModels.fromJson(Map<String, dynamic> json) => AskTheCommunityModels(
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
    Author author;
    String question;

    Datum({
        required this.answers,
        required this.author,
        required this.question,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        author: Author.fromJson(json["author"]),
        question: json["question"],
    );

    Map<String, dynamic> toJson() => {
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "author": author.toJson(),
        "question": question,
    };
}

class Answer {
    String answer;
    Author author;

    Answer({
        required this.answer,
        required this.author,
    });

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answer: json["answer"],
        author: Author.fromJson(json["author"]),
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "author": author.toJson(),
    };
}

class Author {
    String avatarUrl;
    DateTime? createdAt;
    String id;
    DateTime? updatedAt;
    String username;

    Author({
        required this.avatarUrl,
        this.createdAt,
        required this.id,
        this.updatedAt,
        required this.username,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        avatarUrl: json["avatar_url"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl,
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
    };
}

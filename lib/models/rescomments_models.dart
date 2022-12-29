// To parse this JSON data, do
//
//     final rescommentonlyone = rescommentonlyoneFromJson(jsonString);

import 'dart:convert';

Rescommentonlyone rescommentonlyoneFromJson(String str) => Rescommentonlyone.fromJson(json.decode(str));

String rescommentonlyoneToJson(Rescommentonlyone data) => json.encode(data.toJson());

class Rescommentonlyone {
    Rescommentonlyone({
       required this.id,
       required this.comments,
       required this.name,
    });

    String id;
    List<Comment> comments;
    String name;

    factory Rescommentonlyone.fromJson(Map<String, dynamic> json) => Rescommentonlyone(
        id: json["_id"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "name": name,
    };
}

class Comment {
    Comment({
       required this.comment,
       required this.firstName,
       required this.id,
       required this.lastName,
       required this.userId,
    });

    String comment;
    String firstName;
    int id;
    String lastName;
    int userId;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comment: json["comment"],
        firstName: json["first_name"],
        id: json["id"],
        lastName: json["last_name"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "comment": comment,
        "first_name": firstName,
        "id": id,
        "last_name": lastName,
        "user_id": userId,
    };
}

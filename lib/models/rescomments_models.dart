// To parse this JSON data, do
//
//     final commentsModel = commentsModelFromJson(jsonString);

import 'dart:convert';

CommentsModel commentsModelFromJson(String str) => CommentsModel.fromJson(json.decode(str));

String commentsModelToJson(CommentsModel data) => json.encode(data.toJson());

class CommentsModel {
    CommentsModel({
        required this.id,
        required this.comments,
        required this.name,
        required this.serviceid,
    });

    String id;
    List<Comment> comments;
    String name;
    String serviceid;

    factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        id: json["_id"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        name: json["name"],
        serviceid: json["serviceid"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "name": name,
        "serviceid": serviceid,
    };
}

class Comment {
    Comment({
        required this.comment,
        required this.userId,
    });

    String comment;
    String userId;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comment: json["comment"] as String,
        userId: json["user_id"] as String,
    );

    Map<String, dynamic> toJson() => {
        "comment": comment,
        "user_id": userId,
    };
}

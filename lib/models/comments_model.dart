import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Comment {
  final String comment;
  final String userId;

  Comment({required this.comment, required this.userId});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      comment: json['comment'],
      userId: json['user_id'],
    );
  }
}

class CommentModel {
  final String id;
  final String name;
  final String serviceId;
  final List<Comment> comments;

  CommentModel({required this.id, required this.name, required this.serviceId, required this.comments});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    var commentsJson = json['comments'] as List;
    List<Comment> comments = commentsJson.map((commentJson) => Comment.fromJson(commentJson)).toList();
    return CommentModel(
      id: json['_id'],
      name: json['name'],
      serviceId: json['serviceid'],
      comments: comments,
    );
  }
}
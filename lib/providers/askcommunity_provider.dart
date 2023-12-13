// ignore_for_file: avoid_print, prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:http/http.dart' as http;

class AskCommunityProvider with ChangeNotifier {
  AskTheCommunityModels? _askcommunity;
  bool _isLoading = false;

  AskTheCommunityModels? get askCommunityData => _askcommunity;
  bool get isLoading => _isLoading;

  Future<void> fetchAskCommunityData(String uid,
      {String? newQuestionId}) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Fetch new data
      AskTheCommunityModels datalist =
          await Http().fetchAskCommunity("$baseUrl/askcommunity/$uid");

      print("Fetched data: $datalist");
      print("New Question ID: $newQuestionId");

      // Update the existing data by appending the new data
      if (_askcommunity != null) {
        if (newQuestionId != null) {
          // Find the newly posted question
          var newQuestion = datalist.data
              .firstWhere((q) => q.qdetails.questionid == newQuestionId);
          _askcommunity!.data.insert(0, newQuestion);
        } else {
          _askcommunity!.data.addAll(datalist.data);
        }
      } else {
        _askcommunity = datalist;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      // Handle errors and notify listeners
      _isLoading = false;
      notifyListeners();
    }
  }

  //////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////// below post  question API  //////////////////////////
//////////////////////////////////////////////////////////////////////

  Future<bool> PostAskcommunity(
    BuildContext context,
    String business_uid,
    String question,
  ) async {
    const String url = "$baseUrl/post_question";
    final user = FirebaseAuth.instance.currentUser;

    final userid = user!.uid;

    final Map<String, dynamic> data = {
      "question": question,
      "business_uid": business_uid,
      "userid": userid,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );

      if (response.statusCode == 200) {
        print("Question posted successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your Question posted successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        print("Server response: ${response.body}");

        // Parse the response to get the questionid of the newly posted question
        var responseJson = jsonDecode(response.body);
        var newQuestionId = responseJson['questionid'];

        // Create a new question object
        var newQuestion = Datum(
          answers: [], // Initialize with an empty list or provide actual answers
          qdetails: Qdetails(
              createdAt: 'some date', // Provide actual date
              questionid: newQuestionId,
              userid: userid // Provide actual user id
              ),
          question: question,
        );

        // Add the new question to the beginning of the list
        _askcommunity!.data.insert(0, newQuestion);

        notifyListeners();

        return true;
      } else {
        print("Failed to post question. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');
        // You can handle errors here, e.g., showing an error message to the user.
      }
    } catch (e) {
      print('Error: $e');
      // Handle any other exceptions that may occur during the request.
    }
    return false;
  }

  //////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////// below post answer API  //////////////////////////
//////////////////////////////////////////////////////////////////////

  Future<bool> postAnswer(
    BuildContext context,
    String questionId,
    String answer,
  ) async {
    const String url = "$baseUrl/post_answer";
    final user = FirebaseAuth.instance.currentUser;

    final userid = user!.uid;

    final Map<String, dynamic> data = {
      "answer": answer,
      "questionid": questionId,
      "userid": userid,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );

      if (response.statusCode == 200) {
        print("Answer posted successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your Answer posted successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        print("Server response: ${response.body}");

        // Parse the response to get the answerid of the newly posted answer
        var responseJson = jsonDecode(response.body);
        var newAnswerId = responseJson['answerid'];

        // Create a new answer object
        // Create a new answer object
        var newAnswer = Answer(
          adetails: Adetails(
            createdAt: 'some date', // Provide actual date
            userid: userid, // Provide actual user id
          ),
          answer: answer,
        );

// Find the index of the question this answer belongs to
        int questionIndex = _askcommunity!.data
            .indexWhere((q) => q.qdetails.questionid == questionId);

// Check if the question was found
        if (questionIndex != -1) {
          // Add the new answer to the beginning of the answers list of the appropriate question
          _askcommunity!.data[questionIndex].answers.insert(0, newAnswer);
        }

// Notify listeners to update the UI
        notifyListeners();
        return true;
      } else {
        print("Failed to post answer. Status code: ${response.statusCode}");
        print('Response body: ${response.body}');
        // You can handle errors here, e.g., showing an error message to the user.
      }
    } catch (e) {
      print('Error: $e');
      // Handle any other exceptions that may occur during the request.
    }
    return false;
  }
}

// ignore_for_file: avoid_print, prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sssv1/models/askthecom_models.dart';
import 'package:sssv1/network_calling/http.dart';
import 'package:sssv1/utils/constants.dart';
import 'package:http/http.dart' as http;

class AskCommunityProvider with ChangeNotifier {
  AskTheCommunityModels? _askcommunity;
  bool _isLoading = false;

  AskTheCommunityModels? get askCommunityData => _askcommunity;
  bool get isLoading => _isLoading;

  // Future<void> fetchAskCommunityData(String uid,
  //     {String? newQuestionId}) async {
  //   try {
  //     _isLoading = true;
  //     notifyListeners();

  //     // Fetch new data
  //     AskTheCommunityModels datalist =
  //         await Http().fetchAskCommunity("$baseUrl/askcommunity/$uid");

  //     print("Fetched data: $datalist");
  //     print("New Question ID: $newQuestionId");

  //     // Update the existing data by appending the new data
  //     if (_askcommunity != null) {
  //       if (newQuestionId != null) {
  //         // Find the newly posted question
  //         var newQuestion = datalist.data
  //             .firstWhere((q) => q.qdetails.questionid == newQuestionId);
  //         _askcommunity!.data.insert(0, newQuestion);
  //       } else {
  //         _askcommunity!.data.addAll(datalist.data);
  //       }
  //     } else {
  //       _askcommunity = datalist;
  //     }

  //     _isLoading = false;
  //     notifyListeners();
  //   } catch (e) {
  //     // Handle errors and notify listeners
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  Future<void> fetchAskCommunityData(String uid,
      {String? newQuestionId}) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Clear the existing data
      _askcommunity = null;

      // Fetch new data
      AskTheCommunityModels datalist =
          await Http().fetchAskCommunity("$baseUrl/askcommunity/$uid");

      // Update the data
      _askcommunity = datalist;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      // Handle errors and notify listeners
      _isLoading = false;
      notifyListeners();
    }
  }
  // Future<void> fetchAskCommunityData(BuildContext context, String uid,
  //     {String? newQuestionId}) async {
  //   try {
  //     _isLoading = true;
  //     notifyListeners();

  //     // Fetch new data from the server
  //     final response = await http.get(Uri.parse("$baseUrl/askcommunity/$uid"));
  //     // print('Response status: ${response.statusCode}');
  //     // print('Response body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       final datalist =
  //           AskTheCommunityModels.fromJson(jsonDecode(response.body));
  //       // print("Fetched data: $datalist");

  //       // Check if the data is empty or not
  //       if (datalist.data.isNotEmpty) {
  //         // If the data is not empty, update the local data with the new data
  //         _askcommunity = datalist;
  //       }

  //       _isLoading = false;
  //       notifyListeners();
  //     } else {
  //       // Handle non-200 status codes
  //       // print('Failed to fetch data. Status code: ${response.statusCode}');
  //       _isLoading = false;
  //       notifyListeners();
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //               'Failed to load data. Status code: ${response.statusCode}'),
  //           behavior: SnackBarBehavior.floating,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     _isLoading = false;
  //     notifyListeners();
  //     // Handle errors here
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Failed to load data.'),
  //         behavior: SnackBarBehavior.floating,
  //       ),
  //     );
  //   }
  // }

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

        // Parse the response to get the questionid of the newly posted question
        var responseJson = jsonDecode(response.body);
        var newQuestionId = responseJson['questionid'];

        // Create a new question object with the question_id from the server
        var newQuestion = Datum(
          answers: [], // Initialize with an empty list or provide actual answers
          qdetails: Qdetails(
              createdAt:
                  DateTime.now().toIso8601String(), // Provide actual date
              questionid: newQuestionId, // Use the question_id from the server
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
        // Handle errors here, e.g., showing an error message to the user.
      }
    } catch (e) {
      print('Error: $e');
      // Handle any other exceptions that may occur during the request.
    }
    return false;
  }

  /////////////////// below Edit question API /////

  Future<bool> editQuestion(
    BuildContext context,
    String business_uid,
    String questionId,
    String newQuestionText,
  ) async {
    const String url = "$baseUrl/edit_question";
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("User is not logged in");
      return false;
    }

    final userid = user.uid;

    final Map<String, dynamic> data = {
      "business_uid": business_uid,
      "questionid": questionId,
      "new_question": newQuestionText,
      "userid": userid,
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        body: data,
      );

      if (response.statusCode == 200) {
        print("Question edited successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your Question edited successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        // Update the local data with the new question text
        int questionIndex = _askcommunity!.data
            .indexWhere((q) => q.qdetails.questionid == questionId);
        if (questionIndex != -1) {
          _askcommunity!.data[questionIndex].question = newQuestionText;
          _askcommunity!.data[questionIndex].qdetails.updatedAt =
              DateTime.now();
        }

        notifyListeners();
        return true;
      } else {
        print("Failed to edit question. Status code: ${response.statusCode}");
        // Handle errors here, e.g., showing an error message to the user.
      }
    } catch (e) {
      print('Error: $e');
      // Handle any other exceptions that may occur during the request.
    }
    return false;
  }

  ////////// below DELETE API for Question ///////////

  Future<bool> deleteQuestion(BuildContext context, String questionId,
      String userId, String businessUid) async {
    const String url = "$baseUrl/delete_question";
    final user = FirebaseAuth.instance.currentUser;

    if (user == null || user.uid != userId) {
      print("User is not logged in or unauthorized");
      return false;
    }

    final Map<String, dynamic> data = {
      "questionid": questionId,
      "userid": userId,
      "business_uid": businessUid,
    };

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: data,
      );

      if (response.statusCode == 200) {
        print("Question deleted successfully");
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text("Your Question deleted successfully"),
        //     behavior: SnackBarBehavior.floating,
        //   ),
        // );

        // Remove the question from the local data
        int questionIndex = _askcommunity!.data
            .indexWhere((q) => q.qdetails.questionid == questionId);
        if (questionIndex != -1) {
          _askcommunity!.data.removeAt(questionIndex);
        }

        notifyListeners();
        return true;
      } else {
        print("Failed to delete question. Status code: ${response.statusCode}");
        // Handle errors here, e.g., showing an error message to the user.
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

  // Future<bool> postAnswer(
  //   BuildContext context,
  //   String questionId,
  //   String answer,
  // ) async {
  //   const String url = "$baseUrl/post_answer";
  //   final user = FirebaseAuth.instance.currentUser;

  //   final userid = user!.uid;

  //   final Map<String, dynamic> data = {
  //     "answer": answer,
  //     "questionid": questionId,
  //     "userid": userid,
  //   };

  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: data,
  //     );

  //     if (response.statusCode == 200) {
  //       print("Answer posted successfully");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text("Your Answer posted successfully"),
  //           behavior: SnackBarBehavior.floating,
  //         ),
  //       );

  //       print("Server response: ${response.body}");

  //       // Find the index of the question this answer belongs to
  //       int questionIndex = _askcommunity!.data
  //           .indexWhere((q) => q.qdetails.questionid == questionId);

  //       // Check if the question was found
  //       if (questionIndex != -1) {
  //         // Parse the response to get the answerid of the newly posted answer
  //         var responseJson = jsonDecode(response.body);
  //         var newAnswerId = responseJson['answerid'];

  //         // Create a new answer object with the answer_id from the server
  //         var newAnswer = Answer(
  //           adetails: Adetails(
  //             createdAt:
  //                 DateTime.now().toIso8601String(), // Provide actual date
  //             userid: userid, // Provide actual user id
  //             answerid: newAnswerId, // Use the answer_id from the server
  //           ),
  //           answer: answer,
  //         );

  //         // Add the new answer to the beginning of the answers list of the appropriate question
  //         _askcommunity!.data[questionIndex].answers.insert(0, newAnswer);
  //       }

  //       // Notify listeners to update the UI
  //       notifyListeners();
  //       return true;
  //     } else {
  //       print("Failed to post answer. Status code: ${response.statusCode}");
  //       // Handle errors here, e.g., showing an error message to the user.
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     // Handle any other exceptions that may occur during the request.
  //   }
  //   return false;
  // }

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

        // Find the index of the question this answer belongs to
        int questionIndex = _askcommunity!.data
            .indexWhere((q) => q.qdetails.questionid == questionId);

        // Check if the question was found
        if (questionIndex != -1) {
          // Parse the response to get the answerid of the newly posted answer
          var responseJson = jsonDecode(response.body);
          var newAnswerId = responseJson['answerid'];

          // Create a new answer object with the answer_id from the server
          var newAnswer = Answer(
            adetails: Adetails(
              createdAt:
                  DateTime.now().toIso8601String(), // Provide actual date
              userid: userid, // Provide actual user id
              answerid: newAnswerId, // Use the answer_id from the server
            ),
            answer: answer,
          );

          // Add the new answer to the beginning of the answers list of the appropriate question
          _askcommunity!.data[questionIndex].answers.insert(0, newAnswer);
        }

        // Notify listeners to update the UI
        notifyListeners();
        return true;
      } else {
        print("Failed to post answer. Status code: ${response.statusCode}");
        // Handle errors here, e.g., showing an error message to the user.
      }
    } catch (e) {
      print('Error: $e');
      // Handle any other exceptions that may occur during the request.
    }
    return false;
  }

  /////////////// Edit API for Answer /////////////////////
  Future<bool> editAnswer(
    BuildContext context,
    String businessUid,
    String questionId,
    String answerId,
    String newAnswerText,
  ) async {
    const String url = "$baseUrl/edit_answer";
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("User is not logged in");
      return false;
    }

    final userid = user.uid;

    // Convert the data map to a form-encoded string
    final data = {
      "business_uid": businessUid,
      "questionid": questionId,
      "answerid": answerId,
      "new_answer": newAnswerText,
      "userid": userid,
    };
    final encodedData = Uri(queryParameters: data).query;

    try {
      // print('Sending request with payload: $data');
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }, // Set the content type to form data
        body: encodedData,
      );

      if (response.statusCode == 200) {
        print("Answer edited successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your Answer edited successfully"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        // Update the local data with the new answer text
        int questionIndex = _askcommunity!.data
            .indexWhere((q) => q.qdetails.questionid == questionId);
        if (questionIndex != -1) {
          int answerIndex = _askcommunity!.data[questionIndex].answers
              .indexWhere((a) => a.adetails.answerid == answerId);
          if (answerIndex != -1) {
            _askcommunity!.data[questionIndex].answers[answerIndex].answer =
                newAnswerText;
            _askcommunity!.data[questionIndex].answers[answerIndex].adetails
                .updatedAt = DateTime.now();
          }
        }

        notifyListeners();
        return true;
      } else {
        print("Failed to edit answer. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print('Error: $e');
    }
    return false;
  }

//////////////////// Delete endpoint for Answer //////////
  ///
  Future<bool> deleteAnswer(
    BuildContext context,
    String businessUid,
    String questionId,
    String answerId,
  ) async {
    const String url = "$baseUrl/delete_answer";
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("User is not logged in");
      return false;
    }

    final userid = user.uid;

    // Convert the data map to a form-encoded string
    final data = {
      "business_uid": businessUid,
      "questionid": questionId,
      "answerid": answerId,
      "userid": userid,
    };
    final encodedData = Uri(queryParameters: data).query;

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }, // Set the content type to form data
        body: encodedData,
      );

      if (response.statusCode == 200) {
        print("Answer deleted successfully");

        // Remove the answer from the local data
        int questionIndex = _askcommunity!.data
            .indexWhere((q) => q.qdetails.questionid == questionId);
        if (questionIndex != -1) {
          _askcommunity!.data[questionIndex].answers
              .removeWhere((a) => a.adetails.answerid == answerId);
        }

        notifyListeners();
        return true;
      } else {
        print("Failed to delete answer. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
    }
    return false;
  }
}

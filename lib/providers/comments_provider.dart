import 'package:flutter/material.dart';
import 'package:sssv1/models/commentsection_models.dart';
import 'package:sssv1/network_calling/http.dart';

class CommentSectionProvider extends ChangeNotifier{

  CommentSectionModels? _comments;
  bool _isLoading = false;

  CommentSectionModels? get getCommentsData  => _comments;
  bool get isLoading => _isLoading;
  


  Future<void> commentSectionProvider(uid)async {
    _isLoading = true;
    CommentSectionModels commentsection = await Http().fetchComments("https://revolution.azurewebsites.net/commentsuid/$uid");
    _comments = commentsection;
    _isLoading = false;
    notifyListeners();
  }


}
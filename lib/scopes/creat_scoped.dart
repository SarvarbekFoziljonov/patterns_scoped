import 'package:flutter/material.dart';
import 'package:patterns_scoped/models/post_model.dart';
import 'package:patterns_scoped/services/http_request.dart';
import 'package:scoped_model/scoped_model.dart';

class CreatScoped extends Model {
  bool isLoading = false;
  var titleController = TextEditingController();
  var postController = TextEditingController();

  apiCreatPost (BuildContext context) async{
    isLoading = true;
    notifyListeners();
    String title = titleController.text.trim().toString();
    String body = postController.text.trim().toString();
    Post post = Post(title: title, body: body, userId: 1);
    var response =  await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    print (response);
    isLoading = false;
    notifyListeners();
    if (response != null) {
      Navigator.pop(context, response);
    } else {
      print ("Not created");
    }
    notifyListeners();
  }



}
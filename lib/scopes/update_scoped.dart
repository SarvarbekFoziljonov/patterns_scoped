import 'package:flutter/material.dart';
import 'package:patterns_scoped/models/post_model.dart';
import 'package:patterns_scoped/services/http_request.dart';
import 'package:scoped_model/scoped_model.dart';

class UpdateScoped extends Model {

  bool isLoading = false;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  Post oldPost;

  getOldPost(Post post) {
    oldPost = post;
    titleController.text = oldPost.title;
    bodyController.text = oldPost.body;
    notifyListeners();
  }

  apiCreatePost(BuildContext context) async{
    isLoading = true;
    notifyListeners();

    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();
    Post post = Post(title: title, body: body, userId: oldPost.userId, id: oldPost.id);

    var response = await Network.PUT(Network.API_UPDATE + oldPost.id.toString(), Network.paramsUpdate(post));
    print(response);
    isLoading = false;
    notifyListeners();
    if(response != null) {
      Navigator.pop(context, response);
    } else {
      print("Error");
    }
    notifyListeners();
  }


}
import 'package:flutter/material.dart';

class AddPostNotifier with ChangeNotifier {
  List<String> selectedImages = [];
  String postType = "Fun"; // Default
  Map<String, dynamic> postDetails = {};

  void toggleImage(String imagePath) {
    if (selectedImages.contains(imagePath)) {
      selectedImages.remove(imagePath);
    } else {
      selectedImages.add(imagePath);
    }
    notifyListeners();
  }

  void setPostType(String type) {
    postType = type;
    notifyListeners();
  }

  void setDetail(String key, dynamic value) {
    postDetails[key] = value;
    notifyListeners();
  }
}

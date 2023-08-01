import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file
        .readAsBytes(); // Process that returns the sellected image as bytes
  }
  print("No Image Selected");
}
// This function should be used to pick image from the past image source, which can be camera or gallery

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text(
        (error as FirebaseException).message ?? "Something wen't wrong.",
      ),
    ),
  );
}

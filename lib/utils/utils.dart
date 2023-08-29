import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

// this function should be used to pick image from the past image source, which can be camera or gallery
pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file
        .readAsBytes(); // process that returns the sellected image as bytes
  }
  print("No Image Selected");
}

// showing snackbar that contains the text related to the context
showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

// showing snackbar that contains the text related to the firebase error
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

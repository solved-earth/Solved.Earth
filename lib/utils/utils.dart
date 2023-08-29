import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

// This function is used to pick an image from the specified source (camera or gallery).
pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes(); // Return the selected image as bytes.
  }
  print("No Image Selected");
}

// Show a snackbar with the provided content and related to the context.
showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

// Show a snackbar with the content related to the Firebase error.
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

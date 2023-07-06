import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/models/post_model.dart';

class ImageStoreMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> imageToStorage(Uint8List file) async {
    String id = const Uuid().v1();
    Reference ref = _storage
        .ref()
        .child('posts')
        .child(id); // To specify the folder names for the post and post id
    // Reference is an object that represents a reference to a file or a directory in a cloud storage service such as firebase storage

    UploadTask uploadTask = ref.putData(
        file); // UploadTask is an object that represents a task for uploading a file to a cloud storage service such as firebase storage
    TaskSnapshot snapshot = await uploadTask; // Can monitor the upload progress
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadPost(String description, Uint8List file) async {
    String res = 'Some Error Occurred';
    try {
      String photoUrl = await imageToStorage(file);
      String postId = const Uuid().v1();
      Post post = Post(
        //description: description,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
      );
      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}

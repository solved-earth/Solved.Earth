/*
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
    // !! need to receive $userId and $challengeId
    Reference ref = _storage
        .ref()
        .child('posts')
        .child(id); // To specify the folder names for the post and post id
    // !! _storage.ref().child("users/" + $userId + $challengeId + id);

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
*/
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:http/http.dart' as http;

class ImageStoreMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //int index = ref.watch(indexProvider);

  late int index;

  String currentUserUid = FirebaseAuth.instance.currentUser!.uid;

  Future<String> imageToStorage(Uint8List file, int index) async {
    String id = const Uuid().v1();

    // !! need to receive $userId and $challengeId
    Reference ref = _storage
        .ref()
        .child('users/$currentUserUid/${index.toString()}/')
        .child(id); // To specify the folder names for the post and post id
    // !! _storage.ref().child("users/" + $userId + $challengeId + id);

    // Reference is an object that represents a reference to a file or a directory in a cloud storage service such as firebase storage

    UploadTask uploadTask = ref.putData(
        file); // UploadTask is an object that represents a task for uploading a file to a cloud storage service such as firebase storage
    TaskSnapshot snapshot = await uploadTask; // Can monitor the upload progress
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //! Replaced the Future type from Future<String> to Future<Object>
  Future<String> uploadPost(
      String description, Uint8List file, int index) async {
    String res = 'Some Error Occurred';
    String neterror = 'Network Error Occurred';

    String apiUrl =
        'http://49.247.29.177:8000/upload-images/?username=${currentUserUid}&challenge_name=${index.toString()}';
    Uri uri = Uri.parse(apiUrl);

    // Send the API request
    var response = await http.post(uri, body: {
      'image': File.fromRawPath(file), //! Uint8List가 아니라 원본 사진을 보내야 할 수도
    });

    // Handle the API response
    if (response.statusCode == 200) {
      //int index = ref.watch(indexProvider);
      var response = await http.get(uri);
      Map<String, dynamic> responseBodyMap = jsonDecode(response.body);
      if (responseBodyMap["success"] == true) {
        try {
          String photoUrl = await imageToStorage(file, index);
          String postId = const Uuid().v1();

          Post post = Post(
            //description: description,
            postId: postId,
            datePublished: DateTime.now(),
            postUrl: photoUrl,
          );
          _firestore
              .collection('users/$currentUserUid/${index.toString()}/')
              .doc(postId)
              .set(
                post.toJson(),
              );
          res = 'success';
        } catch (err) {
          res = err.toString();
        }
        return res;
      } else {
        return responseBodyMap["reason"]; // Returns missing values
      }
    } else {
      return neterror;
    }
  }
}

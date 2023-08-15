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
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/components/certification_tile.dart';

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

  Future<String> uploadPost(
      String description, Uint8List file, int index) async {
    String res = 'Some Error Occurred';

    //int index = ref.watch(indexProvider);
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
          ); // ! currentUserUid 에서 문제 발생 시 index를 certification_tile 에서 받아온 방법 사용
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}

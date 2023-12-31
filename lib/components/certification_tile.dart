import 'dart:typed_data';

import 'package:app/view/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/models/challenge_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/utils/utils.dart';
import 'package:app/resources/image_store_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CertificationTile extends StatefulWidget {
  final int index;

  const CertificationTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CertificationTile> createState() => _CertificationTileState();
}

class _CertificationTileState extends State<CertificationTile> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    // Call the dispose method of the super class
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        // Access the ChallengeModel using the watch function from Flutter Riverpod
        ChallengeModel challengeModel = watch.read(challengeModelProvider);

        Uint8List? file0;
        final TextEditingController descriptionController =
            TextEditingController();

        // Clear the selected image (file variable) by setting it to null
        void clearImage() {
          setState(() {
            file0 = null;
          });
        }

        // Change the status of a specific challenge whether it's achieved or not
        void handleTap() {
          bool isAchieved = challengeModel.challenges[widget.index][3];
          if (!isAchieved) {
            challengeModel.clearChallenge(widget.index);
          }
        }

        bool isLoading = false;

        // Start the procedure to evaluate the selected image by calling uploadPost function
        void postImage() async {
          setState(() {
            isLoading = true;
          });

          try {
            String res = await ImageStoreMethods().uploadPost(
              descriptionController.text,
              file0!,
              challengeModel.challenges[widget.index][4],
            );

            if (!mounted) return;
            if (res == 'success') {
              handleTap();
              setState(() {
                isLoading = false;
              });
              showSnackBar('도전과제 성공!', context);
              clearImage();
            } else {
              setState(() {
                isLoading = false;
              });
              showSnackBar(res, context);
            }
          } catch (err) {
            showSnackBar(err.toString(), context);
          }
        }

        // Function to select an image using the image picker
        _imageSelect(BuildContext context) async {
          bool isAchieved = challengeModel.challenges[widget.index][3];

          // Show a popup to direct the user to login for certifying challenges
          if (currentUser == null) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text(
                    "챌린지 인증을 위해서는 로그인을 먼저 해야 합니다.",
                    textAlign: TextAlign.center,
                  ),
                  content: const Text("로그인하고 나서 다시 시도해주세요."),
                  actions: [
                    CupertinoDialogAction(
                        isDefaultAction: true,
                        child: const Text("확인"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                );
              },
            );
          } else if (isAchieved) {
            return showSnackBar('이미 성공한 도전과제 입니다.', context);
          } else {
            // Show options for certifying the selected challenge
            return showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: const Text('인증할 사진을 고르세요'),
                  children: [
                    SimpleDialogOption(
                      padding: const EdgeInsets.all(20),
                      child: const Text('카메라 촬영'),
                      onPressed: () async {
                        Navigator.of(context).pop();
                        Uint8List file = await pickImage(ImageSource.camera);
                        setState(() {
                          file0 = file;
                        });
                        postImage();
                      },
                    ),
                    SimpleDialogOption(
                      padding: const EdgeInsets.all(20),
                      child: const Text('갤러리에서 선택'),
                      onPressed: () async {
                        Navigator.of(context).pop();
                        Uint8List file = await pickImage(ImageSource.gallery);
                        setState(() {
                          file0 = file;
                        });
                        postImage();
                      },
                    ),
                    SimpleDialogOption(
                      padding: const EdgeInsets.all(20),
                      child: const Text('취소'),
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              },
            );
          }
        }

        return GestureDetector(
          onTap: () {},
          child: file0 == null
              ? Column(
                  children: [
                    // The color of the image icon changes to green if the challenge is achieved, if not, it stays red
                    IconButton(
                      onPressed: () => _imageSelect(context),
                      icon: const Icon(Icons.photo),
                      iconSize: 60,
                      color: challengeModel.challenges[widget.index][3]
                          ? Colors.green[200]
                          : Colors.red[200],
                    ),
                  ],
                )
              // Show a linear progress indicator while the submitted image is evaluated
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        isLoading
                            ? const LinearProgressIndicator()
                            : const Padding(padding: EdgeInsets.only(top: 0)),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

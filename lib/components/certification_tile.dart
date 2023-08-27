import 'dart:typed_data';

import 'package:app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/models/challenge_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/utils/utils.dart';
import 'package:app/resources/image_store_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CertificationTile extends ConsumerStatefulWidget {
  final int index;

  const CertificationTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  ConsumerState<CertificationTile> createState() => _CertificationTileState();
}

class _CertificationTileState extends ConsumerState<CertificationTile>
    with ChangeNotifier {
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
        ChallengeModel challengeModel = watch.read(challengeModelProvider);

        Uint8List? file0;
        final TextEditingController descriptionController =
            TextEditingController();

        void clearImage() {
          setState(() {
            file0 = null;
          });
        }

        void handleTap() {
          bool isAchieved = challengeModel.challenges[widget.index][3];
          if (isAchieved) {
            // !isAchived로 수정해서 else문 삭제
          } else {
            challengeModel.clearChallenge(widget.index);
          }
        }

        bool isLoading = false;
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
            print('$res 1');

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

        _imageSelect(BuildContext context) async {
          bool isAchieved = challengeModel.challenges[widget.index][3];

          if (currentUser == null) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text(
                      "You have to log in before you submit the image"),
                  content: const Text("Please log in and try again"),
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
            return showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: const Text('Select Image'),
                  children: [
                    SimpleDialogOption(
                      padding: const EdgeInsets.all(20),
                      child: const Text('Take a Photo'),
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
                      child: const Text('Choose From Gallery'),
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
                      child: const Text('Cancel'),
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

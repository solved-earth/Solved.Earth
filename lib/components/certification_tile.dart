import 'dart:typed_data';

import 'package:app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/models/challenge_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/utils/utils.dart';
import 'package:app/resources/image_store_methods.dart';

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
            String res = await ImageStoreMethods()
                .uploadPost(descriptionController.text, file0!);
            if (res == 'success') {
              handleTap();
              setState(() {
                isLoading = false;
              });
              showSnackBar('Posted', context);
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

          if (isAchieved) {
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

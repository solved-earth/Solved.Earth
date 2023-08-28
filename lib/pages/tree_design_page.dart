import 'package:app/models/tree_model.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class TreeDesignPage extends StatefulWidget {
  const TreeDesignPage({
    super.key,
  });

  @override
  State<TreeDesignPage> createState() => _TreeDesignPageState();
}

int selectedtreeindex = 0;

class _TreeDesignPageState extends State<TreeDesignPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/landscape1.jpg'), //the background image
            fit: BoxFit.cover,
          ),
        ),
        child: PageView.builder(
          itemCount: treeModelList.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                InkWell(
                  onTap: () {
                    showSnackBar(
                        "${treeModelList[index].id}번째 나무로 변경되었습니다!", context);
                    selectedtreeindex = index;
                  },
                  child: Container(
                      decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(treeModelList[index].path),
                    ),
                  )),
                ),
                Positioned(
                  left: 113.7,
                  top: 70,
                  child: SizedBox(
                    width: 184,
                    child: Text(
                      treeModelList[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

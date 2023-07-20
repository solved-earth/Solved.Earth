import 'package:app/models/tree_model.dart';
import 'package:app/pages/main_page.dart';
import 'package:flutter/material.dart';

class TreeDesignPage extends StatelessWidget {
  const TreeDesignPage({
    super.key,
    /*required this.treeModel*/
  });

  //final TreeModel? treeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('lib/images/landscape1.jpg'), //the background image
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
                    //print("Clicked ${treeModelList[index].id}!");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(index: index),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(treeModelList[index].thumbnailUrl),
                      ),
                    ),
                  ),
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

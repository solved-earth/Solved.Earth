class TreeModel {
  final int id;
  final String title;
  final String path;

  TreeModel(this.id, this.title, this.path);
}

List<TreeModel> treeModelList = [
  TreeModel(1, 'Tree 1', 'images/tree_illust.png'),
  TreeModel(2, 'Tree 2', 'images/tree_illust2.png'),
  TreeModel(3, 'Tree 3', 'images/tree_illust3.png'),
  TreeModel(4, 'Tree 4', 'images/tree_illust4.png'),
];

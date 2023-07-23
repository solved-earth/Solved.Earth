class TreeModel {
  final int id;
  final String title;
  final String path;

  TreeModel(this.id, this.title, this.path);
}

List<TreeModel> treeModelList = [
  /*TreeModel(1, 'Tree 1', 'https://i.ibb.co/gwRmm1Q/tree-illust.png'),
  TreeModel(2, '이름 모를 나무', 'https://i.ibb.co/hK1Yp2J/tree-illust2.png'),
  TreeModel(3, '나?무', 'https://i.ibb.co/CpjjqXF/tree-illust3.png'),
  TreeModel(4, '갈참나무', 'https://i.ibb.co/Q8yPXk6/tree-illust4.png'),*/
  TreeModel(1, 'Tree 1', 'images/tree_illust.png'),
  TreeModel(2, 'Tree 2', 'images/tree_illust2.png'),
  TreeModel(3, 'Tree 3', 'images/tree_illust3.png'),
  TreeModel(4, 'Tree 4', 'images/tree_illust4.png'),
];//imgbb에 업로드 후 링크(https://ibb.co/ctrkk5R) 얻으면 링크 클릭 후 이미지에서 주소 추출한 것 활용

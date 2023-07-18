class TreeModel {
  final int id;
  final String title;
  final String thumbnailUrl;

  TreeModel(this.id, this.title, this.thumbnailUrl);
}

List<TreeModel> treeModelList = [
  TreeModel(1, 'title', 'https://i.ibb.co/gwRmm1Q/tree-illust.png'),
  TreeModel(2, 'title', 'https://i.ibb.co/hK1Yp2J/tree-illust2.png'),
  TreeModel(3, 'title', 'https://i.ibb.co/WpbLQWR/tree-illust3.png'),
  TreeModel(4, 'title', 'https://i.ibb.co/Q8yPXk6/tree-illust4.png'),
];//imgbb에 업로드 후 링크(https://ibb.co/ctrkk5R) 얻으면 링크 클릭 후 이미지에서 주소 추출한 것 활용

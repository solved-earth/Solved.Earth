class TreeModel {
  final int id;
  final String title;
  final String thumbnailUrl;

  TreeModel(this.id, this.title, this.thumbnailUrl);
}

List<TreeModel> treeModelList = [
  TreeModel(1, 'Tree 1', 'https://i.ibb.co/gwRmm1Q/tree-illust.png'),
  TreeModel(2, '이름 모를 나무', 'https://i.ibb.co/hK1Yp2J/tree-illust2.png'),
  TreeModel(3, '나?무', 'https://i.ibb.co/CpjjqXF/tree-illust3.png'),
  TreeModel(4, '갈참나무', 'https://i.ibb.co/Q8yPXk6/tree-illust4.png'),
];//imgbb에 업로드 후 링크(https://ibb.co/ctrkk5R) 얻으면 링크 클릭 후 이미지에서 주소 추출한 것 활용

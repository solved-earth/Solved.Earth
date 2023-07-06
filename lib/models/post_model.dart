class Post {
  //final String description;
  final String postId;
  final datePublished;
  final String postUrl;

  const Post({
    //required this.description,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
  });

  Map<String, dynamic> toJson() => {
        //"description": description,
        "postId": postId,
        "datePublished": datePublished,
        "postUrl": postUrl,
      };
}

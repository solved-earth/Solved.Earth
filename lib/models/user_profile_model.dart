class UserProfileModel {
  final String uid;
  final String email;
  final String name;
  final String birthday;

  UserProfileModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.birthday,
  });

  UserProfileModel.empty()
      : uid = "",
        email = "",
        name = "",
        birthday = "";

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        email = json["email"],
        name = json["name"],
        birthday = json["birthday"];

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "birthday": birthday,
    };
  }

  UserProfileModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? birthday,
  }) {
    return UserProfileModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
    );
  }
}

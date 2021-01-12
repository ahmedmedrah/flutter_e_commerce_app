class UserModel {
  String userId, email, name, imgUrl;

  UserModel({
    this.userId,
    this.email,
    this.name,
    this.imgUrl,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map){
    if (map == null) return;
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    imgUrl = map['imgUrl'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'imgUrl': imgUrl,
    };
  }
}

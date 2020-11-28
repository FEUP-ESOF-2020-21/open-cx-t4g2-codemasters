class UserModel {
  String username;
  String description;
  String imgPath;
  String uid;
  String ref;
  int rate;

  String password;
  String email;

  UserModel({Map<String, dynamic> data, String ref}) {
    this.ref = ref;

    if (data != null) {
      this.uid = data['uid'];
      this.username = data['username'];
      this.description = data['description'];
      this.imgPath = data['imgPath'];
      this.rate = data['rate'];
    }
  }
}

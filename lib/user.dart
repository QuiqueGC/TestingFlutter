class User{

  String? login;
  String? avatarURL;
  int? id;

  User(this.login, this.avatarURL);



  User.fromJSON(Map<String, dynamic> parsedJSON){

    this.login = parsedJSON["login"];
    this.avatarURL = parsedJSON["avatar_url"];
    this.id = parsedJSON["id"];

  }
}
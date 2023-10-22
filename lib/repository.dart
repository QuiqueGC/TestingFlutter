
/*{"id":1,
"node_id":"MDEwOlJlcG9zaXRvcnkx",
"name":"grit",
"full_name":"mojombo/grit",
"private":false,
"owner":{"login":"mojombo","id":1,"node_id":"MDQ6VXNlcjE=",
"avatar_url":"https://avatars.githubusercontent.com/u/1?v=4",
"gravatar_id":"",
"url":"https://api.github.com/users/mojombo",
"html_url":"https://github.com/mojombo",
"followers_url":"https://api.github.com/users/mojombo/followers",
"following_url":"https://api.github.com/users/mojombo/following{/other_user}",
"gists_url":"https://api.github.com/users/mojombo/gists{/gist_id}",
"starred_url":"https://api.github.com/users/mojombo/starred{/owner}{/repo}",
"subscriptions_url":"https://api.github.com/users/mojombo/subscriptions",
"organizations_url":"https://api.github.com/users/mojombo/orgs",
"repos_url":"https://api.github.com/users/mojombo/repos",
"events_url":"https://api.github.com/users/mojombo/events{/privacy}",
"received_events_url":"https://api.github.com/users/mojombo/received_events",
"type":"User",
"site_admin":false}*/

import 'package:staruday_project/user.dart';

class Repository{

  int? id;
  String? node_id;
  String? name;
  String? full_name;
  User? user;


  Repository.fromJSON(Map<String, dynamic> parsedJSON){

    this.id = parsedJSON["id"];
    this.node_id = parsedJSON["node_id"];
    this.name = parsedJSON["name"];
    this.full_name = parsedJSON["full_name"];
    this.user = User.fromJSON(parsedJSON["owner"]);



  }

}

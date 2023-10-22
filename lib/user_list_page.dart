import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:staruday_project/user.dart';
import 'package:staruday_project/users_list.dart';
import 'package:flutter/material.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key, required this.title});

  final String title;

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  List<User> usersList = [];
  final dio = Dio();
  bool loading = false;

  @override
  void initState() {
    super.initState();

    getHttp();
  }

  Future<void> getHttp() async {
    setState(() {
      loading = true;
    });

    final response = await dio.get("https://api.github.com/users",
        options: Options(responseType: ResponseType.plain));

    String dioResult = response.data.toString();

    List<Map<String, dynamic>> data = List.from(jsonDecode(dioResult) as List);

    for (Map<String, dynamic> JSONElement in data) {
      usersList.add(User.fromJSON(JSONElement));
    }


    setState(() {
      loading = false;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
      ),
      body: Container(
          width: double.maxFinite,
          child: !loading
              ? UsersList(userList: usersList)
              : Center(child: CircularProgressIndicator())),
    );
  }
}

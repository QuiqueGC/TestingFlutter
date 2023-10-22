import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:staruday_project/repository.dart';
import 'package:staruday_project/repository_list.dart';
import 'package:staruday_project/user.dart';

class RepositoryListPage extends StatefulWidget {
  const RepositoryListPage({super.key, required this.title, this.user});

  final User? user;
  final String title;

  @override
  State<RepositoryListPage> createState() => _RepositoryListPageState();
}

class _RepositoryListPageState extends State<RepositoryListPage> {
  final dio = Dio();
  List<Repository> repoList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  Future<void> getHttp() async {
    setState(() {
      isLoading = true;
    });

    final response = await dio.get("https://api.github.com/repositories",
        options: Options(responseType: ResponseType.plain));
    String dioResult = response.data.toString();

    List<Map<String, dynamic>> data = List.from(jsonDecode(dioResult) as List);

    for (Map<String, dynamic> JSONRepository in data) {
      repoList.add(Repository.fromJSON(JSONRepository));
    }

    setState(() {
      isLoading = false;
    });
  }

  List<Repository> listDependingOfUser() {
    if (widget.user != null) {
      return repoList
          .where((element) => element.user!.login == widget.user!.login)
          .toList();
    } else {
      return repoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(widget.title),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: Colors.blueGrey,
                child: listDependingOfUser().isEmpty
                    ? emptyList()
                    : RepoList(repoList: listDependingOfUser()) // This trailing comma makes auto-formatting nicer for build methods.
                ));
  }

  Widget emptyList() {
    return const Center(
      child: Text(
        "El usuario no tiene repositorios",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}

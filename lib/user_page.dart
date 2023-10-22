import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staruday_project/repository.dart';
import 'package:staruday_project/repository_list_page.dart';
import 'package:staruday_project/user.dart';

class UserPage extends StatefulWidget{
  const UserPage({super.key, required this.user});

final User user;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Propietario"),
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(width: 15, color: Colors.deepPurpleAccent)),
              child: Image.network(widget.user.avatarURL!,
              fit: BoxFit.fitHeight,
              height: 500,
              width: 500,),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text("Nombre: ",
                style: TextStyle(
                  fontSize: 20
                ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Text(widget.user.login!,
                  style: const TextStyle(
                    color: Colors.deepPurpleAccent,
                      fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 25,),
                child: ElevatedButton(onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=> RepositoryListPage(
                          user: widget.user,
                          title: "Repositorios de "+ widget.user.login!)));},
                    child: Text("ver repositorios"))),
          ],),
      ),
    );
  }
}
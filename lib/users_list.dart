import 'package:staruday_project/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staruday_project/user_page.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key, required this.userList});

  final List<User> userList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemOfList,
      itemCount: userList.length,
    );
  }

  Widget? itemOfList(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserPage(
                  user: userList[index],
                )));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 2)),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple, width: 4)),
              child: Image.network(
                userList[index].avatarURL!,
                width: 60,
                height: 60,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    userList[index].id.toString(),
                    style: TextStyle(fontSize: 30),
                  )),
            ),
            Expanded(
                flex: 5,
                child: Text(
                  userList[index].login!,
                  style: TextStyle(fontSize: 30),
                ))
          ],
        ),
      ),
    );
  }
}

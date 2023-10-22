import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staruday_project/user_page.dart';
import 'package:staruday_project/repository.dart';

class RepoList extends StatelessWidget {
  const RepoList({super.key, required this.repoList});

  final List<Repository> repoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: repoItem, itemCount: repoList.length);
  }

  Widget? repoItem(BuildContext context, int index) {
    int numRep = index + 1;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserPage(
                      user: repoList[index].user!,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(), color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: double.maxFinite,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25))
                  ),
              child: Text(
                "Repositorio número $numRep",
                style: const TextStyle(
                    fontSize: 15),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Image.asset(
                    "assets/repository.png",
                    height: 60,
                    width: 60,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Row(children: [
                        const Text(
                          "ID: ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          repoList[index].id.toString()!,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          const Text(
                            "nombre: ",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            repoList[index].name!,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

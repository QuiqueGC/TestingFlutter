import 'package:flutter/material.dart';
import 'package:staruday_project/repository_list_page.dart';
import 'package:staruday_project/user_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("Sea bienvenid@!!"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: const Text(
                  "Accede a los repositorios de GitHub",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Image.asset(
                "assets/gitHub.png",
                height: 500,
                width: 500,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RepositoryListPage(
                                  title: "Repositorios",
                                )));
                  },
                  child: const Text("Ver repositorios!")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UsersListPage(title: "Usuarios")));
                  },
                  child: const Text("Ver usuarios!"))
            ],
          ),
        ));
  }
}

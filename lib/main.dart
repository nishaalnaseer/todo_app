import 'package:flutter/material.dart';
import 'package:todo_app/template_view.dart';
import 'models.dart';


void main() {
  runApp(
    const NishawlsToDo(),
  );
}

class NishawlsToDo extends StatelessWidget {
  const NishawlsToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: Colors.blue[100]
      ),
      home: App()
    );
  }
}


class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GlobalKey<ScaffoldState> scaffoldKey;
  Widget templateView = const TemplateView();
  // Widget todoView =
  late Widget window = templateView;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ToDo App")),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          color: Colors.blue[100],
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Todos",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "arial",
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),
                ),
                onTap: () {
                  // Handle Todo item tap
                },
              ),
              ListTile(
                title: const Text(
                  "Templates",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "arial",
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),
                ),
                onTap: () {
                  // Handle Todo item tap
                },
              ),
            ],
          ),
        )
      ),
      body: window,
    );
  }
}

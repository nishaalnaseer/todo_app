import 'package:flutter/material.dart';
import 'package:todo_app/structs.dart';

class TemplateView extends StatefulWidget {
  const TemplateView({super.key});

  @override
  State<TemplateView> createState() => _TemplateViewState();
}

class _TemplateViewState extends State<TemplateView> {
  List<Template> templates = [
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
    Template({1: "todo"}, "first", 1),
  ];

  bool addingTodo = false;
  TextEditingController addingTodoExistingTemplate = TextEditingController();
  late Template templateToEdit;

  bool addingTemplate = false;
  TextEditingController addingTodoTemplate = TextEditingController();
  Template templateToAdd = Template({}, "name", 0);
  List<String> toDosToTemplate = [];

  void voidTemplate() {
    templateToAdd = Template({}, "name", 0);
    addingTodoTemplate = TextEditingController();
    toDosToTemplate = [];
  }

  Padding aTemplate(Template template) {
    TextEditingController _title = TextEditingController();
    Map<int, TextEditingController> toDoControllers = {};
    template.thingsTodo.forEach((key, value) {
      toDoControllers.putIfAbsent(key, () => TextEditingController());
    });

    Container container = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Set the border radius
        border: Border.all(
          color: Colors.deepPurple, // Set the border color
          width: 2.0,          // Set the border width
        ),
      ),
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            child: TextField(
              decoration: InputDecoration(
                labelText: "Title: ${template.name}",
                prefixText: "Change Title To: "
              ),
            ),
          ),

          Padding( // todos that are part of a template
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              shrinkWrap: true, // To ensure the ListView takes up only the necessary space
              itemCount: template.thingsTodo.length,
              itemBuilder: (BuildContext context, int index) {
                var controller = toDoControllers[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: "ToDo: ${template.name}",
                      prefixText: "Change ToDo To: "
                    ),
                  ),
                );
              },
            ),
          ),

          Center(
            child: ElevatedButton(
                onPressed: () {
                  addingTodo = true;
                  setState(() {

                  });
                },
                child: const Text("Add ToDo")
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Container()
                ),
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(minWidth: 100),
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      // String value = addToDo.text;
                      // template.add(thing),
                    },
                    child: const Text("Save"),
                  ),
                ),
                Container(
                  width: 200,
                  alignment: Alignment.center,

                  constraints: const BoxConstraints(minWidth: 100),
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Create With Template"),
                  ),
                ),
                Expanded(
                    child: Container()
                ),
              ],
            )
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
      child: container,
    );
  }

  double getOpacity() {
    if (addingTodo || addingTemplate) {
      return 0.1;
    } else {
      return 1.0;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: (addingTodo || addingTemplate),
          child: Opacity(
            opacity: (addingTodo || addingTemplate) ? 0.1 : 1.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Templates",
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w700,
                            fontFamily: "Arial",
                            fontSize: 22
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 40, 10),
                        alignment: Alignment.topRight,
                        width: MediaQuery.of(context).size.width - 40,
                        child: IconButton(
                          onPressed: () {
                            voidTemplate();
                            addingTemplate = true;
                            setState(() {

                            });
                          },
                          tooltip: "Add Template",
                          icon: Icon(
                            Icons.add,
                            color: Colors.blue[900],
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 570,
                      minHeight: 100
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0), // Set the border radius
                        border: Border.all(
                          color: Colors.black, // Set the border color
                          width: 1.0,          // Set the border width
                        ),
                      ),
                      child:  ListView.builder(
                        shrinkWrap: true, // To ensure the ListView takes up only the necessary space
                        itemCount: templates.length,
                        itemBuilder: (BuildContext context, int index) {
                          return aTemplate(
                            templates[index]
                          );
                        },
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        ),

        addingTodo ? Container(
          width: MediaQuery.of(context).size.width - 20,
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(flex: 1,child: Container(),),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: addingTodoExistingTemplate,
                  decoration: const InputDecoration(
                      labelText: "Add ToDo"
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(flex: 1, child: Container()),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        addingTodo = false;
                        setState(() {

                        });
                      },
                      child: const Text(
                          "Add"
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        addingTodo = false;
                        setState(() {

                        });
                      },
                      child: const Text(
                        "Cancel"
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
              Expanded(flex: 1,child: Container(),),

            ],
          ),
        ) :
            Container(),

        addingTemplate ? Container(
          width: MediaQuery.of(context).size.width - 20,
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(flex: 1,child: Container(),),

              const Padding(
                  padding: EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: "Template Title: "
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: addingTodoTemplate,
                  decoration: const InputDecoration(
                      labelText: "Todo: "
                  )
                ),
              ),

              Container(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                ),
                child: ListView.builder(
                  shrinkWrap: true, // To ensure the ListView takes up only the necessary space
                  itemCount: toDosToTemplate.length,

                  itemBuilder: (BuildContext context, int index) {

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: Container()),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(toDosToTemplate[index])
                          ),
                          ElevatedButton(
                              onPressed: () {
                              },
                              child: Text(
                                  "Delete"
                              )
                          ),
                          Expanded(flex: 1, child: Container())
                        ],
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      String details = addingTodoTemplate.text;
                      if (details.isEmpty) {
                        return;
                      }
                      toDosToTemplate.add(details);

                      setState(() {

                      });

                    },
                    child: const Text("Add ToDo")
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(flex: 1,child: Container(),),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                        onPressed: () {
                          voidTemplate();
                          addingTemplate = false;
                          setState(() {

                          });
                        },
                        child: const Text(
                            "Save"
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                        onPressed: () {
                          voidTemplate();
                          addingTemplate = false;
                          setState(() {

                          });
                        },
                        child: const Text(
                            "Cancel"
                        ),
                      ),
                    ),
                    Expanded(flex: 1,child: Container(),),
                  ],
                ),
              ),
              Expanded(flex: 1,child: Container(),),
            ],
          ),
        ) :
            Container(),
      ],
    );
  }
}

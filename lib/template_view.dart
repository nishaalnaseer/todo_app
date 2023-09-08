import 'package:flutter/material.dart';
import 'package:todo_app/models.dart';

class TemplateView extends StatefulWidget {
  const TemplateView({super.key});

  @override
  State<TemplateView> createState() => _TemplateViewState();
}

class _TemplateViewState extends State<TemplateView> {

  Container aTemplate(Template template) {
    Container container = Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        children: [
          Text("data"),
          ListView.builder(
            shrinkWrap: true, // To ensure the ListView takes up only the necessary space
            itemCount: template.thingsTodo.length,
            itemBuilder: (BuildContext context, int index) {
              final key = template.thingsTodo.keys.elementAt(index);
              final value = template.thingsTodo[key];

              return Container(
                // Build your Container widget here based on key and value
                // Example: Text(key), Text(value.toString()), etc.
              );
            },
          ),
        ],
      ),
    );

    return container;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            onPressed: () {  }, 
            icon: Icon(
              Icons.add,
              color: Colors.blue[900],
              size: 30,
            ),
          ),
        ),
        Container(
          height: 570,
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Set the border radius
              border: Border.all(
                color: Colors.deepPurple, // Set the border color
                width: 2.0,          // Set the border width
              ),
            ),
            child: ListView(
              children: [

              ],
            ),
          ),
        )
      ],
    );
  }
}

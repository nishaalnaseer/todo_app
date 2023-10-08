import 'package:todo_app/errors.dart';

class Template{
  final int id;
  String name;
  Map<int, String> thingsTodo;
  int lastSyncPoint = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  Template(this.thingsTodo, this.name, this.id);

  void update(int id, String thing) {
    thingsTodo.putIfAbsent(id, () => thing);
  }

  void remove(String thing) {
    thingsTodo.remove(thing);
  }
}


class ToDoThing{
  int id;
  String details;
  bool done;

  ToDoThing({
    required this.id,
    required this.details,
    required this.done,
  });
}


class Todo{
  final int id;
  String name;
  Map<int, ToDoThing> thingsTodo = {};
  bool _completed = false;
  int lastSyncPoint = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  Todo(List<String>? stuff, Template? template, this.name, this.id) {
    int ids = 0;
    if(template != null) {
      template.thingsTodo.forEach((key, value) {
        ToDoThing thing = ToDoThing(id: 0, details: value, done: false);
        thingsTodo.putIfAbsent(ids, () => thing);
        ids++;
      });
    }

    if(stuff != null) {
      for (String details in stuff) {
        ToDoThing thing = ToDoThing(id: 0, details: details, done: false);
        thingsTodo.putIfAbsent(ids, () => thing);
        ids++;
      }
    }
  }

  // void add(String thing) {
  //   if(thingsTodo.containsKey(thing)) {
  //     throw ThingExists("$thing is already in template");
  //   }
  //
  //   thingsTodo.putIfAbsent(thing, () => false);
  // }
  //
  // void update(String thing) {
  //   if(!thingsTodo.containsKey(thing)) {
  //     throw ThingExistsNot("$thing is not in template");
  //   }
  //
  //   thingsTodo.update(thing, (value) => false);
  // }
  //
  // void remove(String thing) {
  //   if(!thingsTodo.containsKey(thing)) {
  //     throw ThingExistsNot("$thing is not in template");
  //   }
  //
  //   thingsTodo.remove(thing);
  // }
  //
  // void completeTask(String thing) {
  //   if(!thingsTodo.containsKey(thing)) {
  //     throw ThingExistsNot("$thing is not in template");
  //   }
  //
  //   thingsTodo.update(thing, (value) => true);
  // }

  void completeToDo() {
    _completed = true;
  }
}

class User{
  final String username;
  int lastSyncPoint;

  User({
    required this.username,
    required this.lastSyncPoint
  });
}

import 'package:flutter/material.dart';
import 'package:todo_app/errors.dart';

class Template{
  String name;
  Map<String, bool> thingsTodo = {};
  Template(List<String> stuff, this.name) {
    for (String value in stuff) {
      thingsTodo.putIfAbsent(value, () => false);
    }
  }

  void add(String thing) {
    if(thingsTodo.containsKey(thing)) {
      throw ThingExists("$thing is already in template");
    }

    thingsTodo.putIfAbsent(thing, () => false);
  }

  void update(String thing) {
    if(!thingsTodo.containsKey(thing)) {
      throw ThingExistsNot("$thing is not in template");
    }

    thingsTodo.update(thing, (value) => false);
  }

  void remove(String thing) {
    if(!thingsTodo.containsKey(thing)) {
      throw ThingExistsNot("$thing is not in template");
    }

    thingsTodo.remove(thing);
  }
}

class Todo{
  String name;
  Map<String, bool> thingsTodo = {};
  bool _completed = false;

  Todo(List<String>? stuff, Template? template, this.name) {
    if(stuff != null) {
      for (String value in stuff) {
        thingsTodo.putIfAbsent(value, () => false);
      }
    }

    if(template != null) {
      thingsTodo.addAll(template.thingsTodo);
    }
  }

  void add(String thing) {
    if(thingsTodo.containsKey(thing)) {
      throw ThingExists("$thing is already in template");
    }

    thingsTodo.putIfAbsent(thing, () => false);
  }

  void update(String thing) {
    if(!thingsTodo.containsKey(thing)) {
      throw ThingExistsNot("$thing is not in template");
    }

    thingsTodo.update(thing, (value) => false);
  }

  void remove(String thing) {
    if(!thingsTodo.containsKey(thing)) {
      throw ThingExistsNot("$thing is not in template");
    }

    thingsTodo.remove(thing);
  }

  void completeTask(String thing) {
    if(!thingsTodo.containsKey(thing)) {
      throw ThingExistsNot("$thing is not in template");
    }

    thingsTodo.update(thing, (value) => true);
  }

  void completeToDo() {
    _completed = true;
  }
}

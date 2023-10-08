import 'package:isar/isar.dart';

part 'models.g.dart';

@Collection()
class User {
  Id id = isarAutoIncrementId;
  late String name;
  late int lastSyncPoint;
}

@Collection()
class ThingsToDo {
  Id id = isarAutoIncrementId;
  late String details;
  late bool done;

  @Backlink(to: "Template")
  
}

@Collection()
class Template {
  Id id = isarAutoIncrementId;
  late String activity;
  late int lastSyncPoint;

  final thingsToDo = IsarLinks<ThingsToDo>();
}


@Collection()
class ToDo {
  Id id = isarAutoIncrementId;
  late String activity;
  late bool completed;
  late int lastSyncPoint;

  final thingsToDo = IsarLinks<ThingsToDo>();
}
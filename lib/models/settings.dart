import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;

  @Index(unique: true,replace: true)
  String key = "";

  String value = "";
}

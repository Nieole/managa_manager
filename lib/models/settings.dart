import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;

  String savePath = "";
  String email = "";
  String password = "";
  String token = "";
  String expire = "";
}

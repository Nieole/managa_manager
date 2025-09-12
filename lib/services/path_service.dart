import 'package:file_picker/file_picker.dart';

class PathService {
  static Future<String?> pickDirectory() async {
    final result = await FilePicker.platform.getDirectoryPath();
    return result;
  }
}



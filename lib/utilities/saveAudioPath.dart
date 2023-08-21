import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> saveAudioToLocalPath(String audioPath)async{
Directory documentsDirectory=await getApplicationDocumentsDirectory();
String fileName=audioPath.split('/').last;
File audioPathInCache=File(audioPath);
File newfile=File('${documentsDirectory.path}/$fileName');
await audioPathInCache.copy(newfile.path);
return newfile.path;
}
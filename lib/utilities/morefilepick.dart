import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void ShowSnackBar({required BuildContext context,required String content}){
 ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text(content))
 );
}
Future<String?> pickAudioFile(BuildContext context) async {
  debugPrint("entered");
  String? filePath;
  try {
    debugPrint("awaitin ");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.audio,
      //allowedExtensions: ['mp3', 'wav', 'aac', 'flac'], // Add more audio file extensions if needed
    
      // Add more audio file extensions if needed
    );
    debugPrint("gotit");
    if(result==null){
      debugPrint("return null");
      return null;
    }
  
      filePath = result.files.single.path;
    
  } catch (e) {
    ShowSnackBar(context: context, content: e.toString());
  }
  return filePath;
}

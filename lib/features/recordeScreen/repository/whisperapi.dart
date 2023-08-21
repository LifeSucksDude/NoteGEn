//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     this is the api key
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notegenierecreated/features/recordeScreen/views/recorder.dart';

import 'apikey.dart';
import 'package:http/http.dart' as http;

Future<String> convertSpeechToText(String filePath)async{
  const apiKey=apiSecretKey;
  var url=Uri.https("api.openai.com","v1/audio/transcriptions");
  var request=http.MultipartRequest('POST',url);
  request.headers.addAll(({"Authorization":"Bearer $apiKey"}));
  request.fields["model"]="whisper-1";
  request.fields["language"]="en";
  request.files.add(await http.MultipartFile.fromPath('file', filePath));
  var response=await request.send();
  var newresponse=await http.Response.fromStream(response);
  final responseData=json.decode(newresponse.body);
  print(responseData);
  return "asdfasd";
}
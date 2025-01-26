import 'dart:async';
import 'package:dio/dio.dart';
import 'package:universal_io/io.dart';

///Extension to handle maps for Form Data request
extension FormDataExtension on Map<String, dynamic> {
  
  ///Turns current Map to FormData
  Future<FormData> toFormData() async{
    final newMap = <String,dynamic>{};
    final initialMap = this;
    await Future.forEach(initialMap.keys, (String key) async {
      if(initialMap[key] is File){
        final file = initialMap[key] as File;
        newMap[key]= await MultipartFile.fromFile(file.path);
      }else{
        newMap[key]=initialMap[key];
      }
    });
    return FormData.fromMap(newMap);
  }
}

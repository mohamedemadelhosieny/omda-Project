import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:taskes_project/login_Api/login_model.dart';

class Loginprovider with ChangeNotifier{
  Loginmodel ?loginmodel;
    Map<String,dynamic>? data;
  Future<dynamic>login({
   
    String?email,
    String?password,
    
  })async{
    var dio=Dio();
     dio.options.headers={
      "lang":"ar",
      "Content-Type":"application/json"
     };
     data={
     
      "email":email,
      "password":password,
      
     };
     notifyListeners();
     final response=await dio.post("https://student.valuxapps.com/api/login",
     data: data,
     ); 
     print("data register "+response.data.toString());
    loginmodel= Loginmodel .fromJson(response.data);
  }
}
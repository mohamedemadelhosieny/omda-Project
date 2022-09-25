import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:login/product_model.dart';

class HomeProvider with ChangeNotifier {
  HomeModel? data;
  Future<dynamic> getData() async {
    var dio = Dio();
    dio.options.headers = {
      "lang": "en",
      "Content-Type": "application/json",
    };

    final response = await dio.get("https://student.valuxapps.com/api/home");
    data = HomeModel.fromJson(response.data);
    notifyListeners();
  }
}

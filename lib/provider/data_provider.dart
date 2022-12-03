import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/TestModel.dart';


class DataProvider with ChangeNotifier {
  Users? userModel;

  DataProvider() {
    getUsersData();
  }


  List<Users> users = [];




  getUsersData() async {
    await Future.delayed(Duration(microseconds: 10));
    String url = 'https://dummyjson.com/users';
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
      });
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body)["users"];

        users = List.generate(res.length, (index) => Users.fromJson(res[index]));
        notifyListeners();
      } else {
        print("response.statusCode");
        print(response.statusCode);
        print(response.body);
      }
    } catch (e) {
      print("STRING E");
      print(e);
    }
  }


}

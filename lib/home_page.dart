import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'models/TestModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Users> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 230,
        child: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
          getUsersData();

          if (list.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
            ));
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            var list = snapshot.data!;
            return Container(

            );
          }
          return const Text("Error while calling getData");
        }),
      ),
    );
  }

  getUsersData() async {
    await Future.delayed(Duration(microseconds: 10));
    String url = 'https://dummyjson.com/users';
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
      });
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body)["users"];

        list = List.generate(res.length, (index) => Users.fromJson(res[index]));
        setState(() {

        });
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

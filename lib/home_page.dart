import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:kikly/widgets/get_button.dart';
import 'package:kikly/widgets/search_field.dart';
import 'package:kikly/widgets/user_widget.dart';

import 'extras/app_text_style.dart';
import 'extras/colors.dart';
import 'models/TestModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Users> list = [];
  String selectedLocation = 'Location';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.textFieldFill,
      body: Column(
        children: [
          getHeight(35),
          SearchField(),
          getHeight(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                locationDropDown(),
                const Icon(
                  IconlyLight.filter,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Expanded(
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
              if (list.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            String check = (index % 2 == 0) ? "Open" : "Close";
                            return UserWidget(list[index], check);
                          },
                        ),
                      ),
                      getHeight(5.h),
                      GetButton(
                        text: "VIEW MAP",
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              }
              return const Text("Error while calling getData");
            }),
          ),
        ],
      ),
    );
  }

  SizedBox getHeight(double h) {
    return SizedBox(
      height: h,
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
        setState(() {});
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

  Container locationDropDown() {
    return Container(
      height: 45,
      width: 230.w,
      decoration: BoxDecoration(
          color: CColors.businessCardColor,
          borderRadius: BorderRadius.circular(20)),
      child: DropdownButton<String>(
        value: selectedLocation,
        isExpanded: true,
        icon: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: const Icon(
              Icons.expand_more,
            )),
        elevation: 16,
        style: AppTextStyle.molengo(
          style: TextStyle(
            fontSize: 16.w,
            color: CColors.fieldText,
          ),
        ),
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            selectedLocation = newValue!;
          });
        },
        items: <String>[
          'Location',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: EdgeInsets.only(left: 17.w),
              child: Text(
                value,
                style: AppTextStyle.molengo(
                  style: TextStyle(
                    fontSize: 16.w,
                    color: CColors.fieldText,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }


}

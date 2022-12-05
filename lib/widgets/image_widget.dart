import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({required this.images, required this.index, Key? key})
      : super(key: key);
  List<String> images;
  int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.blue,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          images[index],
        ),
      ),
    );
  }
}

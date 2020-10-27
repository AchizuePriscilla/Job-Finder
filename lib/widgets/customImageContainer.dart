import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final double height;
  final double width;
  final String url;

  CustomImageContainer(
      {@required this.height, @required this.width, @required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
        color: Colors.grey,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(url),
        ),
      ),
    );
  }
}

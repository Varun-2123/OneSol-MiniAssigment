// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Uihelper {
  static Widget funtionGood({String? path}) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            path ?? "assets/images/QrCode.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 160,
          right: 10,
          child: Icon(Icons.comment, color: Colors.white, size: 50),
        ),
        Positioned(
          bottom: 230,
          right: 10,
          child: Icon(Icons.bar_chart_outlined, color: Colors.white, size: 50),
        ),
        Positioned(
          bottom: 300,
          right: 10,
          child: Icon(Icons.thumb_up, color: Colors.white, size: 50),
        ),
        Positioned(
          bottom: 50,
          right: 10,
          child: Icon(Icons.add_box_sharp, color: Colors.white, size: 50),
        ),
      ],
    );
  }
}

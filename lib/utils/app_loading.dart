import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 50,
            width: 50,
            color: Colors.red,
            padding: const EdgeInsets.all(3),
            child: const CupertinoActivityIndicator()));
  }
}

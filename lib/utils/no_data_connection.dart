import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(
            child: Text("Please check "
                "Internet Connection")));
  }
}

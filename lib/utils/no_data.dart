import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white, child: const Center(child: Text("No Data Found")));
  }
}

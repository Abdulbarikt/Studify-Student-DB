import 'package:flutter/material.dart';

class Sizedbox extends StatelessWidget {
  final  height;
  const Sizedbox({super.key,required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:height ,);
  }
}
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/empty.json',
        repeat: true,
        height: MediaQuery.sizeOf(context).height/3,
        fit: BoxFit.cover
        ),
    );
  }

}
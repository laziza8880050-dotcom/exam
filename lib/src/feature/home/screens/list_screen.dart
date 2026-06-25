import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child:Lottie.asset('assets/lottie/ptica.json') ,);
  }
}

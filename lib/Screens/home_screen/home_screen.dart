import 'package:flutter/material.dart';
import 'components/body.dart';

//Author: Ting Sen
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
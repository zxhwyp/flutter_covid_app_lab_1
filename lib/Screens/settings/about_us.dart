import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatefulWidget {
  @override
  _AboutUsViewState createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("关于我们"), centerTitle: true),
        body: Center(
            child: Text(
          "致力于提供最新的新冠疫情数据",
          textAlign: TextAlign.center,
        )));
  }
}

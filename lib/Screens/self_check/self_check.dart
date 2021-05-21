import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/model/answer_model.dart';
import 'package:toast/toast.dart';
import '../../constants.dart';

//Author: Qianzhen

class SelfCheck extends StatefulWidget {
  _SelfCheckState createState() => _SelfCheckState();
}

class _SelfCheckState extends State<SelfCheck> {
  int current = 0;
  int total = 5;

  List<AnswerModel> answers = [
    AnswerModel(
        trouble: '是否\n存在以下情形:', replenish: '是否\n存在发烧，咳嗽，打喷嚏，\n喉咙痛，呼吸困难？'),
    AnswerModel(trouble: '是否\n嗅觉或味觉功能衰减？'),
    AnswerModel(trouble: '是否\n感觉全身酸痛或者呼吸困难？'),
    AnswerModel(trouble: '是否\n鼻塞或者流鼻涕？'),
    AnswerModel(trouble: '是否\n呕吐或者恶心等状况？'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body());
  }

  Widget body() {
    int _index = min(current, 4);
    AnswerModel _answerModel = answers[_index];
    var size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        color: kPrimaryColor2,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: textWhite,
                  ),
                ),
              ),
              Container(
                height: size.height,
                color: kPrimaryColor2,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 215,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "新冠 \n自测",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: textWhite),
                              ),
                            ),
                            Image.asset("assets/images/image_2.png")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 185),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 60,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: 2.5,
                                      child: LinearProgressIndicator(
                                          backgroundColor: Colors.grey,
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                          value: current / total),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "$current/$total",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 19,
                                        color: textWhite),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                _answerModel.trouble,
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: textWhite,
                                    height: 1.6),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                _answerModel.replenish ?? '',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    height: 1.7,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: textWhite),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Visibility(
                                visible: current < 5,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: (size.width - 120) / 2,
                                      child: FlatButton(
                                          color: textWhite,
                                          onPressed: answerNo,
                                          child: Text(
                                            "没有",
                                            style: TextStyle(fontSize: 18),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      width: (size.width - 120) / 2,
                                      child: FlatButton(
                                          color: textWhite,
                                          onPressed: answerYes,
                                          child: Text(
                                            "有",
                                            style: TextStyle(fontSize: 18),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void answerNo() {
    next();
  }

  void answerYes() {
    next();
  }

  void next() {
    setState(() {
      current++;
    });
    if (current == 5) {
      Toast.show("自测完成 !", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }
}

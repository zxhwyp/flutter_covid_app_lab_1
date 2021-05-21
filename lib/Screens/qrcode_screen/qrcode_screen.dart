import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/utils/data_util.dart';

//Author:Zehao
class QRScreen extends StatelessWidget {
  const QRScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('健康码'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                //color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "个人健康信息",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10, bottom: 5)),
                          Text(
                            "姓名: xxxx",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 5, bottom: 10)),
                          Text(
                            "状态: 良好",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: <Widget>[
                    Text(DateUtil.formatDate(DateTime.now(),
                        format: DateFormats.y_mo_d_h_m)),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    Image.asset(
                      'assets/images/code.png',
                      width: 200,
                      height: 200,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

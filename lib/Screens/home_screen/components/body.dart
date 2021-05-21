import 'package:flutter_covid_app_lab_1/utils/data_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/constants.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_covid19.dart';
import 'package:flutter_session/flutter_session.dart';
import 'background.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            width: size.width,
            child: Background(
              child: Column(
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: size.height * 0.3,
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        FutureBuilder(
                          future: FlutterSession().get("token"),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            return Text(
                              snapshot.hasData
                                  ? "欢迎, " + snapshot.data['username']
                                  : "登录...",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Text(
                          '美国新冠数据',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '最近更新： ${DateTime.now().day} ${DateUtil.getMonth(DateTime.now(), short: true)} ${DateTime.now().year}',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      ItemCard(
                        image: "assets/images/confirmed.png",
                        text: '确诊人数',
                        number: Covid19VM.of(context, true)
                                .covid19totalModel
                                ?.data
                                ?.summary
                                ?.totalCases
                                ?.toString() ??
                            "0",
                        press: () {},
                      ),
                      ItemCard(
                        image: "assets/images/recovered.png",
                        text: '康复人数',
                        number: Covid19VM.of(context, true)
                                .covid19totalModel
                                ?.data
                                ?.summary
                                ?.recovered
                                ?.toString() ??
                            "0",
                        press: () {},
                      ),
                      ItemCard(
                        image: "assets/images/death.png",
                        text: '死亡人数',
                        number: Covid19VM.of(context, true)
                                .covid19totalModel
                                ?.data
                                ?.summary
                                ?.deaths
                                ?.toString() ??
                            "0",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  Row(
                    children: <Widget>[
                      ItemCard(
                        image: "assets/images/self-check.png",
                        text: '自我检查',
                        press: () {
                          Navigator.of(context).pushNamed('/self_check');
                        },
                      ),
                      ItemCard(
                        image: "assets/images/prevention.png",
                        text: '自我防护',
                        press: () {
                          Navigator.of(context).pushNamed('/prevention');
                        },
                      ),
                      ItemCard(
                        image: "assets/images/statistics.png",
                        text: '统计数据',
                        press: () {
                          Navigator.of(context).pushNamed('/statistics');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

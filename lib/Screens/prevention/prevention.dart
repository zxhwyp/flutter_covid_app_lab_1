import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/model/prevention_model.dart';

const TextStyle DeepTextStyle = TextStyle(
    fontSize: 20,
    color: Color.fromRGBO(10, 84, 255, 1.0),
    fontWeight: FontWeight.w500);

const TextStyle BlackextStyle =
    TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500);

class Prevention extends StatefulWidget {
  @override
  _PreventionState createState() => _PreventionState();
}

class _PreventionState extends State<Prevention> {
  Size get _size => MediaQuery.of(context).size;
  MediaQueryData get _media => MediaQuery.of(context);
  int _page = 0;
  PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: PageView(
            controller: _controller,
            children: _models.map((e) => pageViewItem(e)).toList(),
            onPageChanged: (page) {
              setState(() {
                _page = page;
              });
            },
          )),
          Container(
              margin: EdgeInsets.only(bottom: _media.padding.bottom + 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        if (_page != 3) {
                          _page += 1;
                          _controller.jumpToPage(_page);
                        }
                      },
                      child: Text(
                        '跳过',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      )),
                  tip(),
                  SizedBox(width: 20),
                  Container(
                      width: 90,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color.fromRGBO(10, 84, 255, 1.0),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            if (_page < 3) {
                              _page += 1;
                              _controller.jumpToPage(_page);
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            '下一步',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ))),
                ],
              ))
        ],
      ),
    );
  }

  Widget tip() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(4, (index) {
            return _page == index
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(10, 84, 255, 0.5)),
                        borderRadius: BorderRadius.circular(6)),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(10, 84, 255, 0.5),
                        shape: BoxShape.circle),
                  );
          }),
        ),
      ),
    );
  }

  Widget pageViewItem(PreventionModel model) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: _media.padding.top + 40),
          child: Image.asset(
            model.image,
            width: _size.width * 4 / 5,
            height: _size.width * 4 / 5,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(height: 50, child: model.richText),
        SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            model.describe,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  List<PreventionModel> get _models => <PreventionModel>[
        PreventionModel(
            image: 'assets/images/tip1.png',
            richText: tip1,
            describe: '保持与其他人的接触距离，防止病毒传染'),
        PreventionModel(
            image: 'assets/images/tip2.png',
            richText: tip2,
            describe: '用香皂洗手，擦洗双手至少20秒钟'),
        PreventionModel(
            image: 'assets/images/tip3.png',
            richText: tip3,
            describe: '出门需要佩戴口罩'),
        PreventionModel(
            image: 'assets/images/tip4.png',
            richText: tip4,
            describe: '尽量不要去人多的地方或者参加聚会'),
      ];

  RichText get tip1 => RichText(
          text: TextSpan(text: '避免', style: BlackextStyle, children: [
        TextSpan(
          text: ' 过紧',
          style: DeepTextStyle,
        ),
        TextSpan(
          text: ' 接触',
          style: BlackextStyle,
        ),
      ]));

  RichText get tip2 => RichText(
          text: TextSpan(text: '勤 ', style: BlackextStyle, children: [
        TextSpan(
          text: '洗手 ',
          style: DeepTextStyle,
        ),
      ]));
  RichText get tip3 => RichText(
          text: TextSpan(text: '佩戴 ', style: BlackextStyle, children: [
        TextSpan(
          text: '口罩 ',
          style: DeepTextStyle,
        ),
        TextSpan(
          text: '出门 ',
          style: BlackextStyle,
        ),
      ]));
  RichText get tip4 => RichText(
          text: TextSpan(text: '待在 ', style: BlackextStyle, children: [
        TextSpan(
          text: '家里',
          style: DeepTextStyle,
        ),
      ]));
}

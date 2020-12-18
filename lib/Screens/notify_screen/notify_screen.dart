import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_covid19.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({Key key}) : super(key: key);
  @override
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  Timer timer;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Covid19VM.of(context).covid19NotifyGet();
      countdown();
    });
  }

  void countdown() {
    timer = new Timer.periodic(new Duration(seconds: 5), (timer) {
      Covid19VM.of(context).covid19NotifyGet();
    });
  }

  @override
  void dispose() {
    if (timer != null && timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Notification'),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Area: ${Covid19VM.of(context, true).covid19notifyModel?.locations[index].state}",
                                          style:
                                              TextStyle(color: Colors.black38)),
                                      Text(
                                          "Confirmed: ${Covid19VM.of(context, true).covid19notifyModel?.locations[index].latest.confirmed}",
                                          style:
                                              TextStyle(color: Colors.black38))
                                    ]),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Deaths: ${Covid19VM.of(context, true).covid19notifyModel?.locations[index].latest.deaths}",
                                          style:
                                              TextStyle(color: Colors.black38)),
                                    ])
                              ]))),
                );
              },
              itemCount: (Covid19VM.of(context, true)
                              .covid19notifyModel
                              ?.locations
                              ?.length ??
                          0) >
                      10
                  ? 10
                  : (Covid19VM.of(context, true)
                          .covid19notifyModel
                          ?.locations
                          ?.length ??
                      0))),
    );
  }
}

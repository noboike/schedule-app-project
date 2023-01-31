import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'uiAnimation.dart';
import 'glob.dart';

class _list1_shape extends StatelessWidget {
  const _list1_shape(
      {super.key,
      required this.name,
      required this.remain,
      required this.location,
      required this.time,
      required this.isDone});
  final String name;
  final String remain;
  final String location;
  final String time;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    var contWidth = MediaQuery.of(context).size.width - (80 * ratio);
    return Opacity(
      opacity: 1,
      child: Container(
        width: contWidth,
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 86, 86, 86),
          border: Border(
            right: BorderSide(
              width: 10 * ratio,
              color: (pColor1 as Color).withOpacity(
                  context.watch<glob>().app_language == 'arabic' ? 1 : 0),
            ),
            left: BorderSide(
              width: 10 * ratio,
              color: (pColor1 as Color).withOpacity(
                  context.watch<glob>().app_language == 'arabic' ? 0 : 1),
            ),
          ),
        ),
        child: Opacity(
          opacity: 0,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(51, 51, 51, 1),
                  borderRadius: BorderRadius.circular(12 * ratio),
                ),
                width: contWidth - 82 * ratio,
                child: Padding(
                    padding: EdgeInsets.all(20 * ratio),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 19.08 * ratio,
                              color: Colors.white,
                              fontFamily: context.watch<glob>().app_language),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 15 * ratio,
                        ),
                        Visibility(
                          visible: !isDone,
                          child: Text(
                            remain,
                            style: TextStyle(
                                fontSize: 19.08 * ratio,
                                color: pColor1,
                                fontFamily: 'english'),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(
                          height: 15 * ratio,
                        ),
                        Text(
                          location,
                          style: TextStyle(
                              fontSize: 16.00 * ratio,
                              color: Colors.white,
                              fontFamily: context.watch<glob>().app_language),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _list1_shape2 extends StatelessWidget {
  const _list1_shape2(
      {super.key,
      required this.name,
      required this.remain,
      required this.location,
      required this.time,
      required this.isDone});
  final String name;
  final String remain;
  final String location;
  final String time;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    var contWidth = MediaQuery.of(context).size.width - (80 * ratio);
    return Container(
      margin: EdgeInsets.only(left: 40 * ratio, right: 40 * ratio),
      width: contWidth,
      decoration: BoxDecoration(
          // color: Color.fromARGB(255, 86, 86, 86),
          // border: Border(
          //     right: BorderSide(
          //         width: 10 * ratio, color: Color.fromRGBO(234, 205, 172, 1))),
          ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          //ignore this
          Align(
            alignment: Alignment.centerRight,
            child: _list1_shape(
              name: name,
              remain: remain,
              location: location,
              time: time,
              isDone: isDone,
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.watch<glob>().darkMode
                      ? Color.fromRGBO(51, 51, 51, 1)
                      : Color.fromRGBO(252, 241, 217, 1),
                  borderRadius: BorderRadius.circular(12 * ratio),
                ),
                width: contWidth - 82 * ratio,
                child: Padding(
                    padding: EdgeInsets.all(20 * ratio),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 19.08 * ratio,
                              color: context.watch<glob>().darkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: context.watch<glob>().app_language),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 15 * ratio,
                        ),
                        Visibility(
                          visible: !isDone,
                          child: Text(
                            remain,
                            style: TextStyle(
                                fontSize: 19.08 * ratio,
                                color: pColor1,
                                fontFamily: 'english'),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(
                          height: 15 * ratio,
                        ),
                        Text(
                          location,
                          style: TextStyle(
                              fontSize: 16.00 * ratio,
                              color: context.watch<glob>().darkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: context.watch<glob>().app_language),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    )),
              ),
              Container(
                width: 82 * ratio,
                height: (30 + 60) * ratio,
                // color: pageColor,
                child: Stack(clipBehavior: Clip.none, children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 10 * ratio,
                      height: 30 * ratio,
                      color: pageColor,
                      margin: EdgeInsets.only(bottom: 60 * ratio),
                      child: Container(
                        width: 10 * ratio,
                        height: 10 * ratio,
                        decoration: BoxDecoration(
                            color: pColor1,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10 * ratio),
                              bottomLeft: Radius.circular(10 * ratio),
                            )),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(left: 30 * ratio),
                      width: 30 * ratio,
                      height: 30 * ratio,
                      color: pageColor,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      time,
                      style: TextStyle(
                          color: pColor1,
                          fontSize: 14.57 * ratio,
                          fontFamily: 'inter'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 10 * ratio,
                      height: 30 * ratio,
                      color: pageColor,
                      margin: EdgeInsets.only(top: 60 * ratio),
                      child: Container(
                        width: 10 * ratio,
                        height: 10 * ratio,
                        decoration: BoxDecoration(
                            color: pColor1,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10 * ratio),
                              topLeft: Radius.circular(10 * ratio),
                            )),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _list1_shape2_en extends StatelessWidget {
  const _list1_shape2_en(
      {super.key,
      required this.name,
      required this.remain,
      required this.location,
      required this.time,
      required this.isDone});
  final String name;
  final String remain;
  final String location;
  final String time;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    var contWidth = MediaQuery.of(context).size.width - (80 * ratio);
    return Container(
      margin: EdgeInsets.only(left: 40 * ratio, right: 40 * ratio),
      width: contWidth,
      decoration: BoxDecoration(
          // color: Color.fromARGB(255, 86, 86, 86),
          // border: Border(
          //     right: BorderSide(
          //         width: 10 * ratio, color: Color.fromRGBO(234, 205, 172, 1))),
          ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          //ignore this
          Align(
            alignment: Alignment.centerRight,
            child: _list1_shape(
              name: name,
              remain: remain,
              location: location,
              time: time,
              isDone: isDone,
            ),
          ),
          Row(
            children: [
              Container(
                width: 82 * ratio,
                height: (30 + 60) * ratio,
                // color: pageColor,
                child: Stack(clipBehavior: Clip.none, children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 10 * ratio,
                      height: 30 * ratio,
                      color: pageColor,
                      margin: EdgeInsets.only(bottom: 60 * ratio),
                      child: Container(
                        width: 10 * ratio,
                        height: 10 * ratio,
                        decoration: BoxDecoration(
                            color: pColor1,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10 * ratio),
                              bottomLeft: Radius.circular(10 * ratio),
                            )),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 10 * ratio,
                      height: 30 * ratio,
                      color: pageColor,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      time,
                      style: TextStyle(color: pColor1, fontSize: 14.57 * ratio),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 10 * ratio,
                      height: 30 * ratio,
                      color: pageColor,
                      margin: EdgeInsets.only(top: 60 * ratio),
                      child: Container(
                        width: 10 * ratio,
                        height: 10 * ratio,
                        decoration: BoxDecoration(
                            color: pColor1,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10 * ratio),
                              topLeft: Radius.circular(10 * ratio),
                            )),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                  color: pColor2,
                  borderRadius: BorderRadius.circular(12 * ratio),
                ),
                width: contWidth - 82 * ratio,
                child: Padding(
                    padding: EdgeInsets.all(20 * ratio),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 19.08 * ratio,
                              color: context.watch<glob>().darkMode
                                  ? Colors.white
                                  : Colors.black),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 15 * ratio,
                        ),
                        Visibility(
                          visible: !isDone,
                          child: Text(
                            remain,
                            style: TextStyle(
                                fontSize: 19.08 * ratio, color: pColor1),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(
                          height: 15 * ratio,
                        ),
                        Text(
                          location,
                          style: TextStyle(
                              fontSize: 16.00 * ratio,
                              color: context.watch<glob>().darkMode
                                  ? Colors.white
                                  : Colors.black),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class list1 extends StatelessWidget {
  const list1(
      {super.key,
      required this.name,
      required this.remain,
      required this.location,
      required this.time,
      required this.isDone});
  final String name;
  final String remain;
  final String location;
  final String time;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20 * ratio,
          margin: EdgeInsets.only(right: 40 * ratio, left: 40 * ratio),
          child: Stack(
            children: [
              Align(
                alignment: context.watch<glob>().app_language == 'arabic'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 10 * ratio,
                  height: 20 * ratio,
                  color: pColor1,
                ),
              )
            ],
          ),
        ),
        context.watch<glob>().app_language == 'arabic'
            ? _list1_shape2(
                name: name,
                remain: remain,
                location: location,
                time: time,
                isDone: isDone,
              )
            : _list1_shape2_en(
                name: name,
                remain: remain,
                location: location,
                time: time,
                isDone: isDone,
              ),
        Container(
          height: 20 * ratio,
          margin: EdgeInsets.only(right: 40 * ratio, left: 40 * ratio),
          child: Stack(
            children: [
              Align(
                alignment: context.watch<glob>().app_language == 'arabic'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 10 * ratio,
                  height: 20 * ratio,
                  color: pColor1,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class list2 extends StatelessWidget {
  const list2(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3, required this.index, required this.id});
  final String text1;
  final String text2;
  final String text3;
  final int index;
  final String id;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width - (80 * ratio);
    return Container(
        padding: EdgeInsets.all(20 * ratio),
        margin: EdgeInsets.only(bottom: 20 * ratio),
        decoration: BoxDecoration(
            color: pColor2, borderRadius: BorderRadius.circular(10 * ratio)),
        width: MediaQuery.of(context).size.width - (80 * ratio),
        child: Stack(
          children: [
            //edit-btn
            Visibility(
              visible: context.watch<glob>().editVisible,
              child: Align(
                alignment: context.watch<glob>().app_language == 'arabic' ? Alignment.topLeft : Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    context.read<glob>().deleteLecture(index, id);
                  },
                  child: Container(
                    width: 50 * ratio,
                    height: 50 * ratio,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 102, 102, 102),
                      borderRadius: BorderRadius.circular(10 * ratio)
                    ),
                    child: Center(
                      child: Container(
                        width: 24 * ratio,
                        height: 24 * ratio,
                        child: FittedBox(
                          child: Image.asset('assets/trash.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: context.watch<glob>().editVisible,
              child: Align(
                alignment: context.watch<glob>().app_language == 'arabic' ? Alignment.topLeft : Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    context.read<glob>().setSelectedLec(index);
                    context.read<glob>().goToAddPage('edit');
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: context.watch<glob>().app_language == 'arabic' ? 60 * ratio : 0,
                      right: context.watch<glob>().app_language == 'arabic' ? 0 : 60 * ratio,
                    ),
                    width: 50 * ratio,
                    height: 50 * ratio,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 102, 102, 102),
                      borderRadius: BorderRadius.circular(10 * ratio)
                    ),
                    child: Center(
                      child: Container(
                        width: 24 * ratio,
                        height: 24 * ratio,
                        child: FittedBox(
                          child: Image.asset('assets/edit.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Align(
                alignment: context.watch<glob>().app_language == 'arabic' ? Alignment.topRight : Alignment.topLeft,
                child: Container(
                  // color: Colors.blue,
                  width: _width - (context.watch<glob>().editVisible ? 20 + 50 + 20 + 10 + 50 + 10 : 0) * ratio,
                  child: Column(
                    crossAxisAlignment: context.watch<glob>().app_language == 'arabic'
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: TextStyle(
                          fontSize: 20 * ratio,
                          fontFamily: context.watch<glob>().app_language,
                          color: context.watch<glob>().darkMode
                              ? Colors.white
                              : Colors.black,
                        ),
                        textAlign: context.watch<glob>().app_language == 'arabic'
                            ? TextAlign.right
                            : TextAlign.left,
                      ),
                      SizedBox(
                        height: 20 * ratio,
                      ),
                      Text(
                        text2,
                        style: TextStyle(
                          fontSize: 16 * ratio,
                          fontFamily: 'english',
                          color: context.watch<glob>().darkMode
                              ? Colors.white
                              : Colors.black,
                        ),
                        textAlign: context.watch<glob>().app_language == 'arabic'
                            ? TextAlign.right
                            : TextAlign.left,
                      ),
                      Visibility(
                        visible: text3.length >= 10,
                        child: SizedBox(
                          height: 20 * ratio,
                        ),
                      ),
                      Visibility(
                        visible: text3.length >= 10,
                        child: Text(
                          text3,
                          style: TextStyle(
                            fontSize: 16 * ratio,
                            fontFamily: context.watch<glob>().app_language,
                            color: context.watch<glob>().darkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                          textAlign: context.watch<glob>().app_language == 'arabic'
                              ? TextAlign.right
                              : TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

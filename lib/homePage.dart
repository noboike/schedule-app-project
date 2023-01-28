import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'uiAnimation.dart';
import 'glob.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //text4
        Visibility(
          visible: !context.watch<glob>().nolec_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 100 * ratio, bottom: 20 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic'
                  ? 'لا توجد محاضرات اليوم!'
                  : 'No lectures today!',
              style: TextStyle(
                color: context.watch<glob>().darkMode
                    ? Colors.white
                    : Colors.black,
                fontSize: 20 * ratio,
                fontFamily: context.watch<glob>().app_language,
              ),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        //text2
        Visibility(
          visible: !context.watch<glob>().live_box_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 49 * ratio, bottom: 20 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic' ? 'الأن' : 'Now',
              style: TextStyle(
                  color: context.watch<glob>().darkMode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 36.68 * ratio,
                  fontFamily: context.watch<glob>().app_language),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        ),
        Visibility(
          visible: !context.watch<glob>().live_box_hidden,
          child: live_box(text: context.watch<glob>().live_lecture_name),
        ),
        //text1
        Visibility(
          visible: !context.watch<glob>().nextLec_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 49 * ratio, bottom: 20 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic'
                  ? 'المحاضرات القادمة'
                  : 'Next Lectures',
              style: TextStyle(
                  color: context.watch<glob>().darkMode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 36.68 * ratio,
                  fontFamily: context.watch<glob>().app_language),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        ),
        ...context.watch<glob>().next_lectures_widgets,
        //text3
        Visibility(
          visible: !context.watch<glob>().doneLec_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 49 * ratio, bottom: 20 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic'
                  ? 'المحاضرات المنتهية'
                  : 'Done Lectures',
              style: TextStyle(
                  color: context.watch<glob>().darkMode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 36.68 * ratio,
                  fontFamily: context.watch<glob>().app_language),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        ),
        ...context.watch<glob>().done_lectures_widgets,
      ],
    );
  }
}

class live_box extends StatelessWidget {
  const live_box({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    double ratio2 = 17 / text.length;
    ratio2 = ratio2 > 1 ? 1 : ratio2;
    return Container(
      margin: EdgeInsets.only(top: 16 * ratio, bottom: 62 * ratio),
      width: MediaQuery.of(context).size.width - (80 * ratio),
      height: 187 * ratio,
      decoration: BoxDecoration(
        color: pColor1,
        borderRadius: BorderRadius.circular(12 * ratio),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: (31.07 * ratio2) * ratio,
                color: context.watch<glob>().darkMode
                    ? Color.fromRGBO(77, 52, 47, 1)
                    : Colors.white,
                    fontFamily: context.watch<glob>().app_language,
              ),
            ),
          ),
          Align(
            alignment: context.watch<glob>().app_language == 'arabic'
                ? Alignment.bottomRight
                : Alignment.bottomLeft,
            //live box
            child: Container(
              margin: EdgeInsets.only(
                bottom: 12 * ratio,
                right: context.watch<glob>().app_language == 'arabic'
                    ? 20 * ratio
                    : 0,
                left: context.watch<glob>().app_language == 'arabic'
                    ? 0
                    : 20 * ratio,
              ),
              width: 94 * ratio,
              height: 26 * ratio,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.53),
                  borderRadius: BorderRadius.circular(21 * ratio)),
              child: Stack(
                children: [
                  //live ball
                  Align(
                    alignment: context.watch<glob>().app_language == 'arabic'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Opacity(
                      opacity: context
                          .watch<glob>()
                          .animated_live_ball['opacity']['value'],
                      child: Container(
                        width: 16 * ratio,
                        height: 16 * ratio,
                        margin: EdgeInsets.only(
                          right: context.watch<glob>().app_language == 'arabic'
                              ? 5 * ratio
                              : 0,
                          left: context.watch<glob>().app_language == 'arabic'
                              ? 0 * ratio
                              : 5 * ratio,
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(222, 99, 99, 1),
                            borderRadius: BorderRadius.circular(21 * ratio)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: context.watch<glob>().app_language == 'arabic'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.only(
                          right: context.watch<glob>().app_language == 'arabic'
                              ? 26 * ratio
                              : 0 * ratio,
                          left: context.watch<glob>().app_language == 'arabic'
                              ? 0 * ratio
                              : 26 * ratio,
                        ),
                        child: Text(
                          context.watch<glob>().live_box_countdown_text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.99 * ratio,
                              fontFamily: 'inter'),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'uiAnimation.dart';
import 'glob.dart';

class schedulePage extends StatelessWidget {
  const schedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    var nav_width = MediaQuery.of(context).size.width - (80 * ratio);
    var nav1 = [
      Container(
        width: 22 * ratio,
        height: 22 * ratio,
        child: FittedBox(
          child: Image.asset('assets/add.png'),
        ),
      ),
      SizedBox(
        width: 8 * ratio,
      ),
      Text(
        context.watch<glob>().app_language == 'arabic' ? 'إضافة' : 'Add',
        style: TextStyle(
            color: Colors.white,
            fontFamily: context.watch<glob>().app_language,
            fontSize: 24.77 * ratio),
      ),
    ];
    var nav1_en = [
      Container(
        width: 22 * ratio,
        height: 22 * ratio,
        child: FittedBox(
          child: Image.asset('assets/add.png'),
        ),
      ),
      SizedBox(
        width: 8 * ratio,
      ),
      Text(
        context.watch<glob>().app_language == 'arabic' ? 'إضافة' : 'Add',
        style: TextStyle(
            color: Colors.white,
            fontFamily: context.watch<glob>().app_language,
            fontSize: 24.77 * ratio),
      ),
      
      
    ];
    var nav2 = [
      Container(
        width: 22 * ratio,
        height: 22 * ratio,
        child: FittedBox(
          child: Image.asset(!context.watch<glob>().editVisible ? 'assets/edit.png' : 'assets/cancel.png'),
        ),
      ),
      SizedBox(
        width: 8 * ratio,
      ),
      Text(
        context.watch<glob>().app_language == 'arabic' ? 
        (!context.watch<glob>().editVisible ? 'تعديل' : 'إلغاء')
        :
         (!context.watch<glob>().editVisible ? 'Edit' : 'Cancel'),
        style: TextStyle(
            color: Colors.white,
            fontFamily: context.watch<glob>().app_language,
            fontSize: 24.77 * ratio),
      ),
    ];
    var nav2_en = [
      Container(
        width: 22 * ratio,
        height: 22 * ratio,
        child: FittedBox(
          child: Image.asset(!context.watch<glob>().editVisible ? 'assets/edit.png' : 'assets/cancel.png'),
        ),
      ),
      SizedBox(
        width: 8 * ratio,
      ),
      Text(
        context.watch<glob>().app_language == 'arabic' ? 
        (!context.watch<glob>().editVisible ? 'تعديل' : 'إلغاء')
        :
         (!context.watch<glob>().editVisible ? 'Edit' : 'Cancel'),
        style: TextStyle(
            color: Colors.white,
            fontFamily: context.watch<glob>().app_language,
            fontSize: 24.77 * ratio),
      ),
    ];
    return Column(
      children: [
        //nav
        Container(
          width: nav_width,
          height: 65 * ratio,
          margin: EdgeInsets.only(top: 34 * ratio),
          child: Stack(
            //add -btn
            children: [
              //nav1
              Align(
                alignment: context.watch<glob>().app_language == 'arabic'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: IgnorePointer(
                  ignoring: context.watch<glob>().editVisible,
                  child: GestureDetector(
                    onTap: () {
                      context.read<glob>().goToAddPage('add');
                    },
                    child: Opacity(
                      opacity: context.watch<glob>().editVisible ? 0.5 : 1,
                      child: Container(
                        width: (nav_width / 2) - 10 * ratio,
                        height: 65 * ratio,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(95, 140, 132, 1),
                            borderRadius: BorderRadius.circular(10 * ratio)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...context.watch<glob>().app_language == 'arabic' ? nav1 : nav1_en,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //nav2
              Align(
                alignment: context.watch<glob>().app_language == 'arabic'
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    context.read<glob>().edit_btn();
                  },
                  child: Container(
                    width: (nav_width / 2) - 10 * ratio,
                    height: 65 * ratio,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(140, 95, 127, 1),
                        borderRadius: BorderRadius.circular(10 * ratio)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...context.watch<glob>().app_language == 'arabic' ? nav2 : nav2_en,
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        //day 7
        //big text
        Container(
          width: MediaQuery.of(context).size.width - (80 * ratio),
          margin: EdgeInsets.only(top: 49 * ratio, bottom: 20 * ratio),
          child: Text(
            context.watch<glob>().app_language == 'arabic' ? 'الأحد' : 'Sunday',
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

        //small text
        Visibility(
          visible: !context.watch<glob>().day7_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 0 * ratio, bottom: 0 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic'
                  ? 'لاتوجد محاضرات'
                  : 'No lectures',
              style: TextStyle(
                  color: context.watch<glob>().darkMode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20 * ratio,
                  fontFamily: context.watch<glob>().app_language),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        ),

        ...context.watch<glob>().day7_widgets,

        //day 1

        //big text
        Container(
          width: MediaQuery.of(context).size.width - (80 * ratio),
          margin: EdgeInsets.only(top: 49 * ratio, bottom: 20 * ratio),
          child: Text(
            context.watch<glob>().app_language == 'arabic'
                ? 'الإثنين'
                : 'Monday',
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

        //small text
        Visibility(
          visible: !context.watch<glob>().day1_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 0 * ratio, bottom: 0 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic'
                  ? 'لاتوجد محاضرات'
                  : 'No lectures',
              style: TextStyle(
                  color: context.watch<glob>().darkMode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20 * ratio,
                  fontFamily: context.watch<glob>().app_language),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        ),

        ...context.watch<glob>().day1_widgets,

        //day2

        //big text
        Container(
          width: MediaQuery.of(context).size.width - (80 * ratio),
          margin: EdgeInsets.only(top: 49 * ratio, bottom: 20 * ratio),
          child: Text(
            context.watch<glob>().app_language == 'arabic'
                ? 'الثلاثاء'
                : 'Tuesday',
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

        //small text
        Visibility(
          visible: !context.watch<glob>().day2_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 0 * ratio, bottom: 0 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic'
                  ? 'لاتوجد محاضرات'
                  : 'No lectures',
              style: TextStyle(
                  color: context.watch<glob>().darkMode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20 * ratio,
                  fontFamily: context.watch<glob>().app_language),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        ),

        ...context.watch<glob>().day2_widgets,

        //big text
        Container(
          width: MediaQuery.of(context).size.width - (80 * ratio),
          margin: EdgeInsets.only(top: 49 * ratio, bottom: 20 * ratio),
          child: Text(
            context.watch<glob>().app_language == 'arabic'
                ? 'الأربعاء'
                : 'Wednesday',
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

        //small text
        Visibility(
          visible: !context.watch<glob>().day3_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 0 * ratio, bottom: 0 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic'
                  ? 'لاتوجد محاضرات'
                  : 'No lectures',
              style: TextStyle(
                  color: context.watch<glob>().darkMode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20 * ratio,
                  fontFamily: context.watch<glob>().app_language),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        ),

        ...context.watch<glob>().day3_widgets,

        //big text
        Container(
          width: MediaQuery.of(context).size.width - (80 * ratio),
          margin: EdgeInsets.only(top: 49 * ratio, bottom: 20 * ratio),
          child: Text(
            context.watch<glob>().app_language == 'arabic'
                ? 'الخميس'
                : 'Thursday',
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

        //small text
        Visibility(
          visible: !context.watch<glob>().day4_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 0 * ratio, bottom: 0 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic'
                  ? 'لاتوجد محاضرات'
                  : 'No lectures',
              style: TextStyle(
                  color: context.watch<glob>().darkMode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20 * ratio,
                  fontFamily: context.watch<glob>().app_language),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        ),

        ...context.watch<glob>().day4_widgets,

        //big text
        Container(
          width: MediaQuery.of(context).size.width - (80 * ratio),
          margin: EdgeInsets.only(top: 49 * ratio, bottom: 20 * ratio),
          child: Text(
            context.watch<glob>().app_language == 'arabic'
                ? 'الجمعة'
                : 'Friday',
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

        //small text
        Visibility(
          visible: !context.watch<glob>().day5_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 0 * ratio, bottom: 0 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic'
                  ? 'لاتوجد محاضرات'
                  : 'No lectures',
              style: TextStyle(
                  color: context.watch<glob>().darkMode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20 * ratio,
                  fontFamily: context.watch<glob>().app_language),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        ),

        ...context.watch<glob>().day5_widgets,

        //big text
        Container(
          width: MediaQuery.of(context).size.width - (80 * ratio),
          margin: EdgeInsets.only(top: 49 * ratio, bottom: 20 * ratio),
          child: Text(
            context.watch<glob>().app_language == 'arabic'
                ? 'السبت'
                : 'Saturday',
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

        //small text
        Visibility(
          visible: !context.watch<glob>().day6_hidden,
          child: Container(
            width: MediaQuery.of(context).size.width - (80 * ratio),
            margin: EdgeInsets.only(top: 0 * ratio, bottom: 0 * ratio),
            child: Text(
              context.watch<glob>().app_language == 'arabic'
                  ? 'لاتوجد محاضرات'
                  : 'No lectures',
              style: TextStyle(
                  color: context.watch<glob>().darkMode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20 * ratio,
                  fontFamily: context.watch<glob>().app_language),
              textDirection: context.watch<glob>().app_language == 'arabic'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
          ),
        ),

        ...context.watch<glob>().day6_widgets,

        SizedBox(
          height: 100 * ratio,
        )
      ],
    );
  }
}

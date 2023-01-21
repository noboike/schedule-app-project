import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'uiAnimation.dart';
import 'glob.dart';

class add_page extends StatelessWidget {
  const add_page({super.key});

  @override
  Widget build(BuildContext context) {
    TimeOfDay startTime = context.watch<glob>().startTime;
    TimeOfDay endTime = context.watch<glob>().endTime;

    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: context.watch<glob>().app_language == 'arabic'
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40 * ratio,
              ),
              GestureDetector(
                onTap: () {
                  context.read<glob>().goToSchedule();
                },
                child: Container(
                  width: 133 * ratio,
                  height: 67 * ratio,
                  margin: EdgeInsets.only(
                    left: context.watch<glob>().app_language == 'arabic'
                        ? 0
                        : 40 * ratio,
                    right: context.watch<glob>().app_language == 'arabic'
                        ? 40 * ratio
                        : 0,
                  ),
                  decoration: BoxDecoration(
                      color: context.watch<glob>().darkMode ? Color.fromRGBO(51, 51, 51, 1): Color.fromRGBO(230, 230, 230, 1),
                      borderRadius: BorderRadius.circular(7.44 * ratio)),
                  child: Stack(
                    children: [
                      Align(
                        alignment:
                            context.watch<glob>().app_language == 'arabic'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: context.watch<glob>().app_language == 'arabic'
                                ? 0
                                : 69.68 * ratio,
                            right:
                                context.watch<glob>().app_language == 'arabic'
                                    ? 69.68 * ratio
                                    : 0,
                          ),
                          child: Text(
                            context.watch<glob>().app_language == 'arabic' ? 'رجوع' : 'Back',
                            style: TextStyle(
                              color: context.watch<glob>().darkMode ? Colors.white : Colors.black,
                              fontSize: 21.61 * ratio,
                              fontFamily: context.watch<glob>().app_language,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment:
                            context.watch<glob>().app_language == 'arabic'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: context.watch<glob>().app_language == 'arabic'
                                ? 0
                                : 8.04 * ratio,
                            right:
                                context.watch<glob>().app_language == 'arabic'
                                    ? 8.04 * ratio
                                    : 0,
                          ),
                          width: 50.92 * ratio,
                          height: 50.92 * ratio,
                          decoration: BoxDecoration(
                            color: context.watch<glob>().darkMode ? Color.fromRGBO(38, 38, 38, 1) : Color.fromRGBO(183, 183, 183, 1),
                            borderRadius: BorderRadius.circular(7.44 * ratio),
                          ),
                          child: Center(
                            child: Container(
                              width: 25.16 * ratio,
                              height: 14.25 * ratio,
                              child: FittedBox(
                                child: Image.asset(
                                    context.watch<glob>().darkMode 
                                    ? 'assets/arrow ${context.watch<glob>().app_language == 'arabic' ? 'right' : 'left'}.png'
                                    :'assets/arrow ${context.watch<glob>().app_language == 'arabic' ? 'right' : 'left'} dark.png'
                                    ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50 * ratio,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 33 * ratio, right: 33 * ratio, top: 27 * ratio),
                child: Text(
                  context.watch<glob>().app_language == 'arabic'
                      ? 'إسم المحاضرة'
                      : 'Lecture Name',
                  style: TextStyle(
                      color: pTextColor1,
                      fontSize: 25.77 * ratio,
                      fontFamily: context.watch<glob>().app_language),
                  textDirection: context.watch<glob>().app_language == 'arabic'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 33 * ratio, right: 33 * ratio, top: 20 * ratio),
                decoration: BoxDecoration(
                  color: pInputColor1,
                  borderRadius: BorderRadius.circular(5 * ratio),
                ),
                child: Directionality(
                  textDirection: context.watch<glob>().app_language == 'arabic'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: TextField(
                    onChanged: (value) {
                      context.read<glob>().setInputLecName(value);
                    },
                    cursorColor: pTextColor1,
                    controller: lec_name,
                    textAlign: context.watch<glob>().app_language == 'arabic'
                        ? TextAlign.right
                        : TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15 * ratio),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        color: pTextColor1,
                        fontSize: 16 * ratio,
                        fontFamily: context.watch<glob>().app_language),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: 33 * ratio, right: 33 * ratio, top: 27 * ratio),
                child: Text(
                  context.watch<glob>().app_language == 'arabic'
                      ? 'وقت بداية المحاضرة'
                      : 'Starting time',
                  style: TextStyle(
                      color: pTextColor1,
                      fontSize: 25.77 * ratio,
                      fontFamily: context.watch<glob>().app_language),
                  textDirection: context.watch<glob>().app_language == 'arabic'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  textAlign: context.watch<glob>().app_language == 'arabic'
                      ? TextAlign.right
                      : TextAlign.left,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  TimeOfDay? newtime = await showTimePicker(
                      context: context, initialTime: startTime);
                  if (newtime == null) {
                    context.read<glob>().setStarTime(8, 0);
                  } else {
                    context
                        .read<glob>()
                        .setStarTime(newtime.hour, newtime.minute);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: 33 * ratio, right: 33 * ratio, top: 20 * ratio),
                  height: 50 * ratio,
                  decoration: BoxDecoration(
                    color: pInputColor1,
                    borderRadius: BorderRadius.circular(10 * ratio),
                  ),
                  child: Align(
                    alignment: context.watch<glob>().app_language == 'arabic'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                          right: context.watch<glob>().app_language == 'arabic'
                              ? 20 * ratio
                              : 0,
                          left: context.watch<glob>().app_language == 'arabic'
                              ? 0
                              : 20 * ratio),
                      child: Text(
                        !context.watch<glob>().settings['24 Hours mode'] 
                        ? '${(startTime.hour % 12 == 0 ? 12 : startTime.hour % 12).toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')} ${startTime.hour >= 12 ? 'PM' : 'AM'}'
                        : '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                            color: pTextColor1,
                            fontSize: 20 * ratio,
                            fontFamily: 'inter'),
                      ),
                    ),
                  ),
                ),
              ),

              //time end

              Container(
                margin: EdgeInsets.only(
                    left: 33 * ratio, right: 33 * ratio, top: 27 * ratio),
                child: Text(
                  context.watch<glob>().app_language == 'arabic'
                      ? 'وقت نهاية المحاضرة'
                      : 'Ending time',
                  style: TextStyle(
                      color: pTextColor1,
                      fontSize: 25.77 * ratio,
                      fontFamily: context.watch<glob>().app_language),
                  textDirection: context.watch<glob>().app_language == 'arabic'
                      ? TextDirection.rtl
                      : TextDirection.rtl,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  print('object');
                  TimeOfDay? newtime = await showTimePicker(
                      context: context, initialTime: endTime);
                  if (newtime == null) {
                    context.read<glob>().setEndTime(9, 40);
                  } else {
                    context
                        .read<glob>()
                        .setEndTime(newtime.hour, newtime.minute);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: 33 * ratio, right: 33 * ratio, top: 20 * ratio),
                  height: 50 * ratio,
                  decoration: BoxDecoration(
                    color: pInputColor1,
                    borderRadius: BorderRadius.circular(10 * ratio),
                  ),
                  child: Align(
                    alignment: context.watch<glob>().app_language == 'arabic'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                          right: context.watch<glob>().app_language == 'arabic'
                              ? 20 * ratio
                              : 0,
                          left: context.watch<glob>().app_language == 'arabic'
                              ? 0
                              : 20 * ratio),
                      child: Text(
                        !context.watch<glob>().settings['24 Hours mode'] 
                        ? '${(endTime.hour % 12 == 0 ? 12 : endTime.hour % 12).toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')} ${endTime.hour >= 12 ? 'PM' : 'AM'}'
                        : '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                            color: pTextColor1,
                            fontSize: 20 * ratio,
                            fontFamily: 'inter'),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: 33 * ratio, right: 33 * ratio, top: 27 * ratio),
                child: Text(
                  context.watch<glob>().app_language == 'arabic'
                      ? 'الكود (مثال 1010730024)'
                      : 'code (example: 1010730024)',
                  style: TextStyle(
                      color: pTextColor1,
                      fontSize: 20.77 * ratio,
                      fontFamily: context.watch<glob>().app_language),
                  textDirection: context.watch<glob>().app_language == 'arabic'
                      ? TextDirection.rtl
                      : TextDirection.rtl,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 33 * ratio, right: 33 * ratio, top: 20 * ratio),
                decoration: BoxDecoration(
                  color: pInputColor1,
                  borderRadius: BorderRadius.circular(5 * ratio),
                ),
                child: Directionality(
                  textDirection: context.watch<glob>().app_language == 'arabic'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: TextField(
                    onChanged: (value) {
                      context.read<glob>().setInputCode(value);
                    },
                    cursorColor: pTextColor1,
                    controller: code_controller,
                    textAlign: context.watch<glob>().app_language == 'arabic'
                        ? TextAlign.right
                        : TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15 * ratio),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        color: pTextColor1,
                        fontSize: 16 * ratio,
                        fontFamily: 'english'),
                  ),
                ),
              ),
              SizedBox(
                height: 30 * ratio,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 20 * ratio, left: 33 * ratio, right: 33 * ratio),
                // color: Colors.red,
                height: 50 * ratio,
                child: Stack(
                  children: [
                    //ball1
                    dayBall(
                      forDay: 7,
                      letter: context.watch<glob>().app_language == 'arabic'
                          ? 'الأحد'
                          : 'Sunday',
                    ),
                    dayBall(
                      forDay: 1,
                      letter: context.watch<glob>().app_language == 'arabic'
                          ? 'الإثنين'
                          : 'Monday',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10 * ratio,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 0 * ratio, left: 33 * ratio, right: 33 * ratio),
                // color: Colors.red,
                height: 50 * ratio,
                child: Stack(
                  children: [
                    //ball1
                    dayBall(
                      forDay: 2,
                      letter: context.watch<glob>().app_language == 'arabic'
                          ? 'الثلاثاء'
                          : 'Tuesday',
                    ),
                    dayBall(
                      forDay: 3,
                      letter: context.watch<glob>().app_language == 'arabic'
                          ? 'الأربعاء'
                          : 'Wednesday',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10 * ratio,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 0 * ratio, left: 33 * ratio, right: 33 * ratio),
                // color: Colors.red,
                height: 50 * ratio,
                child: Stack(
                  children: [
                    //ball1
                    dayBall(
                      forDay: 4,
                      letter: context.watch<glob>().app_language == 'arabic'
                          ? 'الخميس'
                          : 'Thursday',
                    ),
                    dayBall(
                      forDay: 5,
                      letter: context.watch<glob>().app_language == 'arabic'
                          ? 'الجمعة'
                          : 'Friday',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10 * ratio,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 0 * ratio, left: 33 * ratio, right: 33 * ratio),
                // color: Colors.red,
                height: 50 * ratio,
                child: Stack(
                  children: [
                    //ball1
                    dayBall(
                      forDay: 6,
                      letter: context.watch<glob>().app_language == 'arabic'
                          ? 'السبت'
                          : 'Saturday',
                    ),
                  ],
                ),
              ),

              //add-btn
              GestureDetector(
                onTap: () {
                  context.read<glob>().addLec();
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: 33 * ratio, right: 33 * ratio, top: 50 * ratio),
                  height: 50 * ratio,
                  decoration: BoxDecoration(
                    color: pColor1,
                    borderRadius: BorderRadius.circular(10 * ratio),
                  ),
                  child: Center(
                    child: Text(
                      context.watch<glob>().add_mode == 'add'
                          ? context.watch<glob>().app_language == 'arabic'
                              ? 'إضافة'
                              : 'Add'
                          : context.watch<glob>().app_language == 'arabic'
                              ? 'تعديل'
                              : 'Edit',
                      style: TextStyle(
                          color: context.watch<glob>().darkMode
                              ? Colors.black
                              : Colors.white,
                          fontSize: 20 * ratio,
                          fontFamily: context.watch<glob>().app_language),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100 * ratio,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class dayBall extends StatelessWidget {
  const dayBall({super.key, required this.forDay, required this.letter});
  final int forDay;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: forDay != 7
          ? (forDay % 2 == 0 ? Alignment.topRight : Alignment.topLeft)
          : Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          context.read<glob>().setInputDay(forDay);
        },
        child: Container(
          width: forDay != 6
              ? (MediaQuery.of(context).size.width / 2) - (38 * ratio)
              : MediaQuery.of(context).size.width - (60 * ratio),
          height: 50 * ratio,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10 * ratio),
            color: context.watch<glob>().inputDay == forDay
                ? pColor1
                : pInputColor1,
          ),
          child: Center(
            child: Text(
              letter,
              style: TextStyle(
                  color: context.watch<glob>().inputDay == forDay
                      ? context.watch<glob>().darkMode
                          ? Colors.black
                          : Colors.white
                      : context.watch<glob>().darkMode
                          ? Colors.white
                          : Colors.black,
                  fontSize: 16 * ratio,
                  fontFamily: context.watch<glob>().app_language),
            ),
          ),
        ),
      ),
    );
  }
}

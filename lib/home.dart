import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app_project/add_page.dart';
import 'package:schedule_app_project/settings_page.dart';
import 'uiAnimation.dart';
import 'glob.dart';
import 'notification_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'homePage.dart';
import 'schedulePage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ratio = MediaQuery.of(context).size.width / 428;
    ratio = ratio > 1 ? 1 : ratio;
    pageColor = context.watch<glob>().darkMode
        ? Color.fromRGBO(21, 21, 25, 1)
        : Colors.white;
    pColor1 = context.watch<glob>().darkMode
        ? Color.fromRGBO(234, 205, 172, 1)
        : Color.fromRGBO(147, 123, 95, 1);
    pColor2 = context.watch<glob>().darkMode
        ? Color.fromRGBO(51, 51, 51, 1)
        : Color.fromRGBO(252, 241, 217, 1);
    pTextColor1 = context.watch<glob>().darkMode ? Colors.white : Colors.black;
    pInputColor1 = context.watch<glob>().darkMode
        ? Color.fromRGBO(51, 51, 51, 1)
        : Colors.grey[300];
    return Container(
      color: pageColor,
      child: Stack(
        children: [
          //app body
          Visibility(
            visible: context.watch<glob>().currentPage == 'add page',
            child: add_page(),
          ),
          Visibility(
            visible: context.watch<glob>().currentPage != 'add page',
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView(
                addAutomaticKeepAlives: true,
                children: [
                  Column(
                    children: [
                      nav1(),
                      nav2(),
                      context.watch<glob>().currentPage == 'home'
                          ? homePage()
                          : context.watch<glob>().currentPage == 'schedule'
                              ? schedulePage()
                              : schedulePage(),
                    ],
                  )
                ],
              ),
            ),
          ),

          //floating objects
          //loading images
          IgnorePointer(
            ignoring: true,
            child: Opacity(
              opacity: 0,
              child: Row(
                children: [
                  Image.asset('assets/trash.png'),
                  Image.asset('assets/add.png'),
                  Image.asset('assets/edit.png'),
                  Image.asset('assets/cancel.png'),
                ],
              ),
            ),
          ),
          animationPlayer(),
          IgnorePointer(
            ignoring: context.watch<glob>().animated_filter['ignored'],
            child: Opacity(
              opacity: context.watch<glob>().animated_filter['opacity']
                  ['value'],
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: context.watch<glob>().nextThemeColor,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: context.watch<glob>().animated_filter['size']
                                ['value'] *
                            ratio,
                        height: context.watch<glob>().animated_filter['size']
                                ['value'] *
                            ratio,
                        // color: Colors.blue,
                        child: FittedBox(
                          child: Image.asset(
                              context.watch<glob>().themeModeImageSrc),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //settings page
          Center(
            child: Transform.scale(
              scale: context.watch<glob>().animated_settings_page['scale']
                  ['value'],
              child: IgnorePointer(
                ignoring: !context.watch<glob>().settings_page_open,
                child: Opacity(
                  opacity: context
                      .watch<glob>()
                      .animated_settings_page['opacity']['value'],
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Color.fromRGBO(21, 21, 25, 1),
                    child: settings_page(),
                  ),
                ),
              ),
            ),
          ),
          //page filter2
          Positioned(
            left: -MediaQuery.of(context).size.width *
                context.watch<glob>().animated_filter2['x']['value'],
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(255, 0, 0, 0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: context.watch<glob>().animated_filter2['opacity']
                          ['value'],
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: context
                                    .watch<glob>()
                                    .animated_filter2['margin']['value'] *
                                ratio),
                        child: Text(
                          context.watch<glob>().filter2_text,
                          style: TextStyle(
                              fontSize: 50 * ratio,
                              color: Colors.white,
                              fontFamily: context.watch<glob>().app_language),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          notifyBox(
            text: context.watch<glob>().notify_text,
            type: context.watch<glob>().notify_type,
          ),
        ],
      ),
    );
  }
}

class nav1 extends StatelessWidget {
  const nav1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: 70 * ratio,
      margin:
          EdgeInsets.only(left: 40 * ratio, right: 40 * ratio, top: 40 * ratio),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: () {
                context.read<glob>().toggoleDarkMode();
              },
              child: Container(
                width: 70 * ratio,
                height: 70 * ratio,
                decoration: BoxDecoration(
                  color: context.watch<glob>().darkMode
                      ? Color.fromRGBO(51, 51, 51, 1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10 * ratio),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                        offset: Offset(0, 0),
                        blurRadius: 30 * ratio)
                  ],
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 50 * ratio,
                        height: 50 * ratio,
                        child: FittedBox(
                          child: Image.asset(context.watch<glob>().darkMode
                              ? 'assets/moon.png'
                              : 'assets/sun.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {
                context.read<glob>().goToSettings();
              },
              child: Container(
                width: 70 * ratio,
                height: 70 * ratio,
                decoration: BoxDecoration(
                  color: context.watch<glob>().darkMode
                      ? Color.fromRGBO(51, 51, 51, 1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10 * ratio),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                        offset: Offset(0, 0),
                        blurRadius: 30 * ratio)
                  ],
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 33.63 * ratio,
                        height: 35 * ratio,
                        child: FittedBox(
                          child: Image.asset(context.watch<glob>().darkMode
                              ? 'assets/settings_light.png'
                              : 'assets/setings_dark.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class nav2 extends StatelessWidget {
  const nav2({super.key});

  @override
  Widget build(BuildContext context) {
    var navfilterX = ((MediaQuery.of(context).size.width - (80 * ratio)) / 2 -
            (-10 * ratio)) *
        context.watch<glob>().animated_nav2filter['x']['value'];
    return Container(
      height: 70 * ratio,
      margin: EdgeInsets.only(
        left: 40 * ratio,
        right: 40 * ratio,
        top: 40 * ratio,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          //navop1
          Align(
            alignment: context.watch<glob>().app_language == 'arabic'
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                context.read<glob>().goToHome();
              },
              child: Container(
                color: Colors.white.withOpacity(0),
                width: (MediaQuery.of(context).size.width - (80 * ratio)) / 2 -
                    (10 * ratio),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        context.watch<glob>().app_language == 'arabic'
                            ? 'الرئيسية'
                            : 'Home',
                        style: TextStyle(
                            fontSize: 24.77 * ratio,
                            color: context.watch<glob>().darkMode
                                ? Colors.white
                                : Colors.black,
                            fontFamily: context.watch<glob>().app_language),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: context.watch<glob>().app_language == 'arabic'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                context.read<glob>().goToSchedule();
              },
              child: Container(
                color: Colors.white.withOpacity(0),
                width: (MediaQuery.of(context).size.width - (80 * ratio)) / 2 -
                    (10 * ratio),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        context.watch<glob>().app_language == 'arabic'
                            ? 'الجدول'
                            : 'Schedule',
                        style: TextStyle(
                            fontSize: 24.77 * ratio,
                            color: context.watch<glob>().darkMode
                                ? Colors.white
                                : Colors.black,
                            fontFamily: context.watch<glob>().app_language),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //nav2 filter-cont
          IgnorePointer(
            ignoring: true,
            child: Align(
              alignment: context.watch<glob>().app_language == 'arabic'
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(
                  left: context.watch<glob>().app_language == 'arabic'
                      ? 0
                      : navfilterX,
                  right: context.watch<glob>().app_language == 'arabic'
                      ? navfilterX
                      : 0,
                ),
                width: (MediaQuery.of(context).size.width - (80 * ratio)) / 2 -
                    (10 * ratio),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 84 * ratio,
                        height: 8 * ratio,
                        decoration: BoxDecoration(
                            color: pColor1,
                            borderRadius: BorderRadius.circular(10 * ratio)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

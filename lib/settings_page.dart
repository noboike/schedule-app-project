import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'uiAnimation.dart';
import 'glob.dart';

class settings_page extends StatelessWidget {
  const settings_page({super.key});

  @override
  Widget build(BuildContext context) {
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
                  context.read<glob>().closeSettings();
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
                      color: true
                          ? Color.fromRGBO(51, 51, 51, 1)
                          : Color.fromRGBO(230, 230, 230, 1),
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
                            context.watch<glob>().app_language == 'arabic'
                                ? 'رجوع'
                                : 'Back',
                            style: TextStyle(
                              color: true ? Colors.white : Colors.black,
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
                            color: true
                                ? Color.fromRGBO(38, 38, 38, 1)
                                : Color.fromRGBO(183, 183, 183, 1),
                            borderRadius: BorderRadius.circular(7.44 * ratio),
                          ),
                          child: Center(
                            child: Container(
                              width: 25.16 * ratio,
                              height: 14.25 * ratio,
                              child: FittedBox(
                                child: Image.asset(true
                                    ? 'assets/arrow ${context.watch<glob>().app_language == 'arabic' ? 'right' : 'left'}.png'
                                    : 'assets/arrow ${context.watch<glob>().app_language == 'arabic' ? 'right' : 'left'} dark.png'),
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
                height: 40 * ratio,
              ),
              Container(
                width: MediaQuery.of(context).size.width - (80 * ratio),
                margin: EdgeInsets.only(left: 40 * ratio, right: 40 * ratio),
                child: Text(
                  context.watch<glob>().app_language == 'arabic'
                      ? 'الإعدادات'
                      : 'Settings',
                  style: TextStyle(
                    fontSize: 54.08 * ratio,
                    fontFamily: context.watch<glob>().app_language,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 51 * ratio,
              ),
              switch_list(
                text: context.watch<glob>().app_language == 'arabic'
                    ? 'تنسيق الوقت 24 ساعة'
                    : '24 hour time format',
                id: '24 Hours mode',
                index: 0,
              ),
              
              switch_list(
                text: context.watch<glob>().app_language == 'arabic'
                    ? 'قرائة كود مكان المحاضرة'
                    : 'Read lectures code',
                id: 'transtale Code',
                index: 1,
              ),
              switch_list(
                text: context.watch<glob>().app_language == 'arabic'
                    ? 'مؤثرات صوتية'
                    : 'Sounds',
                id: 'sounds',
                index: 3,
              ),
              IgnorePointer(
                ignoring: !(context.watch<glob>().username.trim().length >= 1) && !(context.watch<glob>().password.trim().length >= 1),
                child: Opacity(
                  opacity: !(context.watch<glob>().username.trim().length >= 1) && !(context.watch<glob>().password.trim().length >= 1) ? 0.5 : 1,
                  child: switch_list(
                    text: context.watch<glob>().app_language == 'arabic'
                        ? 'تخزين سحابي'
                        : 'cloud storage',
                    id: 'cloud-storage',
                    index: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 29 * ratio,
              ),
              login_btn(),
              logout_btn(),
              SizedBox(
                height: 29 * ratio,
              ),
              GestureDetector(
                onTap: () {
                  context.read<glob>().toggoleLanguage();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - (80 * ratio),
                  height: 66 * ratio,
                  margin: EdgeInsets.only(left: 40 * ratio, right: 40 * ratio),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(135, 97, 198, 1),
                      borderRadius: BorderRadius.circular(10 * ratio)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      context.watch<glob>().app_language == 'arabic'
                          ? 'Switch to English'
                          : 'التبديل إلى العربية',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.05 * ratio,
                        fontFamily: context.watch<glob>().app_language == 'arabic' ? 'english' : 'arabic',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 41 * ratio,),
            ],
          )
        ],
      ),
    );
  }
}

class switch_list extends StatelessWidget {
  const switch_list(
      {super.key, required this.text, required this.id, required this.index});
  final String text;
  final String id;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<glob>().toggoleSettings(id, index);
      },
      child: Container(
        color: Colors.black.withOpacity(0),
        width: MediaQuery.of(context).size.width - (80 * ratio),
        height: 66 * ratio,
        margin: EdgeInsets.only(left: 40 * ratio, right: 40 * ratio),
        child: Stack(
          children: [
            Align(
              alignment: context.watch<glob>().app_language == 'arabic'
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(
                    left: context.watch<glob>().app_language == 'arabic'
                        ? 0
                        : 20 * ratio,
                    right: context.watch<glob>().app_language == 'arabic'
                        ? 20 * ratio
                        : 0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.41 * ratio,
                      fontFamily: context.watch<glob>().app_language),
                ),
              ),
            ),
            Align(
              alignment: context.watch<glob>().app_language == 'arabic'
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                  left: context.watch<glob>().app_language == 'arabic'
                      ? 20 * ratio
                      : 0,
                  right: context.watch<glob>().app_language == 'arabic'
                      ? 0
                      : 20 * ratio,
                ),
                child: Container(
                  width: 68 * ratio,
                  height: 34 * ratio,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    borderRadius: BorderRadius.circular(17 * ratio),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 68 * ratio,
                          height: 34 * ratio,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(135, 97, 198, 1).withOpacity(
                                context.watch<glob>().animated_checkbox[index]
                                    ['opacity']['value']),
                            borderRadius: BorderRadius.circular(17 * ratio),
                          ),
                        ),
                      ),
                      Align(
                        alignment:
                            context.watch<glob>().app_language == 'arabic'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Container(
                          width: context.watch<glob>().animated_checkbox[index]
                                  ['size']['value'] *
                              ratio,
                          height: context.watch<glob>().animated_checkbox[index]
                                  ['size']['value'] *
                              ratio,
                          margin: EdgeInsets.only(
                            right: context.watch<glob>().app_language ==
                                    'arabic'
                                ? context.watch<glob>().animated_checkbox[index]
                                        ['x']['value'] *
                                    ratio
                                : 0,
                            left: context.watch<glob>().app_language != 'arabic'
                                ? context.watch<glob>().animated_checkbox[index]
                                        ['x']['value'] *
                                    ratio
                                : 0,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12 * ratio),
                              border: Border.all(
                                  width: context.watch<glob>().settings[id]
                                      ? 4.8 * ratio
                                      : 4 * ratio,
                                  color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class login_btn extends StatelessWidget {
  const login_btn({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !(context.watch<glob>().username.trim().length >= 1) && !(context.watch<glob>().password.trim().length >= 1),
      child: GestureDetector(
        onTap: () {
          context.read<glob>().goToLogin();
        },
        child: Container(
          width: MediaQuery.of(context).size.width - (80 * ratio),
          height: 66 * ratio,
          margin: EdgeInsets.only(left: 40 * ratio, right: 40 * ratio),
          decoration: BoxDecoration(
            color: Color.fromRGBO(51, 51, 51, 1),
            borderRadius: BorderRadius.circular(10 * ratio)
          ),
          child: Center(
            child: Text(
              context.watch<glob>().app_language == 'arabic' ? 'تسجيل دخول' : 'Log in',
              style: TextStyle(
                fontFamily: context.watch<glob>().app_language,
                fontSize: 24.05 * ratio,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class logout_btn extends StatelessWidget {
  const logout_btn({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (context.watch<glob>().username.trim().length >= 1) && (context.watch<glob>().password.trim().length >= 1),
      child: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          width: MediaQuery.of(context).size.width - (80 * ratio),
          height: 66 * ratio,
          margin: EdgeInsets.only(left: 40 * ratio, right: 40 * ratio),
          decoration: BoxDecoration(
            color: Color.fromRGBO(51, 51, 51, 1),
            borderRadius: BorderRadius.circular(10 * ratio)
          ),
          child: Stack(
            children: [
              //user-img
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 50 * ratio,
                  height: 50 * ratio,
                  margin: EdgeInsets.only(left: 20 * ratio),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(38, 38, 38, 1),
                    borderRadius: BorderRadius.circular(50 * ratio)
                  ),
                  child: Center(
                    child: Container(
                      width: 24.29 * ratio,
                      height: 24.29 * ratio,
                      child: FittedBox(
                        child: Image.asset('assets/user.png'),
                      ),
                    ),
                  ),
                ),
              ),
              //username
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: (20 + 50 + 15) * ratio),
                  child: Text(context.watch<glob>().username, style: TextStyle(color: Colors.white, fontSize: 24.05 * ratio, fontFamily: 'english'),),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    context.read<glob>().logout();
                  },
                  child: Container(
                    width: 50 * ratio,
                    height: 50 * ratio,
                    margin: EdgeInsets.only(right: 20 * ratio),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(38, 38, 38, 1),
                      borderRadius: BorderRadius.circular(10 * ratio)
                    ),
                    child: Center(
                      child: Container(
                        width: 24.29 * ratio,
                        height: 24.29 * ratio,
                        child: FittedBox(
                          child: Image.asset('assets/logout.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
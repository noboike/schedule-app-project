import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'uiAnimation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'glob.dart';

final Uri _url = Uri.parse('https://noboike.com/signup/');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.watch<glob>().login_page_open,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromRGBO(21, 21, 25, 1),
          ),
          child: Stack(
            children: [
              ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(children: [
                  Column(
                    crossAxisAlignment:
                        context.watch<glob>().app_language == 'arabic'
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40 * ratio,
                      ),
                      //back-btn
                      GestureDetector(
                        onTap: () {
                          context.read<glob>().closeLogin();
                        },
                        child: Container(
                          width: 133 * ratio,
                          height: 67 * ratio,
                          margin: EdgeInsets.only(
                            left: context.watch<glob>().app_language == 'arabic'
                                ? 0
                                : 40 * ratio,
                            right:
                                context.watch<glob>().app_language == 'arabic'
                                    ? 40 * ratio
                                    : 0,
                          ),
                          decoration: BoxDecoration(
                              color: true
                                  ? Color.fromRGBO(51, 51, 51, 1)
                                  : Color.fromRGBO(230, 230, 230, 1),
                              borderRadius:
                                  BorderRadius.circular(7.44 * ratio)),
                          child: Stack(
                            children: [
                              Align(
                                alignment: context.watch<glob>().app_language ==
                                        'arabic'
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: context.watch<glob>().app_language ==
                                            'arabic'
                                        ? 0
                                        : 69.68 * ratio,
                                    right: context.watch<glob>().app_language ==
                                            'arabic'
                                        ? 69.68 * ratio
                                        : 0,
                                  ),
                                  child: Text(
                                    context.watch<glob>().app_language ==
                                            'arabic'
                                        ? 'رجوع'
                                        : 'Back',
                                    style: TextStyle(
                                      color: true ? Colors.white : Colors.black,
                                      fontSize: 21.61 * ratio,
                                      fontFamily:
                                          context.watch<glob>().app_language,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: context.watch<glob>().app_language ==
                                        'arabic'
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: context.watch<glob>().app_language ==
                                            'arabic'
                                        ? 0
                                        : 8.04 * ratio,
                                    right: context.watch<glob>().app_language ==
                                            'arabic'
                                        ? 8.04 * ratio
                                        : 0,
                                  ),
                                  width: 50.92 * ratio,
                                  height: 50.92 * ratio,
                                  decoration: BoxDecoration(
                                    color: true
                                        ? Color.fromRGBO(38, 38, 38, 1)
                                        : Color.fromRGBO(183, 183, 183, 1),
                                    borderRadius:
                                        BorderRadius.circular(7.44 * ratio),
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
                        height: 63 * ratio,
                      ),
                      //login text
                      Container(
                        width: MediaQuery.of(context).size.width - (80 * ratio),
                        margin: EdgeInsets.only(
                            left: 40 * ratio, right: 40 * ratio),
                        child: Text(
                          context.watch<glob>().app_language == 'arabic'
                              ? 'تسجيل الدخول'
                              : 'Log in',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: context.watch<glob>().app_language,
                              color: Colors.white,
                              fontSize: 43.95 * ratio),
                        ),
                      ),
                      SizedBox(
                        height: 89 * ratio,
                      ),
                      //usernam text
                      Container(
                        width: MediaQuery.of(context).size.width - (80 * ratio),
                        margin: EdgeInsets.only(
                            left: 40 * ratio, right: 40 * ratio),
                        child: Text(
                          context.watch<glob>().app_language == 'arabic'
                              ? 'أسم المستخدم'
                              : 'username',
                          textAlign:
                              context.watch<glob>().app_language == 'arabic'
                                  ? TextAlign.right
                                  : TextAlign.left,
                          style: TextStyle(
                              fontFamily: context.watch<glob>().app_language,
                              color: Colors.white,
                              fontSize: 24.05 * ratio),
                        ),
                      ),
                      SizedBox(
                        height: 25 * ratio,
                      ),
                      //uysername input
                      Container(
                        width: MediaQuery.of(context).size.width - (80 * ratio),
                        height: 60 * ratio,
                        margin: EdgeInsets.only(
                            left: 40 * ratio, right: 40 * ratio),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(37, 36, 36, 1),
                            borderRadius: BorderRadius.circular(12 * ratio)),
                        child: Center(
                          child: TextField(
                            obscureText: false,
                            controller: username_inp,
                            onChanged: (value) {
                              // inpValue = value;
                            },
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  right: 20 * ratio, left: 20 * ratio),
                            ),
                            style: TextStyle(
                                fontSize: 20 * ratio,
                                fontFamily: 'arabic',
                                color: Colors.white),
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25 * ratio,
                      ),
                      //password text
                      Container(
                        width: MediaQuery.of(context).size.width - (80 * ratio),
                        margin: EdgeInsets.only(
                            left: 40 * ratio, right: 40 * ratio),
                        child: Text(
                          context.watch<glob>().app_language == 'arabic'
                              ? 'كلمة المرور'
                              : 'password',
                          textAlign:
                              context.watch<glob>().app_language == 'arabic'
                                  ? TextAlign.right
                                  : TextAlign.left,
                          style: TextStyle(
                              fontFamily: context.watch<glob>().app_language,
                              color: Colors.white,
                              fontSize: 24.05 * ratio),
                        ),
                      ),
                      SizedBox(
                        height: 25 * ratio,
                      ),
                      //password input
                      Container(
                        width: MediaQuery.of(context).size.width - (80 * ratio),
                        height: 60 * ratio,
                        margin: EdgeInsets.only(
                            left: 40 * ratio, right: 40 * ratio),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(37, 36, 36, 1),
                            borderRadius: BorderRadius.circular(12 * ratio)),
                        child: Center(
                          child: TextField(
                            obscureText: true,
                            controller: password_inp,
                            onChanged: (value) {
                              // inpValue = value;
                            },
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  right: 20 * ratio, left: 20 * ratio),
                            ),
                            style: TextStyle(
                                fontSize: 20 * ratio,
                                fontFamily: 'arabic',
                                color: Colors.white),
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 79 * ratio,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<glob>().login();
                        },
                        child: Container(
                          width:
                              MediaQuery.of(context).size.width - (80 * ratio),
                          height: 70 * ratio,
                          margin: EdgeInsets.only(
                              left: 40 * ratio, right: 40 * ratio),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(135, 97, 198, 1),
                              borderRadius: BorderRadius.circular(10 * ratio)),
                          child: Center(
                            child: Text(
                              context.watch<glob>().app_language == 'arabic'
                                  ? 'تسجيل الدخول'
                                  : 'Log in',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.39,
                                fontFamily: context.watch<glob>().app_language,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 41 * ratio,),
                      Container(
                        width: MediaQuery.of(context).size.width - (80 * ratio),
                        margin: EdgeInsets.only(
                            left: 40 * ratio, right: 40 * ratio),
                        child: GestureDetector(
                          onTap: () {
                            // ignore: deprecated_member_use
                            context.read<glob>().goToSignup();
                          },
                          child: Text(
                            context.watch<glob>().app_language == 'arabic'
                                ? 'انشاء حاسب'
                                : 'Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: context.watch<glob>().app_language,
                                color: Color.fromRGBO(165, 190, 227, 1),
                                fontSize: 22.39 * ratio),
                          ),
                        ),
                      ),
                      SizedBox(height: 50 * ratio,),
                    ],
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}

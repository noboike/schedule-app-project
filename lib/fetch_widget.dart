import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'uiAnimation.dart';
import 'glob.dart';

class fetch_widget extends StatelessWidget {
  const fetch_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.watch<glob>().is_fetching,
      // visible: true,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black.withOpacity(0.5),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100 * ratio,
                color: Color.fromARGB(255, 0, 0, 0),
                child: Stack(
                  children: [
                    Align(
                      alignment: context.watch<glob>().app_language == 'arabic' ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                          right: context.watch<glob>().app_language == 'arabic' ? 20 * ratio : 0 * ratio,
                          left: context.watch<glob>().app_language != 'arabic' ? 20 * ratio : 0 * ratio
                        ),
                        child: Text(
                          context.watch<glob>().app_language == 'arabic' ? 'يتم جلب البيانان...' : 'Fetching data...',
                        style: TextStyle(
                          fontFamily: context.watch<glob>().app_language,
                          fontSize: 20 * ratio,
                          color: Colors.white,
                        ),
                        textDirection: context.watch<glob>().app_language == 'arabic' ? TextDirection.rtl : TextDirection.ltr,
                        ),
                      ),
                    ),
                    Align(
                      alignment: context.watch<glob>().app_language != 'arabic' ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                          right: context.watch<glob>().app_language != 'arabic' ? 20 * ratio : 0 * ratio,
                          left: context.watch<glob>().app_language == 'arabic' ? 20 * ratio : 0 * ratio
                        ),
                        width: 54 * ratio,
                        height: 14 * ratio,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            Opacity(
                              opacity: context.watch<glob>().animated_fetch['opacity1']['value'],
                              child: Container(
                                width: 14 * ratio,
                                height: 14 * ratio,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(90, 155, 105, 1),
                                  borderRadius: BorderRadius.circular(14 * ratio)
                                ),
                              ),
                            ),
                            SizedBox(width: 6 * ratio,),
                            Opacity(
                              opacity: context.watch<glob>().animated_fetch['opacity2']['value'],
                              child: Container(
                                width: 14 * ratio,
                                height: 14 * ratio,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(90, 155, 105, 1),
                                  borderRadius: BorderRadius.circular(14 * ratio)
                                ),
                              ),
                            ),
                            SizedBox(width: 6 * ratio,),
                            Opacity(
                              opacity: context.watch<glob>().animated_fetch['opacity3']['value'],
                              child: Container(
                                width: 14 * ratio,
                                height: 14 * ratio,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(90, 155, 105, 1),
                                  borderRadius: BorderRadius.circular(14 * ratio)
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

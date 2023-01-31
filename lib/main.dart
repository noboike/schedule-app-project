import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'uiAnimation.dart';
import 'glob.dart';
import 'home.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => glob())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // context.read<glob>().notify('مرحبا بك', 'alert');
    context.read<glob>().animate_live_ball();
    context.read<glob>().animate_fetch();
    context.read<glob>().load();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: pageColor,
        body: WillPopScope(
            onWillPop: () async {
              if (context.watch<glob>().settings_page_open) {
                context.read<glob>().closeSettings();
                return false;
              } else if (context.watch<glob>().currentPage == 'add page') {
                context.read<glob>().goToSchedule();
                return false;
              } else {
                context.read<glob>().goToHome();
                return false;
              }
            },
            child: SafeArea(
                child: IgnorePointer(
                    ignoring: context.watch<glob>().app_pointer,
                    child: Home()))),
      ),
    );
  }
}

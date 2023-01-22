import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'lists1.dart';
import 'uiAnimation.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController lec_name = TextEditingController(text: '');
TextEditingController code_controller = TextEditingController(text: '');

double ratio = 1.0;
Color? pageColor;
Color? pColor1 = Color.fromRGBO(234, 205, 172, 1);
Color? pColor2 = Color.fromRGBO(234, 205, 172, 1);
Color? pTextColor1 = Colors.white;
Color? pInputColor1 = Color.fromRGBO(51, 51, 51, 1);

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class glob with ChangeNotifier {
  late SharedPreferences storage;
  dynamic box = {
    "x": 0.0,
    "y": -50.0,
    "w": 50.0,
    "opacity": 0.0,
    "anm": {'value': -50.0},
    "anm2": {'value': 50.0},
    "anm-opacity": {'value': 0.0},
  };
  dynamic animated_checkbox = [
    {
      'opacity': {'value': 0.0},
      'x': {'value': 7.0},
      'size': {'value': 20.0},
      'anm': [],
      'for': '24 Hours mode',
    },
    {
      'opacity': {'value': 0.0},
      'x': {'value': 39.0},
      'size': {'value': 24.0},
      'anm': [],
      'for': 'transtale Code',
    }
  ];
  dynamic animated_filter = {
    "opacity": {"value": 0.0},
    "ignored": true,
    'size': {'value': 200.0},
  };
  dynamic animated_settings_page = {
    'opacity': {'value': 0.0},
    'scale': {'value': 1.5},
  };
  dynamic animated_nav2filter = {
    'x': {'value': 0.0},
  };
  dynamic animated_filter2 = {
    'x': {'value': 1.0},
    'opacity': {'value': 0.0},
    'margin': {'value': 100.0},
  };
  dynamic animated_live_ball = {
    'opacity': {'value': 1.0},
  };
  var notify_anm = [];
  var filterAnm = [];
  var nav2filter_anm = [];
  var filter2_anm = [];
  var live_ball_anm = [];
  var settings_page_anm = [];
  var notify_text = 'تم إضافة المحاضرة';
  var notify_type = 'success';
  var live_lecture_name = 'المشروع';
  var live_box_countdown_text = '00:00:00';
  double live_ball_opacity = 1;
  void notify(String text, String type) {
    notify_text = text;
    notify_type = type;
    box['anm2']['value'] = 38.0;
    box['anm-opacity']['value'] = 0.0;
    notify_anm = [
      {
        "target": box['anm'],
        "value": [-50, 50],
        "duration": 500,
        'easing': 'easeOutBack',
        "update": () {
          box['y'] = box['anm']['value'];
        },
      },
      {
        "target": box['anm2'],
        "value": [38.0, 200.0],
        "duration": 300,
        'easing': 'easeOutBack',
        "update": () {
          box['w'] = box['anm2']['value'];
        },
      },
      {
        "target": box['anm-opacity'],
        "value": [0.0, 1.0],
        "duration": 150,
        "delayBefore": true,
        "update": () {
          box['opacity'] = box['anm-opacity']['value'];
        },
      },
      {
        "target": box['anm-opacity'],
        "value": [1.0, 0.0],
        "duration": 150,
        "delay": 1500,
        "update": () {
          box['opacity'] = box['anm-opacity']['value'];
        },
      },
      {
        "target": box['anm2'],
        "value": [200.0, 38.0],
        "delay": 0,
        "duration": 150,
        'easing': 'easeOutExpo',
        "update": () {
          box['w'] = box['anm2']['value'];
        },
      },
      {
        "target": box['anm'],
        "value": [50.0, -50.0],
        "duration": 300,
        "delay": 150,
        'easing': 'easeInBack',
        "update": () {
          box['y'] = box['anm']['value'];
        },
      }
    ];
  }

  void animate_live_ball() {
    live_ball_anm = [
      {
        'target': animated_live_ball['opacity'],
        'value': [1.0, 0.0],
        'duration': 500,
      },
      {
        'target': animated_live_ball['opacity'],
        'value': [0.0, 1.0],
        'duration': 500,
        'end': () {
          animate_live_ball();
        }
      }
    ];
  }

  bool live_box_hidden = true;
  bool nextLec_hidden = true;
  bool doneLec_hidden = true;
  bool nolec_hidden = false;

  bool day7_hidden = false;
  bool day1_hidden = false;
  bool day2_hidden = false;
  bool day3_hidden = false;
  bool day4_hidden = false;
  bool day5_hidden = false;
  bool day6_hidden = false;

  dynamic settings = {
    '24 Hours mode': false,
    'transtale Code': true,
  };

  void renderCheckbox() {
    for (var i = 0; i < animated_checkbox.length; i++) {
      if (settings[animated_checkbox[i]['for']]) {
        animated_checkbox[i]['size']['value'] = 24.0;
        animated_checkbox[i]['x']['value'] = 39.0;
        animated_checkbox[i]['opacity']['value'] = 1.0;
      } else {
        animated_checkbox[i]['size']['value'] = 20.0;
        animated_checkbox[i]['x']['value'] = 7.0;
        animated_checkbox[i]['opacity']['value'] = 0.0;
      }
    }
  }

  void toggoleSettings(String id, int index) {
    if (!settings[id]) {
      animated_checkbox[index]['anm'] = [
        {
          'target': animated_checkbox[index]['x'],
          'value': [animated_checkbox[index]['x']['value'], 39.0],
          'duration': 500,
          'easing': 'easeOutBounce',
        },
        {
          'target': animated_checkbox[index]['size'],
          'value': [animated_checkbox[index]['size']['value'], 24.0],
          'duration': 150,
          'nisted': true,
        },
        {
          'target': animated_checkbox[index]['opacity'],
          'value': [animated_checkbox[index]['opacity']['value'], 1.0],
          'duration': 150,
          'nisted': true,
        },
      ];
    } else {
      animated_checkbox[index]['anm'] = [
        {
          'target': animated_checkbox[index]['x'],
          'value': [animated_checkbox[index]['x']['value'], 7.0],
          'duration': 500,
          'easing': 'easeOutBounce',
        },
        {
          'target': animated_checkbox[index]['size'],
          'value': [animated_checkbox[index]['size']['value'], 20],
          'duration': 150,
          'nisted': true,
        },
        {
          'target': animated_checkbox[index]['opacity'],
          'value': [animated_checkbox[index]['opacity']['value'], 0.0],
          'duration': 150,
          'nisted': true,
        },
      ];
    }
    settings[id] = !settings[id];
    save();
  }

  String add_mode = 'add';
  bool settings_page_open = false;
  bool editVisible = false;
  bool canUpdate = true;
  bool darkMode = true;
  bool app_pointer = false;
  String app_language = 'arabic';
  String currentPage = 'home';
  Color nextThemeColor = Colors.white;
  String themeModeImageSrc = 'assets/sun.png';
  List done_lectures_widgets = [];
  List next_lectures_widgets = [
    list1(
      name: 'برمجة الإنترنت',
      remain: '-01:38:52',
      location: 'مبنى 03 - الدور 2 - قاعة 10',
      time: '09:40 AM',
      isDone: false,
    ),
    list1(
      name: 'برمجة الإنترنت',
      remain: '-01:38:52',
      location: 'مبنى 03 - الدور 2 - قاعة 10',
      time: '01:00 PM',
      isDone: false,
    ),
  ];
  List day7_widgets = [];
  List day1_widgets = [];
  List day2_widgets = [];
  List day3_widgets = [];
  List day4_widgets = [];
  List day5_widgets = [];
  List day6_widgets = [];
  dynamic lectures = [];
  void load() async {
    storage = await SharedPreferences.getInstance();
    String? _storage = storage.getString('lectures');
    String? _storage2 = storage.getString('settings');
    String? _storage3 = storage.getString('app_language');
    bool? _storage4 = storage.getBool('darkMode');
    if (_storage != null && _storage2 != null && _storage3 != null && _storage4 != null) {
      lectures = json.decode(_storage);
      settings = json.decode(_storage2);
      app_language = _storage3;
      darkMode = _storage4;
      // settings = json.decode(_data[0]['settings'][0]);
    }
  }

  void save() async {
    storage.setString('lectures', json.encode(lectures));
    storage.setString('settings', json.encode(settings));
    storage.setString('app_language', app_language);
    storage.setBool('darkMode', darkMode);
  }

  int selectedLec = 0;
  TimeOfDay startTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay endTime = TimeOfDay(hour: 9, minute: 4);
  String inputLecName = '';
  String inputCode = '';
  int inputDay = 7;

  bool isAllNumber(String text) {
    bool rslt = true;
    for (var i = 0; i < text.length; i++) {
      if (text[i] != '0' &&
          text[i] != '1' &&
          text[i] != '2' &&
          text[i] != '3' &&
          text[i] != '4' &&
          text[i] != '5' &&
          text[i] != '6' &&
          text[i] != '7' &&
          text[i] != '8' &&
          text[i] != '9') {
        rslt = false;
        break;
      }
    }

    return rslt;
  }

  void addLec() {
    if (add_mode == 'add') {
      if (lec_name.text.trim().length < 1) {
        notify(
            app_language == 'arabic'
                ? '!ادخل إسم المحاضرة'
                : 'Enter Lecture Name!',
            'error');
      } else if ((code_controller.text.length > 0 &&
              code_controller.text.length != 10) ||
          !isAllNumber(code_controller.text)) {
        notify(app_language == 'arabic' ? 'الكود غير صالح' : 'invalid code!',
            'error');
      } else {
        notify(app_language == 'arabic' ? 'تم إضافة المحاضرة' : 'success!',
            'success');
        lectures.add({
          'name': lec_name.text,
          'startTime': formatNumber(startTime.hour) +
              ':' +
              formatNumber(startTime.minute),
          'endingTime':
              formatNumber(endTime.hour) + ':' + formatNumber(endTime.minute),
          'code': code_controller.text,
          'day': inputDay
        });
        goToSchedule();
      }
    } else {
      if (lec_name.text.trim().length < 1) {
        notify(
            app_language == 'arabic'
                ? '!ادخل إسم المحاضرة'
                : 'Enter Lecture Name!',
            'error');
      } else if ((code_controller.text.length > 0 &&
              code_controller.text.length != 10) ||
          !isAllNumber(code_controller.text)) {
        notify(app_language == 'arabic' ? 'الكود غير صالح' : 'invalid code!',
            'error');
      } else {
        lectures[selectedLec]['name'] = lec_name.text;
        lectures[selectedLec]['day'] = inputDay;
        lectures[selectedLec]['startTime'] =
            formatNumber(startTime.hour) + ':' + formatNumber(startTime.minute);
        lectures[selectedLec]['endingTime'] =
            formatNumber(endTime.hour) + ':' + formatNumber(endTime.minute);
        lectures[selectedLec]['code'] = code_controller.text;
        notify(app_language == 'arabic' ? 'تم تعديل المحاضرة' : 'success!',
            'success');

        goToSchedule();
        startTime = TimeOfDay(hour: 8, minute: 0);
        endTime = TimeOfDay(hour: 9, minute: 4);
        inputLecName = '';
        inputCode = '';
        inputDay = 7;
      }
    }
    save();
  }

  void removeItem(int index) {
    lectures.removeAt(index);
    // save();
  }

  void edit_btn() {
    editVisible = !editVisible;
  }

  void setSelectedLec(int index) {
    selectedLec = index;
  }

  void setStarTime(int hour, int minute) {
    startTime = TimeOfDay(hour: hour, minute: minute);
  }

  void setEndTime(int hour, int minute) {
    endTime = TimeOfDay(hour: hour, minute: minute);
  }

  void setInputLecName(String newVal) {
    inputLecName = newVal;
  }

  void setInputCode(String newVal) {
    inputCode = newVal;
  }

  void setInputDay(int newVal) {
    inputDay = newVal;
  }

  String formatNumber(int number) {
    String new_number = '0';
    if (number < 10) {
      new_number += number.toString();
    } else {
      new_number = number.toString();
    }
    return new_number;
  }

  String h24Toh12(time) {
    String new_time = time;
    if (!settings['24 Hours mode']) {
      int h = int.parse(time[0] + time[1]);
      int m = int.parse(time[3] + time[4]);
      String ampm = 'AM';
      if (h >= 12) {
        ampm = 'PM';
      }
      if (h == 0) {
        h = 12;
      } else if (h > 12) {
        h -= 12;
      }

      new_time = formatNumber(h) + ':' + formatNumber(m) + ' $ampm';
    } else {
      int h = int.parse(time[0] + time[1]);
      int m = int.parse(time[3] + time[4]);

      new_time = formatNumber(h) + ':' + formatNumber(m);
    }
    return new_time;
  }

  String translateCode(String code) {
    String new_code = code;
    if (code.length == 10) {
      if (settings['transtale Code']) {
        if (app_language == 'arabic') {
          var collageId = code[0] + code[1] + code[2];
          var buildNumber = code[3] + code[4];
          var floor = code[5];
          var hall = code[8] + code[9];
          return 'مبنى $buildNumber - الطابق $floor - قاعة رقم $hall';
        } else {
          var collageId = code[0] + code[1] + code[2];
          var buildNumber = code[3] + code[4];
          var floor = code[5];
          var hall = code[8] + code[9];
          return 'building $buildNumber - floor $floor - room $hall';
        }
      }
    }
    return new_code;
  }

  dynamic calc_time() {
    nextLec_hidden = true;
    doneLec_hidden = true;
    live_box_hidden = true;
    nolec_hidden = false;
    next_lectures_widgets = [];
    done_lectures_widgets = [];
    for (var i = 0; i < lectures.length; i++) {
      if (DateTime.now().weekday.toString() == lectures[i]['day'].toString()) {
        dynamic startTime = lectures[i]['startTime'];
        dynamic endingTime = lectures[i]['endingTime'];

        dynamic now = DateTime.now();
        dynamic lectureYear = now.toLocal().year;
        dynamic lectureMonth = now.toLocal().month;
        dynamic lectureDay = now.toLocal().day;
        dynamic lecStart = DateTime(
            lectureYear,
            lectureMonth,
            lectureDay,
            int.parse(startTime[0] + startTime[1]),
            int.parse(startTime[3] + startTime[4]));
        dynamic lecEnd = DateTime(
            lectureYear,
            lectureMonth,
            lectureDay,
            int.parse(endingTime[0] + endingTime[1]),
            int.parse(endingTime[3] + endingTime[4]));
        if (now.millisecondsSinceEpoch < lecStart.millisecondsSinceEpoch &&
            now.millisecondsSinceEpoch < lecEnd.millisecondsSinceEpoch) {
          //when nextLec
          nextLec_hidden = false;
          nolec_hidden = true;
          Duration difference = lecStart.difference(DateTime.now());
          String h = formatNumber(difference.inHours);
          String m = formatNumber(difference.inMinutes % 60);
          String s = formatNumber(difference.inSeconds % 60);
          next_lectures_widgets.add(
            list1(
              name: lectures[i]['name'].toString(),
              remain: '-$h:$m:$s',
              location: translateCode(lectures[i]['code'].toString()),
              time: h24Toh12(lectures[i]['startTime'].toString()),
              isDone: false,
            ),
          );
        } else if (now.millisecondsSinceEpoch >
                lecStart.millisecondsSinceEpoch &&
            now.millisecondsSinceEpoch > lecEnd.millisecondsSinceEpoch) {
          //when doneLec
          doneLec_hidden = false;
          nolec_hidden = true;
          done_lectures_widgets.add(
            list1(
              name: lectures[i]['name'].toString(),
              remain: '-00:00:00',
              location: translateCode(lectures[i]['code'].toString()),
              time: h24Toh12(lectures[i]['startTime'].toString()),
              isDone: true,
            ),
          );
        } else {
          //when liveLec
          Duration difference = DateTime.now().difference(lecStart);
          String h = formatNumber(difference.inHours);
          String m = formatNumber(difference.inMinutes % 60);
          String s = formatNumber(difference.inSeconds % 60);
          live_box_hidden = false;
          nolec_hidden = true;
          live_lecture_name = lectures[i]['name'].toString();
          live_box_countdown_text = '$h:$m:$s';
        }
      }
    }
  }

  void loadSchedule() {
    day1_widgets = [];
    day2_widgets = [];
    day3_widgets = [];
    day4_widgets = [];
    day5_widgets = [];
    day6_widgets = [];
    day7_widgets = [];

    day1_hidden = false;
    day2_hidden = false;
    day3_hidden = false;
    day4_hidden = false;
    day5_hidden = false;
    day6_hidden = false;
    day7_hidden = false;
    for (var i = 0; i < lectures.length; i++) {
      if (lectures[i]['day'].toString() == '7') {
        day7_hidden = true;
        day7_widgets.add(list2(
          text1: lectures[i]['name'].toString(),
          text2: h24Toh12(lectures[i]['startTime']) +
              ' -> ' +
              h24Toh12(lectures[i]['endingTime']),
          text3: translateCode(lectures[i]['code'].toString()),
          index: i,
        ));
      } else if (lectures[i]['day'].toString() == '1') {
        day1_hidden = true;
        day1_widgets.add(list2(
          text1: lectures[i]['name'].toString(),
          text2: h24Toh12(lectures[i]['startTime']) +
              ' -> ' +
              h24Toh12(lectures[i]['endingTime']),
          text3: translateCode(lectures[i]['code'].toString()),
          index: i,
        ));
      } else if (lectures[i]['day'].toString() == '2') {
        day2_hidden = true;
        day2_widgets.add(list2(
          text1: lectures[i]['name'].toString(),
          text2: h24Toh12(lectures[i]['startTime']) +
              ' -> ' +
              h24Toh12(lectures[i]['endingTime']),
          text3: translateCode(lectures[i]['code'].toString()),
          index: i,
        ));
      } else if (lectures[i]['day'].toString() == '3') {
        day3_hidden = true;
        day3_widgets.add(list2(
          text1: lectures[i]['name'].toString(),
          text2: h24Toh12(lectures[i]['startTime']) +
              ' -> ' +
              h24Toh12(lectures[i]['endingTime']),
          text3: translateCode(lectures[i]['code'].toString()),
          index: i,
        ));
      }
      if (lectures[i]['day'].toString() == '4') {
        day4_hidden = true;
        day4_widgets.add(list2(
          text1: lectures[i]['name'].toString(),
          text2: h24Toh12(lectures[i]['startTime']) +
              ' -> ' +
              h24Toh12(lectures[i]['endingTime']),
          text3: translateCode(lectures[i]['code'].toString()),
          index: i,
        ));
      }
      if (lectures[i]['day'].toString() == '5') {
        day5_hidden = true;
        day5_widgets.add(list2(
          text1: lectures[i]['name'].toString(),
          text2: h24Toh12(lectures[i]['startTime']) +
              ' -> ' +
              h24Toh12(lectures[i]['endingTime']),
          text3: translateCode(lectures[i]['code'].toString()),
          index: i,
        ));
      }
      if (lectures[i]['day'].toString() == '6') {
        day6_hidden = true;
        day6_widgets.add(list2(
          text1: lectures[i]['name'].toString(),
          text2: h24Toh12(lectures[i]['startTime']) +
              ' -> ' +
              h24Toh12(lectures[i]['endingTime']),
          text3: translateCode(lectures[i]['code'].toString()),
          index: i,
        ));
      }
    }
  }

  void toggoleDarkMode() {
    animated_filter['ignored'] = false;if (!darkMode) {
            nextThemeColor = Color.fromRGBO(21, 21, 25, 1);
          } else {
            nextThemeColor = Colors.white;
          }

    if (darkMode) {
      themeModeImageSrc = 'assets/sun.png';
    } else {
      themeModeImageSrc = 'assets/moon.png';
    }
    filterAnm = [
      {
        'target': animated_filter['opacity'],
        'value': [0, 1],
        'duration': 300,
      },
      {
        'target': animated_filter['size'],
        'duration': 500,
        'value': [300, 150],
        'nisted': true,
        'easing': 'easeInOutExpo',
        'end': () {
          darkMode = !darkMode;
          save();
        }
      },
      {
        'target': animated_filter['opacity'],
        'value': [1, 0],
        'duration': 300,
        'delay': 500,
        'end': () {
          if (!darkMode) {
            nextThemeColor = Color.fromRGBO(21, 21, 25, 1);
          } else {
            nextThemeColor = Colors.white;
          }
          animated_filter['ignored'] = true;
        }
      },
      {
        'target': animated_filter['size'],
        'duration': 500,
        'value': [150, 150 / 2],
        'nisted': true,
      },
    ];
  }

  String filter2_text = 'English';
  void toggoleLanguage() {
    animated_filter2['opacity']['value'] = 0.0;
    animated_filter2['margin']['value'] = 100.0;
    app_pointer = true;
    if (app_language == 'arabic') {
      filter2_text = 'English';
    } else {
      filter2_text = 'عربي';
    }
    filter2_anm = [
      {
        'target': animated_filter2['x'],
        'value': [1, 0],
        'duration': 250,
        'easing': 'easeOutExpo'
      },
      {
        'target': animated_filter2['opacity'],
        'value': [0, 1],
        'duration': 250,
      },
      {
        'target': animated_filter2['margin'],
        'value': [100.0, 0.0],
        'duration': 300,
        'easing': 'easeOutExpo',
        'nisted': true,
      },
      {
        'target': animated_filter2['opacity'],
        'value': [1.0, 0.0],
        'delay': 500,
        'duration': 300,
        'easing': 'easeOutExpo',
      },
      {
        'target': animated_filter2['x'],
        'value': [0, -1],
        'duration': 300,
        'start': () {
          app_pointer = false;
          if (app_language == 'arabic') {
            app_language = 'english';
            save();
          } else {
            app_language = 'arabic';
            save();
          }
          loadSchedule();
        }
      }
    ];
  }

  void goToHome() {
    currentPage = 'home';
    nav2filter_anm = [
      {
        'target': animated_nav2filter['x'],
        'value': [animated_nav2filter['x']['value'], 0.0],
        'duration': 150,
        'easing': 'easeOutExpo',
      }
    ];
  }

  void goToSchedule() {
    editVisible = false;
    loadSchedule();
    currentPage = 'schedule';
    nav2filter_anm = [
      {
        'target': animated_nav2filter['x'],
        'value': [animated_nav2filter['x']['value'], 1.0],
        'duration': 150,
        'easing': 'easeOutExpo',
      }
    ];
  }

  void goToAddPage(String mode) {
    add_mode = mode;
    if (add_mode == 'edit') {
      lec_name.text = lectures[selectedLec]['name'].toString();
      inputDay = int.parse(lectures[selectedLec]['day'].toString());
      code_controller.text = lectures[selectedLec]['code'].toString();
      startTime = TimeOfDay(
          hour: int.parse(lectures[selectedLec]['startTime'].toString()[0] +
              lectures[selectedLec]['startTime'].toString()[1]),
          minute: int.parse(lectures[selectedLec]['startTime'].toString()[3] +
              lectures[selectedLec]['startTime'].toString()[4]));
      endTime = TimeOfDay(
          hour: int.parse(lectures[selectedLec]['endingTime'].toString()[0] +
              lectures[selectedLec]['endingTime'].toString()[1]),
          minute: int.parse(lectures[selectedLec]['endingTime'].toString()[3] +
              lectures[selectedLec]['endingTime'].toString()[4]));
    } else {
      startTime = TimeOfDay(hour: 8, minute: 0);
      endTime = TimeOfDay(hour: 9, minute: 40);
      lec_name.text = '';
      code_controller.text = '';
      inputDay = 7;
    }
    currentPage = 'add page';
    notifyListeners();
  }

  void goToSettings() {
    renderCheckbox();
    settings_page_open = true;
    settings_page_anm = [
      {
        'target': animated_settings_page['opacity'],
        'value': [0.0, 1.0],
        'duration': 150,
      },
      {
        'target': animated_settings_page['scale'],
        'value': [1.3, 1.0],
        'duration': 150,
        // 'easing': 'easeOutBack',
        'nisted': true,
      }
    ];
  }

  void closeSettings() {
    settings_page_open = false;
    loadSchedule();
    settings_page_anm = [
      {
        'target': animated_settings_page['opacity'],
        'value': [1.0, 0.0],
        'duration': 150,
      },
      {
        'target': animated_settings_page['scale'],
        'value': [1.0, 1.3],
        'duration': 150,
        // 'easing': 'easeInBack',
        'nisted': true,
      }
    ];
  }

  void deleteLecture(int index) {
    lectures.removeAt(index);
    save();
    loadSchedule();
  }

  void globPlayAnimations() {
    playAnimation(notify_anm, true);
    playAnimation(filterAnm, true);
    playAnimation(nav2filter_anm, true);
    playAnimation(filter2_anm, true);
    playAnimation(live_ball_anm, true);
    playAnimation(settings_page_anm, true);
    for (var i = 0; i < animated_checkbox.length; i++) {
      playAnimation(animated_checkbox[i]['anm'], true);
    }
    calc_time();
    notifyListeners();
  }
}

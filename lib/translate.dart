String translate (String from, String to, String text) {
  String rslt = text;
  List words = [
    {'english': 'password should be 8 chars at least!', 'arabic': 'كلمة المرور يجب ان تكون 8 احرف على الأقل'},
    {'english': 'password should include an english letter', 'arabic': 'يجب أن تحتوي كلمة المرور على حرف إنجليزي'},
    {'english': 'user not created!', 'arabic': 'حدث خطأ ما'},
    {'english': 'username is taken!', 'arabic': 'اسم المستخدم ماخوذ!'},
    {'english': 'username should be english letters only!', 'arabic': 'يجب أن يكون اسم المستخدم بأحرف إنجليزية فقط!'},
  ];
  for(var i = 0; i < words.length; i++) {
    if(words[i][from] == text && words[i][from] != null && words[i][to] != null) {
      rslt = (words[i][to]);
      break;
    }
  }
  return rslt;
}
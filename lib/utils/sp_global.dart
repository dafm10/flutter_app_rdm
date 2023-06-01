import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal {
  SPGlobal._();
  static final SPGlobal _instance = SPGlobal._();
  factory SPGlobal() {
    return _instance;
  }

  late SharedPreferences _prefs;

  Future initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set isLogin(String value) {
    _prefs.setString('isLogin', value);
  }

  String get isLogin {
    return _prefs.getString('isLogin') ?? "";
  }

  set userName(String value) {
    _prefs.setString('userName', value);
  }

  String get userName {
    return _prefs.getString('userName') ?? "";
  }

  set doctorId(String value) {
    _prefs.setString('doctorId', value);
  }

  String get doctorId {
    return _prefs.getString('doctorId') ?? "";
  }
}

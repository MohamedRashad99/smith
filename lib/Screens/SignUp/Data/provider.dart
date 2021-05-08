import 'dart:io';

import 'package:flutter/foundation.dart';

class SignUpProvider extends ChangeNotifier {
  var phone;
  var name;
  var google_token;
  var type;
  var api_token;
  var updated_at;
  var created_at;
  var id;
   var car_number;
  setToken(String token){
    api_token=token;
    notifyListeners();
  }
}

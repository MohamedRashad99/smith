
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smith/Screens/ChooseService/pages.dart';
import 'package:smith/Screens/SignUp/Data/provider.dart';
import 'package:smith/generated/locale_keys.g.dart';
import 'package:smith/network/network.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith/global.dart'as globals;

import '../../../constants.dart';


class SignInController{
  NetWork _netWork = NetWork();

  Future SignIn({context,var num,var pass})async{
    var provider = Provider.of<SignUpProvider>(context,listen: false);

    savePref(String token)async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("token", token);
      print(preferences.getString("token"));
    }
    Map<String,dynamic> _body = {
      "phone":"+966${num}",
      "password":"${pass}",
    };
    var formData = FormData.fromMap(_body);
    var response = _netWork.postData(url: 'login',
      formData: formData,);
    response.then((value){
      print(value.data['data']);
      print(value['msg']);
      globals.uid=value['data']['id'];
      print("UerID : ${globals.uid}");

      if(value['msg']=='success'){
        savePref("${value['data']['api_token']}");


        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            BottomNavBar()), (Route<dynamic> route) => false);


      }else if(value['data'] == 'check your phone or password'){
        print("erfgegfe${value}");
        Fluttertoast.showToast(
            msg: "${LocaleKeys.incorrectCredentials.tr()}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });

    return response;
  }
  /*
class SignUp_post{
  NetWork _netWork = NetWork();


  Future PostNum(context){
    var provider = Provider.of<SignUpProvider>(context,listen: false);
    savePref(String token)async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("token", token);
      print(preferences.getString("token"));
    }
    Map<String,dynamic>_body ={
      "phone":"+966${provider.phone}",
      "name":provider.name,
      //////////////////////////
      "password":provider.phone,
      ///////////////////////////////
      "google_token":provider.google_token,

        };
    FormData _formData = FormData.fromMap(_body);
    var response = _netWork.postData(url: 'register',
        formData: _formData
    );
    // if(response){}
    response.then((value) {
      print("kkkkk $value");

      print(value['data']['phone']??'الفون متبعتش ');
      print(value['data']['name']??'الاسم متبعتش ');
      print(value['data']['password']??'الباض متبعتش ');
      print(value['data']['google_token']??'hhh');
      if(value['msg']=='success'){//api_token
        provider.setToken(value['data']['api_token']);
        savePref("Token = \t ${value['data']['api_token']}");
        print(provider.api_token);

        Fluttertoast.showToast(
            msg: "${LocaleKeys.welcome.tr()} :\t  ${provider.name}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
      }
      else if(value['msg']=='error'||value['data']['phone']=='[The phone has already been taken.]'){
        Fluttertoast.showToast(
            msg: "${LocaleKeys.phoneNumberExist.tr()}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: kPrimaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      print("${value} صح كده ");
    });
    return response;
  }
}*/
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smith/Screens/ChooseService/pages.dart';
import 'package:smith/Screens/SignIn/view.dart';
import 'package:smith/Screens/SignUp/Data/provider.dart';
import 'package:smith/constants.dart';

class SplashScrren extends StatefulWidget {
  @override
  _SplashScrrenState createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {

  getToken()async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
   final String token= preferences.getString("token");
   print(" Token = \t $token ");
    if(token==null){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>
            SignInView(),
        ),
      );
    }else{
      var provider = Provider.of<SignUpProvider>(context,listen: false);
      provider.setToken(token);
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder:
          (context) => BottomNavBar(),
      ),
    );}
  }
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3),
          ()=>getToken(),

    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      body: Center(
        child: Container(
            height: height*0.3,
          child: Image.asset("assets/images/loogo.PNG"),
          
        ),
      ),
    );
  }
}

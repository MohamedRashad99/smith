import 'package:flutter/material.dart';
import 'package:smith/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith/generated/locale_keys.g.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        leading: Image.asset("assets/images/arrow.jpeg",scale: 10,),
        centerTitle: true,
        title:Text(LocaleKeys.addCar.tr(),style: TextStyle(fontSize: 22,color: kHomeColor),),
      ),
      body: Container(
        // color: Colors.black,
          child: Center(
              child: Text(
                LocaleKeys.dateOf.tr(),
              ))),
    );
  }
}

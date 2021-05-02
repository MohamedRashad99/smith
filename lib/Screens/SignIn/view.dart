import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:smith/Screens/Notification/view.dart';
import 'package:smith/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith/generated/locale_keys.g.dart';
import 'package:smith/generated/locale_keys.g.dart';
import 'package:smith/generated/locale_keys.g.dart';
import 'package:smith/widgets/componant.dart';
import 'package:smith/widgets/customButton.dart';
import 'package:smith/widgets/customTextFeild.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:smith/widgets/smallButton.dart';


class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _carNumController = TextEditingController();

  int _page = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            GestureDetector(onTap: (){
              final CurvedNavigationBarState navBarState =
                  _bottomNavigationKey.currentState;
              navBarState.setPage(1);
               navigateTo(
                   context, NotificationView()
               );

               },child: Icon(Icons.notifications, size: 30)),
            GestureDetector(onTap: (){

              final CurvedNavigationBarState navBarStatee =
                  _bottomNavigationKey.currentState;
              navBarStatee.setPage(0);
              },child: Icon(Icons.add, size: 30)),


          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: kPrimaryColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),

        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/arrow.jpeg",
                scale: 10,
              )),
          centerTitle: true,
          title: Text(
            LocaleKeys.addCar.tr(),
            style: TextStyle(
                fontSize: 22, color: kHomeColor, fontFamily: "dinnextl bold"),
          ),
        ),
        body: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Text(
                    LocaleKeys.addCar.tr(),
                    style: TextStyle(fontSize: 30, fontFamily: "dinnextl bold"),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.2,
                    child: Image.asset("assets/images/loogo.PNG"),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomTextField(
                    label: true,
                    hint: LocaleKeys.enterPhone.tr(),
                    dIcon: Icons.phone_android,
                    controller: _phoneController,
                    type: TextInputType.phone,
                    valid: qValidator([
                      IsRequired(msg: LocaleKeys.enterPhone.tr()),
                      MinLength(5),
                    ]),
                  ),
                  CustomTextField(
                    hint: LocaleKeys.plateNumber.tr(),
                    dIcon: Icons.car_rental,
                    controller: _carNumController,
                    type: TextInputType.number,
                    valid: qValidator([
                      IsRequired(msg: LocaleKeys.plateNumber.tr()),
                      MinLength(5),
                    ]),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomButton(
                    title: LocaleKeys.save.tr(),
                    onPressed: null,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.doYouWantLogOut.tr(),
          style: TextStyle(fontSize: 20, color: kPrimaryColor, fontFamily: "dinnextl bold"),),
        content: Text(LocaleKeys.pleaseMake.tr(),
          style: TextStyle(fontSize: 10, color: kPrimaryColor,),),
        actions: <Widget>[
         /* FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(LocaleKeys.no.tr(),style: TextStyle(fontSize: 20, color: kPrimaryColor, fontFamily: "dinnextl bold"),),
          ),*/

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             SmallButton(onPressed:() => Navigator.of(context).pop(false),
                 title: LocaleKeys.no.tr()),
             SizedBox(width: 40,),
             SmallButton(onPressed: () => exit(0),
                 title: LocaleKeys.yes.tr()),
           ],
         ),

         /* FlatButton(
            onPressed: () => exit(0),
            *//*Navigator.of(context).pop(true)*//*
            child:
            Text(LocaleKeys.yes.tr(),style: TextStyle(fontSize: 20, color: kPrimaryColor, fontFamily: "dinnextl bold"),),
          ),*/
        ],
      ),
    ) ??
        false;
  }
}

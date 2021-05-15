
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:smith/Screens/Notification/view.dart';
import 'package:smith/Screens/SignIn/view.dart';
import 'package:smith/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith/generated/locale_keys.g.dart';

import 'package:smith/widgets/customButton.dart';
import 'package:smith/widgets/customTextFeild.dart';

import 'Data/storePhone_Controller.dart';
import 'Data/storePhone_Model.dart';



class AddCar extends StatefulWidget {
  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final _formKey = GlobalKey<FormState>();

  SphoneController _sphoneController = SphoneController();



  bool loading = false;
  Future _setData()async{
    final isValid = _formKey.currentState.validate();
    if(isValid) {
      await _sphoneController.setPhoneData(
          carNum: _carNumController.text,
          phone:  _phoneController.text
      );
    }
    setState(() {
      loading = true;
    });
  }
  @override
  void dispose() {
    _carNumController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  final  TextEditingController _phoneController = TextEditingController();
  final TextEditingController _carNumController = TextEditingController();

  final NotificationView notificationView = NotificationView();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(context),
      body: Form(
        key: _formKey,
        child: SafeArea(
          top: true,
          bottom:true ,
          right: true,
          left: true,
          child: SizedBox(
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
                      height: height * 0.02,
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
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _setData();
                        }
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInView()));            },
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
    );
  }
}


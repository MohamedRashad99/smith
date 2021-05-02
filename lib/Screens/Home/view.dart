import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:smith/Screens/SignUp/view.dart';
import 'package:smith/constants.dart';
import 'package:smith/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith/widgets/customButton.dart';
import 'package:smith/widgets/customTextFeild.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _phoneController= TextEditingController();
  TextEditingController _passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,

      body: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height*0.1,),

                Container(
                  width: width*0.4,
                  child: Image.asset("assets/images/loogo.PNG"),
                ),
                SizedBox(height: height*0.03,),
                Container(
                  padding: EdgeInsets.only(right: width*0.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocaleKeys.welcome.tr(),style: TextStyle(fontSize: 28,fontFamily:"dinnextl bold",)),
                      Text(LocaleKeys.signToContinue.tr(),style: TextStyle(fontSize: 20,fontFamily:"dinnextl bold",color: kTextColor)),

                    ],
                  ),
                ),

                SizedBox(height: height*0.05,),

                CustomTextField(
                  label: true,
                  hint: LocaleKeys.enterPhone.tr(),
                  dIcon: Icons.phone_android,
                  controller: _phoneController,
                  type: TextInputType.phone,
                  valid:qValidator([
                    IsRequired(msg:LocaleKeys.enterPhone.tr()),
                    MinLength(5),
                  ]),

                ),
                CustomTextField(
                  hint: LocaleKeys.plateNumber.tr(),
                  icon: Icons.lock_outline,
                  dIcon: Icons.lock_outline,
                  controller: _passwordController,
                  type: TextInputType.text,
                  valid:qValidator([
                    IsRequired(msg:LocaleKeys.plateNumber.tr()),
                    MinLength(5),
                  ]),

                ),
                SizedBox(height: height*0.1,),
                CustomButton(
                  title: LocaleKeys.signIn.tr(),
                  onPressed: null,
                ),
                SizedBox(height: height * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(LocaleKeys.donHave.tr(), style: TextStyle(color: kTextColor,
                        fontFamily: "dinnextl bold",
                        fontSize: 16),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                      },
                      child: Text(LocaleKeys.signup.tr(), style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: "dinnextl bold",
                          fontSize: 18),),
                    ),

                  ],
                ),

              ],
            ),
          )),
    );
  }
}

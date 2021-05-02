import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:smith/Screens/SignIn/view.dart';
import 'package:smith/constants.dart';
import 'package:smith/generated/locale_keys.g.dart';
import 'package:smith/widgets/customButton.dart';
import 'package:smith/widgets/customTextFeild.dart';
import 'package:easy_localization/easy_localization.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController= TextEditingController();
  TextEditingController _phoneController= TextEditingController();
  TextEditingController _passwordController= TextEditingController();
  TextEditingController _confirmPasswordController= TextEditingController();



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
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height*0.1,),

                Container(
                  width: width*0.4,
                  child: Image.asset("assets/images/loogo.PNG"),
                ),
                SizedBox(height: height*0.02,),
                Container(
                  padding: EdgeInsets.only(right: width*0.55),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocaleKeys.signup.tr(),style: TextStyle(fontSize: 28,fontFamily:"dinnextl bold",)),

                    ],
                  ),
                ),
                SizedBox(height: height*0.04,),
                CustomTextField(
                  hint: LocaleKeys.userName.tr(),
                  dIcon: Icons.person,
                  controller: _nameController,
                  type: TextInputType.name,
                  valid:qValidator([
                    IsRequired(msg:LocaleKeys.userName.tr()),
                    MinLength(5),
                  ]),

                ),
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
                  hint: LocaleKeys.password.tr(),
                  icon: Icons.lock_outline,
                  dIcon: Icons.lock_outline,
                  controller: _passwordController,
                  type: TextInputType.text,
                  valid:qValidator([
                    IsRequired(msg:LocaleKeys.password.tr()),
                    MinLength(5),
                  ]),

                ),
                CustomTextField(
                  hint: LocaleKeys.confirmPass.tr(),
                  icon: Icons.lock_outline,
                  dIcon: Icons.lock_outline,
                  controller: _confirmPasswordController,
                  type: TextInputType.text,
                  valid:qValidator([
                    IsRequired(msg:LocaleKeys.confirmPass.tr()),
                    MinLength(5),
                  ]),

                ),
                SizedBox(height: height*0.05,),
                CustomButton(
                  title: LocaleKeys.signup.tr(),
                  onPressed: null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(LocaleKeys.donHave.tr(), style: TextStyle(color: kTextColor,
                        fontFamily: "dinnextl bold",
                        fontSize: 16),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                      },
                      child: Text(LocaleKeys.signIn.tr(), style: TextStyle(
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

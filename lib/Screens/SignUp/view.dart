import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:smith/Screens/SignIn/view.dart';
import 'package:smith/constants.dart';
import 'package:smith/generated/locale_keys.g.dart';
import 'package:smith/widgets/customButton.dart';
import 'package:smith/widgets/customTextFeild.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith/widgets/donotHave.dart';

import 'Data/provider.dart';
import 'Data/registerController.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final  TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var provider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.decelerate,
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.06,
                    ),
                    Container(
                      width: width * 0.4,
                      child: Image.asset("assets/images/loogo.PNG"),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: width * 0.55),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LocaleKeys.signup.tr(),
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: "dinnextl bold",
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    CustomTextField(
                      hint: LocaleKeys.userName.tr(),
                      dIcon: Icons.person,
                      controller: _nameController,
                      type: TextInputType.name,
                      valid: (v) {
                        if (v.isEmpty) {
                          return LocaleKeys.userName.tr();
                        } else if (v.length < 4) {
                          return context.locale == Locale('en', 'US')
                              ? "Name must be content of two minimum words"
                              : "?????? ???? ?????????? ?????????? ???? ???????????? ?????? ??????????";
                        }
                        return null;
                      },
                      onsave: (v) {
                        provider.name = v;
                      },
                    ),
                    CustomTextField(
                      label: true,
                      hint: LocaleKeys.enterPhone.tr(),
                      dIcon: Icons.phone_android,
                      controller: _phoneController,
                      type: TextInputType.phone,
                      valid: (v) {
                        if (v.isEmpty) {
                          return LocaleKeys.enterYourPhoneNum.tr();
                        } else if (v.length < 9 || v.length > 9) {
                          return context.locale == Locale('en', 'US')
                              ? "Phone number should be 9 numbers"
                              : "???????? ???? ?????????? ?????? ???????? ???? 9 ??????????";
                        }
                        return null;
                      },
                      onsave: (v) {
                        provider.phone = v;
                      },
                    ),
                    CustomTextField(
                      hint: LocaleKeys.password.tr(),
                      icon: Icons.lock_outline,
                      dIcon: Icons.lock_outline,
                      controller: _passwordController,
                      type: TextInputType.text,
                      valid: qValidator([
                        IsRequired(msg: LocaleKeys.password.tr()),
                        MinLength(5),
                        Match(_confirmPasswordController.text),
                      ]),
                    ),
                    CustomTextField(
                      hint: LocaleKeys.confirmPass.tr(),
                      icon: Icons.lock_outline,
                      dIcon: Icons.lock_outline,
                      controller: _confirmPasswordController,
                      type: TextInputType.text,
                      valid: qValidator([
                        IsRequired(msg: LocaleKeys.confirmPass.tr()),
                        MinLength(5),
                        Match(_passwordController.text),

                      ]),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomButton(
                      title: LocaleKeys.signup.tr(),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          SignUp_post().PostNum(context).then((value) {
                            setState(() {
                              isLoading = false;
                            });
                          });
                        } else {
                          print("nooooo");
                        }
                      },
                    ),
                    DoNotHave(
                      text: LocaleKeys.signIn.tr(),
                      have: LocaleKeys.alreadyHaveAnAccount.tr(),
                      route: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignInView())),
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:smith/Screens/SignUp/Data/provider.dart';
import 'package:smith/Screens/SignUp/view.dart';
import 'package:smith/constants.dart';
import 'package:smith/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smith/widgets/customButton.dart';
import 'package:smith/widgets/customTextFeild.dart';
import 'package:smith/widgets/donotHave.dart';

import 'Data/loginController.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
  bool isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      final phoneNo = _phoneController.text.trim();
      final password = _passwordController.text.trim();
      setState(() {
        isLoading = true;
      });
      SignInController()
          .SignIn(context: context, num: phoneNo, pass: password)
          .then((value) {
        setState(() {
          isLoading = false;
        });
      });
      print('$phoneNo $password');

      print('navigate to home screen');
      return;
    } else {
      print('show snack bar with error');
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Container(
                      width: width * 0.4,
                      child: Image.asset("assets/images/loogo.PNG"),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: width * 0.4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LocaleKeys.welcome.tr(),
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: "dinnextl bold",
                              )),
                          Text(LocaleKeys.signToContinue.tr(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "dinnextl bold",
                                  color: kTextColor)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    CustomTextField(
                      label: true,
                      hint: LocaleKeys.enterPhone.tr(),
                      dIcon: Icons.phone_android,
                      type: TextInputType.phone,
                      valid: qValidator([
                        IsRequired(msg: LocaleKeys.enterPhone.tr()),
                        MinLength(5),
                      ]),
                      controller: _phoneController,
                    ),
                    CustomTextField(
                      hint: LocaleKeys.password.tr(),
                      icon: Icons.lock_outline,
                      dIcon: Icons.lock_outline,
                      type: TextInputType.text,
                      valid: qValidator([
                        IsRequired(msg: LocaleKeys.password.tr()),
                        MinLength(5),
                      ]),
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    CustomButton(

                      isLoading: isLoading,
                      onPressed: _submit,
                      title: LocaleKeys.signIn.tr(),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    DoNotHave(
                      text: LocaleKeys.signup.tr(),
                      have: LocaleKeys.donHave.tr(),
                      route: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen())),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

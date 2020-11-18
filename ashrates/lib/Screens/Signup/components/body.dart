import 'package:ashrates/Screens/Login/login_screen.dart';
import 'package:ashrates/Screens/Welcome/welcome_screen.dart';
import 'package:ashrates/components/already_have_an_account_acheck.dart';
import 'package:ashrates/components/rounded_button.dart';
import 'package:ashrates/components/rounded_input_field.dart';
import 'package:ashrates/components/rounded_password_field.dart';
import 'package:ashrates/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../main.dart';
import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final _formkey = GlobalKey<FormState>();
  String email, password, name;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signUp() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .signUpWithEmailAndPassword(email, password)
          .then((value) {
        if (value != null) {
          setState(() {
            _isLoading = false;
          });



          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/btc.svg",
                height: size.height * 0.30,
              ),

              RoundedInputField(
                hintText: "Your Name",
                onChanged: (value) {
                  name = value;
                },
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  email =value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password =value;
                },
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  signUp();
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}


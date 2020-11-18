import 'package:ashrates/Screens/Signup/signup_screen.dart';

import 'package:ashrates/components/already_have_an_account_acheck.dart';
import 'package:ashrates/components/rounded_button.dart';
import 'package:ashrates/components/rounded_input_field.dart';
import 'package:ashrates/components/rounded_password_field.dart';
import 'package:ashrates/main.dart';
import 'package:ashrates/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final _formkey = GlobalKey<FormState>();
  String email, password;
  AuthService authService = new AuthService();

  bool _isLoading = false;

  signIn() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.signInEmailAndPass(email, password).then((val) {
        if (val != null) {
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



      child : Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login1.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedButton(
                  text: "LOGIN",
                  press: (

                      ) {
                    signIn();
                  },
                ),

              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
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

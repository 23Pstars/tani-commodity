import 'package:flutter/material.dart';
import 'package:tani_commodity/src/utils/auth_util.dart';
import 'package:tani_commodity/src/widgets/background_curve.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email, _password, _password_confirmation, _name, _address;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final BaseAuth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Screen'),
      // ),
      body: Stack(
      children: <Widget> [
        BackgroundCurve(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          // FlutterLogo(
          //   size: 100.0,
          // ),
          Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Name"
                        ),
                        keyboardType: TextInputType.text,
                        validator: (input) {
                          if(input.isEmpty) {
                            return "Name is required!";
                          }
                        },
                        onSaved: (input) => _name = input,
                      ),
                      Padding(padding: const EdgeInsets.only(top: 10.0)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Address"
                        ),
                        keyboardType: TextInputType.text,
                        validator: (input) {
                          if(input.isEmpty) {
                            return "Address is required!";
                          }
                        },
                        onSaved: (input) => _address = input,
                      ),
                      Padding(padding: const EdgeInsets.only(top: 10.0)),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Your Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Email is required!";
                          }
                        },
                        onSaved: (input) => _email = input,
                      ),
                      Padding(padding: const EdgeInsets.only(top: 10.0)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Password"
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (input) {
                          if(input.isEmpty) {
                            return "Password is required!";
                          } else if (input.length < 6) {
                            return "Password length must be at least 6 character!";
                          }
                        },
                        onSaved: (input) => _password = input,
                      ),
                      Padding(padding: const EdgeInsets.only(top: 10.0)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Re-enter Your Password"
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (input) {
                          if(input.isEmpty) {
                            return "Confirm password is required!";
                          } else if (_password != _password_confirmation) {
                            return "Password and confirm password does not match.";
                          }
                        },
                        onSaved: (input) => _password_confirmation = input,
                      ),
                      
                      Padding(padding: const EdgeInsets.only(top: 60.0)),
                      MaterialButton(
                        height: 50.0,
                        minWidth: 200.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: Text("Register"),
                        onPressed: () async {
                          final formState = _formKey.currentState;
                          if (formState.validate()) {
                            formState.save();
                            try {
                              String userUid = await auth.signUp(_email, _password, _name, _address);

                            } catch (e) {}
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ]
      ),
    );
  }
}

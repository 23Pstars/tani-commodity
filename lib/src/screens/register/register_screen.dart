import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email, _password, _name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login Screen'),
      // ),
      body: Stack(
      children: <Widget> [
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
                        obscureText: true,
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
                      
                      Padding(padding: const EdgeInsets.only(top: 60.0)),
                      MaterialButton(
                        height: 50.0,
                        minWidth: 200.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: Text("Login"),
                        onPressed: () async {
                          final formState = _formKey.currentState;
                          if (formState.validate()) {
                            formState.save();
                            try {
                              FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
                              Navigator.of(context).pushNamed('/home');
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
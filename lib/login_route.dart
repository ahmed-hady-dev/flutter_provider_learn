import 'package:flutter/material.dart';
import 'package:flutter_provider_learn/sign_in_detail_model.dart';
import 'package:provider/provider.dart';

class LoginRoute extends StatelessWidget {
  final TextStyle style = TextStyle(fontSize: 20.0);

  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userField = TextField(
      style: style,
      controller: userNameTextController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "User Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.horizontal())),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: passwordTextController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.horizontal())),
    );
    final loginButon = Material(
      elevation: 5.0,
      color: Colors.blueAccent[400],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Provider.of<SignInDetailsModel>(context, listen: false)
              .signInUserName(userNameTextController.text);
          Provider.of<SignInDetailsModel>(context, listen: false)
              .signInPassword(passwordTextController.text);

          // Navigate back to first route when tapped.
          Navigator.pop(context);
        },
        child: Text("Sign-In",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 25.0),
                userField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 25.0,
                ),
                loginButon,
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

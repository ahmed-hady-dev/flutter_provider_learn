import 'package:flutter/material.dart';
import 'package:flutter_provider_learn/login_route.dart';
import 'package:flutter_provider_learn/sign_in_detail_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<SignInDetailsModel>(
      create: (_) => SignInDetailsModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static const String _title = 'Provider Sign-In Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title, home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Provider Login Example'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginRoute()),
            );
          },
        ),
      ]),
      body: Center(
        child: Consumer<SignInDetailsModel>(
          builder: (context, userModel, child) {
            String messageUserName = (userModel.user == ""
                ? "Please sign-in"
                : "Welcome ${userModel.user}");
            String messagePassword = (userModel.user == ""
                ? "Please input password"
                : "Welcome ${userModel.pass}");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(messageUserName,
                    style: Theme.of(context).textTheme.headline4),
                Text(messagePassword,
                    style: Theme.of(context).textTheme.headline4),
              ],
            );
          },
        ),
      ),
    );
  }
}

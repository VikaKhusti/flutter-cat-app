import 'package:flutter/material.dart';
import 'package:flutter_cat_test_app/pages/auth.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        centerTitle: true,
      ),
      body: !isFLogin ? Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('LogIn with Google'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: ()  {
                  googleSignIn().whenComplete(() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage())));
                },
                  ),
              RaisedButton(
                child: Text('LogIn with Facebook'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () async {
                  await handleLogin();
                },
              )
                  ],
                  ),
               ),

            ) : Center(
        //ToDo sign out
      )

      );

  }
}








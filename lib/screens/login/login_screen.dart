import 'package:flutter/material.dart';
import 'package:todo_app/screens/login/tabs/signin_tab.dart';
import 'package:todo_app/screens/login/tabs/signup_tab.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Login"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Sign in"),
              ),
              Tab(
                child: Text("Sign up"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SignInTab(),
            SignUpTab(),
          ],
        ),
      ),
    );
  }
}

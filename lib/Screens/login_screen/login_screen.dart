import 'package:flutter/material.dart';
import 'package:flutter_covid_app_lab_1/model/user.dart';
import 'package:flutter_session/flutter_session.dart';

import 'components/logo_name_and_slogan.dart';
import 'components/no_account.dart';
import 'components/rounded_buttons.dart';
import 'components/rounded_input_field.dart';
import 'login_presenter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginPageContract {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading;
  String _username, _password;
  LoginPagePresenter _presenter;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    _presenter = LoginPagePresenter(this);
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final usernameField = RoundedInputField(
      key: Key('login_username_input_field'),
      icon: Icons.person,
      hintText: "用户名",
      onSaved: (value) => _username = value,
      validator: (value) {
        if (value.isEmpty) {
          return '请输入用户名';
        }
        return null;
      },
    );
    final passwordField = RoundedInputField(
      key: Key('login_password_input_field'),
      obscureText: true,
      icon: Icons.lock,
      hintText: "密码",
      suffixIcon: Icons.visibility,
      onSaved: (value) => _password = value,
      validator: (value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
        return null;
      },
    );
    final loginForm = Form(
      key: formKey,
      child: Column(
        children: [
          usernameField,
          passwordField,
        ],
      ),
    );

    var loginBtn = RoundedButton(
      text: "登 录",
      press: () {
        if (formKey.currentState.validate()) {
          setState(() {
            isLoading = true;
            formKey.currentState.save();
            _presenter.doLogin(_username, _password);
          });
        }
      },
    );

    var body = SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LogoNameAndSlogan(),
                SizedBox(
                  height: size.height * 0.05,
                ),
                loginForm,
                loginBtn,
                NoAccount(
                  key: Key('redirect_to_signup_button'),
                  press: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );

    return new Scaffold(
      key: scaffoldKey,
      body: body,
    );
  }

  @override
  void onLoginError(Error error) {
    _showSnackBar("登录失败.");
    print(error.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Future<void> onLoginSuccess(User user) async {
    _showSnackBar(user.username.toString() + ' 登录成功');
    await FlutterSession().set("token", user);
    setState(() {
      isLoading = false;
    });
    Future.delayed(
        Duration(seconds: 1), () => Navigator.of(context).pushNamed('/home'));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/login/presenter/pages/login/login_store.dart';
import 'package:tetrazolium/app/modules/login/presenter/pages/widget/form_container.dart';
import 'package:tetrazolium/app/modules/login/presenter/pages/widget/stagger_animation.dart';
import 'package:tetrazolium/app/shared/util/constants.dart';
import 'package:tetrazolium/app/shared/widgets/logo_widget.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late LoginStore controller;

  @override
  void initState() {
    super.initState();
    controller = context.watch<LoginStore>();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addStatusListener((s) {
            if (s == AnimationStatus.completed) print('go to home');
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => HomeModule()));
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color(COLOR_GRAD_BEG),
              Color(COLOR_GRAD_END),
            ])),
        child: ListView(
          //padding: EdgeInsets.all(0),
          children: <Widget>[_corpo()],
        ),
      ),
    );
  }

  _corpo() {
    return Padding(
      padding: const EdgeInsets.only(top: 97),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            LogoWidget(),
            SizedBox(
              height: 102,
            ),
            FormContainer(controller: controller),
            StaggerAnimation(controller: _animationController)
          ],
        ),
      ),
    );
  }

  Widget build2(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: controller.setEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: controller.setPassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Modular.to.pushNamed("/phone");
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Phone Login",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (_) {
                return ElevatedButton(
                  onPressed: controller.isValid ? controller.enterEmail : null,
                  child: Text("ENTER"),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

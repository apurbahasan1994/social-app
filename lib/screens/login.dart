import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/login_background.jpg'),
                height: MediaQuery.of(context).size.height / 2.5,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(
                "Frenzy",
                style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      prefixIcon: Icon(
                        Icons.account_box,
                        size: 30.0,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Username"),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30.0,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password"),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 45.0,
                  child: Text(
                    "login",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 60.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 80.0,
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Dont have an account? Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

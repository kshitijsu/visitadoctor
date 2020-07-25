import 'package:flutter/material.dart';
import 'package:visitadoctor/services/auth.dart';

class Account extends StatefulWidget {
  final Function toggleView;
  Account({this.toggleView});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final AuthService _auth = AuthService();

  // TextField State
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(138, 43, 226, 0.6),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Enter Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Enter Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 300,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () async {
                        dynamic result = await _auth.signInAnon();
                        // make interactive with fire base
                        print(email);
                        print(password);

                        // Sign In Anonymously
                        if (result == null) {
                          print('Error in Sign In');
                        } else {
                          print('Signed In');
                          print(result.uid);
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 20),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 15.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 50,
                                ),
                              ),
                            ),
                            Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 15.0, right: 10.0),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 50,
                                  )),
                            ),
                          ],
                        ),
                        Text(
                          'Create an Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 300,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        widget.toggleView();
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

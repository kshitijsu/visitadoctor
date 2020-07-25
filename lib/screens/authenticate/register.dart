import 'package:flutter/material.dart';
import 'package:visitadoctor/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Auth Service
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //TextField State
  String name = "";
  String mobileno = "";
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(138, 43, 226, 0.6),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (val) => val.isEmpty ? 'Enter Name' : null,
                          onChanged: (val) {
                            setState(() => name = val);
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Enter Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (val) => val.length < 8
                              ? 'Enter a Valid Mobile Number'
                              : null,
                          // obscureText: true,
                          onChanged: (val) {
                            setState(() => mobileno = val);
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Enter Mobile Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
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
                          validator: (val) => val.length < 8
                              ? 'Enter a password with 8 or more characters'
                              : null,
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
                ),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
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
                          if (_formKey.currentState.validate()) {
                            print(name);
                            print(mobileno);
                            print(email);
                            print(password);

                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    name, mobileno, email, password);
                            if (result == null) {
                              setState(
                                  () => error = 'Please Provide a Valid Email');
                            }
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Already have an Account?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1,
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
                          // make interactive with fire base
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:visitadoctor/modals/user.dart';
import 'package:provider/provider.dart';
import 'package:visitadoctor/screens/authenticate/authenticate.dart';
import 'package:visitadoctor/screens/homePage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}

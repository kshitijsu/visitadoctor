import 'package:flutter/material.dart';

class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  String _name, _age, _city, _symptoms;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _builderName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _builderAge() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Age is Required';
        }
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  Widget _builderCity() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'City'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'City is Required';
        }
      },
      onSaved: (String value) {
        _city = value;
      },
    );
  }

  Widget _builderSymptoms() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Symptoms'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Symptoms is Required';
        }
      },
      onSaved: (String value) {
        _symptoms = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book An Appointment')),
      body: Container(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  _builderName(),
                  _builderAge(),
                  _builderCity(),
                  _builderSymptoms(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          print(_name);
                          print(_age);
                          print(_city);
                          print(_symptoms);
                        },
                        child:
                            Text('Book', style: TextStyle(color: Colors.white)),
                        color: Colors.green,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel',
                            style: TextStyle(color: Colors.white)),
                        color: Colors.green,
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

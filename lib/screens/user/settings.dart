import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringl8/components/input_text_field.dart';
import 'package:ringl8/components/loading.dart';
import 'package:ringl8/components/validators.dart';
import 'package:ringl8/models/user.dart';
import 'package:ringl8/services/user.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  String _currentFirstName;
  String _currentLastName;

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<User>(context);
    return StreamBuilder<User>(
      stream: UserService(uid: currentUser.uid).user,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Loading();
        User _currentUser = snapshot.data;
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'Update your user settings:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              InputTextField(
                icon: Icons.person,
                initialValue: _currentUser.firstName,
                labelText: 'First Name',
                onChanged: (value) => setState(() => _currentFirstName = value),
                validator: (value) => Validators.validateString(value, 'first name'),
              ),
              SizedBox(height: 10.0),
              InputTextField(
                icon: Icons.person,
                initialValue: _currentUser.lastName,
                labelText: 'Last Name',
                onChanged: (value) => setState(() => _currentLastName = value),
                validator: (value) => Validators.validateString(value, 'last name'),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await UserService(uid: currentUser.uid).updateUser(User.clone(
                      _currentUser,
                      firstName: _currentFirstName,
                      lastName: _currentLastName,
                    ));
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

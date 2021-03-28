import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarth_app/src/api/AccountApi.dart';
import 'package:smarth_app/src/api/RegistratoinApi.dart';

import '../Widget/bezierContainer.dart';
import '../menu.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final RegistrationService registrationService = RegistrationService();
  final AccountService accountService = AccountService();
  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final emailFieldController = TextEditingController();
  final fistNameFieldController = TextEditingController();
  final lastNameFieldController = TextEditingController();
  final usernameFieldController = TextEditingController();
  final isManFieldController = TextEditingController();
  final weightFieldController = TextEditingController();
  final heightFieldController = TextEditingController();
  final hipFieldController = TextEditingController();
  final waistFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  final sexFieldController = TextEditingController();
  final birthdayFieldController = TextEditingController();
  final bloodFieldController = TextEditingController();

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  void _handleRegistration() async {
    String password = passwordFieldController.text;
    String email = emailFieldController.text;
    String username = usernameFieldController.text;
    String sex = sexFieldController.text;
    String birthday = birthdayFieldController.text;
    String bloodGroup = bloodFieldController.text;
    bool isMan = isManFieldController.text.toUpperCase() == ("MALE");
    String weight = weightFieldController.text ;
    String height = heightFieldController.text ;
    String hip = hipFieldController.text ;
    String waist = waistFieldController.text ;
    String firstName = fistNameFieldController.text;
    String lastName = lastNameFieldController.text;
    bool success = await widget.registrationService.processRegistrationRequest(
        context,
        username,
        password,
        firstName,
        lastName,
        isMan,
        birthday,
        weight,
        height,
        email,
        bloodGroup,
        hip,
        waist);
    if (success) {
      bool login = await widget.accountService
          .processLoginRequest(context, username, password);

      if (login) {
        //go to menu
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MenuPage()));
      } else {
        final snackBar = SnackBar(
          content: Text('Login failed!'),
          action: SnackBarAction(
            label: 'Hide',
            onPressed: () {},
          ),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
      final snackBar = SnackBar(
        content: Text('Registration failed!'),
        action: SnackBarAction(
          label: 'Hide',
          onPressed: () {},
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    emailFieldController.dispose();
    fistNameFieldController.dispose();
    lastNameFieldController.dispose();
    usernameFieldController.dispose();
    isManFieldController.dispose();
    weightFieldController.dispose();
    heightFieldController.dispose();
    hipFieldController.dispose();
    waistFieldController.dispose();
    passwordFieldController.dispose();
    sexFieldController.dispose();
    birthdayFieldController.dispose();
    bloodFieldController.dispose();
    super.dispose();
  }

  Widget _entryField(String title, var fieldController,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              controller: fieldController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryNumberField(String title, var fieldController,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: fieldController,
            decoration: new InputDecoration(
                labelText: "Enter your " + title,
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
        onTap: () {
          _handleRegistration();
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 16.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15,
                        spreadRadius: 0,
                        offset: Offset(0.0, 32.0)),
                  ],
                  borderRadius: new BorderRadius.circular(36.0),
                  gradient: LinearGradient(begin: FractionalOffset.centerLeft,
// Add one stop for each color. Stops should increase from 0 to 1
                      stops: [
                        0.2,
                        1
                      ], colors: [
                    Color(0xff616161),
                    Color(0xff434343),
                  ])),
              child: Text(
                'REGISTER',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            )));
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Image.asset('assets/logo.png');
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username", usernameFieldController),
        _entryField("Email", emailFieldController),
        _entryField("First Name", fistNameFieldController),
        _entryField("Last Name", lastNameFieldController),
        _entryNumberField("Weight", weightFieldController),
        _entryNumberField("Height", heightFieldController),
        _entryNumberField("Hip", hipFieldController),
        _entryNumberField("Waist", waistFieldController),
        _entryField("Sex", sexFieldController),
        _entryField("BirthDate (yyyy-mm-dd)", birthdayFieldController),
        _entryField("Blood Type", bloodFieldController),
        _entryField("Password", passwordFieldController, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarth_app/src/process.dart';
import 'package:smarth_app/src/recommendations/recommendation.dart';
import 'package:smarth_app/src/summary.dart';
import 'package:url_launcher/url_launcher.dart';

import 'file:///F:/4%20course%202%20semestr/titenko/smarth/smarth_app/lib/src/insert.dart';

import 'basic/welcome.dart';
import 'default/error.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Widget _insertData() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InsertPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
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
                Color(0xffffffff),
                Color(0xff9ee0ff).withAlpha(100),
              ])),
          child: Text(
            'INSERT DATA',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff616161),
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
    );
  }

  Widget _processData() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProcessPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
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
                Color(0xffffffff),
                Color(0xff9ee0ff).withAlpha(100),
              ])),
          child: Text(
            'PROCESS DATA',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff616161),
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
    );
  }

  Widget _getSummary() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SummaryPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
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
                Color(0xffffffff),
                Color(0xff9ee0ff).withAlpha(100),
              ])),
          child: Text(
            'SUMMARIZE DATA',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff616161),
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
    );
  }

  Widget _getError() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
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
                Color(0xffffffff),
                Color(0xff9ee0ff).withAlpha(100),
              ])),
          child: Text(
            'ERROR PAGE',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff616161),
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
    );
  }

  Widget _getRecommendations() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RecommendationRage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
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
                Color(0xffffffff),
                Color(0xff9ee0ff).withAlpha(100),
              ])),
          child: Text(
            'RECOMMENDATIONS',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff616161),
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
    );
  }

  Widget _doctorAppointment() {
    return InkWell(
      onTap: () {
        _launchURL();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
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
                Color(0xffffffff),
                Color(0xff9ee0ff).withAlpha(100),
              ])),
          child: Text(
            'DOCTOR APPOINTMENT',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff616161),
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Image.asset('assets/logo.png',
        width: 100, height: 100, fit: BoxFit.fill);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey.shade200, Color(0xff51c8fa)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.logout, color: Color(0xff7e7e7e)),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      CupertinoPageRoute(builder: (context) => WelcomePage()),
                      (_) => false,
                    );
                  }),
              _title(),
              SizedBox(
                height: 80,
              ),
              _insertData(),
              SizedBox(
                height: 20,
              ),
              _processData(),
              SizedBox(
                height: 20,
              ),
              _getSummary(),
              SizedBox(
                height: 20,
              ),
              _getRecommendations(),
              SizedBox(
                height: 20,
              ),
              _doctorAppointment(),
              SizedBox(
                height: 20,
              ),
              _getError(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://helsi.me/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

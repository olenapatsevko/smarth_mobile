import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  SummaryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  Widget _summary() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
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
          child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
        ),
      ),
    );
  }

  Widget _title() {
    return Image.asset('assets/logo.png');
  }

  Widget _successText(String email) {
    return Container(
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
              Color(0xffffffff).withAlpha(100),
            ])),
        child: Text(
          "Your summary was sent to your email " + email,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff616161),
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
      ),
    );
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
              _title(),
              SizedBox(
                height: 80,
              ),
              _successText("email"),
              SizedBox(
                height: 80,
              ),
              _summary(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

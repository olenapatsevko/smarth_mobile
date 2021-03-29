import 'package:flutter/material.dart';
import 'package:smarth_app/src/api/ProcessApi.dart';
import 'package:smarth_app/src/dto/bmiresponse.dart';

class ProcessPage extends StatefulWidget {
  ProcessPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProcessPageState createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ProcessionService processionService = ProcessionService();

  Widget _summary() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xff51c8fa).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
      ),
    );
  }

  Widget _title() {
    return Image.asset('assets/logo.png');
  }

  Widget _back() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: FutureBuilder(
            future: processionService.processProcessionRequest(context),
            builder:
                (BuildContext context, AsyncSnapshot<BMIResponse> snapshot) {
              if (snapshot.hasData) {
                BMIResponse response = snapshot.data;
                return SingleChildScrollView(
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
                        ListTile(
                            title: Text("Ideal weight"),
                            isThreeLine: true,
                            subtitle: Text('For your gender and age \n '),
                            leading: Icon(Icons.healing_rounded),
                            trailing: Text(response.ideal_weight)),
                        ListTile(
                            title: Text('Ponderal index'),
                            isThreeLine: true,
                            subtitle: Text('For your gender and age \n '),
                            leading: Icon(Icons.healing_rounded),
                            trailing: Text(response.ponderal_index)),
                        ListTile(
                            title: Text("Risk of hear attack"),
                            isThreeLine: true,
                            subtitle: Text(response.bmi.risk),
                            leading: Icon(Icons.healing_rounded),
                            trailing: Text(response.bmi.value)),
                        _back(),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}

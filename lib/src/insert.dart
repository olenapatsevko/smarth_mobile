import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_places_picker/google_places_picker.dart';
import 'package:intl/intl.dart';
import 'package:smarth_app/src/const/gradient_const.dart';

class InsertPage extends StatefulWidget {
  @override
  _InsertPageState createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  String _currentDate = DateFormat('M/d/y').format(DateTime.now());
  List<String> _countries = ["Germany", "Turkey", "Spain"];
  List<String> _states = ["Hessen", "Istanbul", "Barcelona"];
  String _currentCountry = "Germany";
  String _currentState = "Hessen";
  Place _place;
  int widgetIndex = 0;
  PageController _pageController;
  bool _isSelected = true;

  _selectType(bool isSelected) {
    setState(() {
      _isSelected = isSelected;
    });
  }

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  void changeDropDownCountryItem(String selectedCountry) {
    setState(() {
      _currentCountry = selectedCountry;
    });
  }

  void changeDropDownStateItem(String selectedState) {
    setState(() {
      _currentState = selectedState;
    });
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2050));
    if (picked != null)
      setState(
        () => _currentDate = DateFormat('M/d/y').format(picked),
      );
  }

  Future _selectPlace(BuildContext context) async {
    try {
      Place _picker = await PluginGooglePlacePicker.showAutocomplete();
      setState(() {
        _place = _picker;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    List<Widget> widgets = [
      buildLoginArea(context),
      buildLoginArea2(context),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: MediaQuery.of(context).padding,
          height: _media.height,
          width: _media.width,
          decoration: BoxDecoration(
            gradient: SIGNUP_BACKGROUND,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Container(child: buildBackButton()))),
                  Container(
                    height: _media.height,
                    width: _media.width / 2,
                    decoration: BoxDecoration(
                      gradient: !_isSelected
                          ? LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.05),
                                Colors.transparent,
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              stops: [0.2, 0.8])
                          : null,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Opacity(
                        opacity: _isSelected ? 1 : 0.5,
                        child: Text(
                          "Enter data",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: 110,
                      left: 50,
                      right: 50,
                      bottom: 60,
                    ),
                    height: _media.height,
                    width: _media.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: SIGNUP_CARD_BACKGROUND,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 30,
                          spreadRadius: 0,
                          offset: Offset(
                            0,
                            10,
                          ),
                        )
                      ],
                    ),
                    child: PageView.builder(
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return widgets[index];
                      },
                      physics: BouncingScrollPhysics(),
                      itemCount: widgets.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  widthFactor: 20,
                  heightFactor: 20,
                  child: Container(child: buildNextButton())),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildLoginArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25,
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          formTextField("DATE OF BIRTH"),
          buildDivider(),
          buildDropdown("COUNTRY", _countries, _currentCountry,
              changeDropDownCountryItem),
          buildDivider(),
          buildDropdown(
              "STATE", _states, _currentState, changeDropDownStateItem),
          buildDivider(),
          buildCity("CITY", context),
          buildDivider(),
          buildStreet("STREET", context),
          buildDivider(),
        ],
      ),
    );
  }

  Padding buildLoginArea2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25,
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          formTextField("HEALTH"),
          buildDivider(),
          buildDropdown("HEMOGLOBIN", _countries, _currentCountry,
              changeDropDownCountryItem),
          buildDivider(),
          buildDropdown(
              "BLOOD", _states, _currentState, changeDropDownStateItem),
          buildDivider(),
          buildCity("LOOK", context),
          buildDivider(),
          buildStreet("WATER", context),
          buildDivider(),
        ],
      ),
    );
  }

  Widget buildStreet(String text, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black26,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 20),
          child: InkWell(
            onTap: () => _selectPlace(context),
            child: Text(
              _place != null ? _place.name : 'Ostendstr. 27',
              style: TextStyle(
                  letterSpacing: 2.0,
                  color: Color(0xff353535),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
              overflow: TextOverflow.fade,
            ),
          ),
        )
      ],
    );
  }

  Widget buildCity(String text, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black26,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 20),
          child: InkWell(
            onTap: () => _selectPlace(context),
            child: Text(
              _place != null ? _place.name : 'Frankfurt am Main',
              style: TextStyle(
                  letterSpacing: 2.0,
                  color: Color(0xff353535),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
              overflow: TextOverflow.fade,
            ),
          ),
        )
      ],
    );
  }

  Widget formTextField(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black26,
          ),
        ),
        TextField(
          keyboardType: TextInputType.datetime,
          onTap: _selectDate,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: _currentDate,
            hintStyle: TextStyle(
              letterSpacing: 2.0,
              color: Color(0xff353535),
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding buildNextButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: InkWell(
        onTap: () {},
        child: Container(
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
            'SUBMIT',
            style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
    );
  }

  Padding buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0.0, 3.0)),
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
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  Column buildDropdown(
      String text, List dropDownList, String current, Function change) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black26,
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            style: TextStyle(
              letterSpacing: 2.0,
              color: Color(0xff353535),
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
            isExpanded: true,
            onChanged: change,
            items: dropDownList.map((items) {
              return DropdownMenuItem<String>(
                value: items,
                child: Text(
                  items,
                  style: TextStyle(
                    letterSpacing: 1.1,
                  ),
                ),
              );
            }).toList(),
            value: current,
          ),
        ),
      ],
    );
  }

  Container buildDivider() {
    return Container(
      margin: EdgeInsets.only(top: 0, right: 8, bottom: 15),
      padding: EdgeInsets.only(
        right: 5,
      ),
      color: Colors.black,
      height: 1.2,
    );
  }
}

class BMIResponse {
  Weight weight;
  Height height;
  Bmi bmi;
  String ideal_weight;
  String surface_area;
  String ponderal_index;
  Bmr bmr;
  Whr whr;
  Whtr whtr;
}

class Bmi {
  String value;
  String status;
  String risk;
  String prime;
}

class Bmr {
  String value;
}

class Height {
  String m;
  String cm;
  String In;

  // @JsonProperty("ft-in")
  String ftIn;
}

class Root {
  Weight weight;
  Height height;
  Bmi bmi;
  String ideal_weight;
  String surface_area;
  String ponderal_index;
  Bmr bmr;
  Whr whr;
  Whtr whtr;
}

class Weight {
  String kg;
  String lb;
}

class Whr {
  String value;
  String status;
}

class Whtr {
  String value;
  String status;
}

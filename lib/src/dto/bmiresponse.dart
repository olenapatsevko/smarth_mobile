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

  BMIResponse(
      {this.weight,
      this.height,
      this.bmi,
      this.ideal_weight,
      this.surface_area,
      this.ponderal_index,
      this.bmr,
      this.whr,
      this.whtr});

  factory BMIResponse.fromJson(Map<String, dynamic> json) {
    return BMIResponse(
        weight: Weight.fromJson(json['weight']),
        height: Height.fromJson(json['height']),
        bmi: json['surface_area'],
        ideal_weight: json["ideal_weight"],
        surface_area: json["surface_area"],
        ponderal_index: json["ponderal_index"],
        bmr: Bmr.fromJson(json["bmr"]),
        whr: Whr.fromJson(json["whr"]),
        whtr: Whtr.fromJson(json["whtr"]));
  }
}

class Bmi {
  String value;
  String status;
  String risk;
  String prime;

  Bmi({this.value, this.status, this.risk, this.prime});

  factory Bmi.fromJson(Map<String, dynamic> json) {
    return Bmi(
      value: json["value"],
      status: json["status"],
      risk: json["risk"],
      prime: json["prime"],
    );
  }
}

class Bmr {
  String value;

  Bmr({this.value});

  factory Bmr.fromJson(Map<String, dynamic> json) {
    return Bmr(
      value: json["value"],
    );
  }
}

class Height {
  String m;
  String cm;
  String In;

  // @JsonProperty("ft-in")
  String ftIn;

  Height({this.m, this.cm, this.In, this.ftIn});

  factory Height.fromJson(Map<String, dynamic> json) {
    return Height(
      m: json["m"],
      cm: json["cm"],
      In: json["In"],
      ftIn: json["ft-in"],
    );
  }
}

class Weight {
  String kg;
  String lb;

  Weight({this.kg, this.lb});

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      kg: json["kg"],
      lb: json["lb"],
    );
  }
}

class Whr {
  String value;
  String status;

  Whr({this.value, this.status});

  factory Whr.fromJson(Map<String, dynamic> json) {
    return Whr(
      value: json["value"],
      status: json["status"],
    );
  }
}

class Whtr {
  String value;
  String status;

  Whtr({this.value, this.status});

  factory Whtr.fromJson(Map<String, dynamic> json) {
    return Whtr(
      value: json["value"],
      status: json["status"],
    );
  }
}

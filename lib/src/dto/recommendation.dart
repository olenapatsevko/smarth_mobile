class Recommendation {
  Recommendation({
    this.step,
    this.title,
    this.message,
  });

  int step;
  String title;
  String message;

  factory Recommendation.fromJson(Map<String, dynamic> parsedJson) {
    return Recommendation(
      step: parsedJson['step'],
      title: parsedJson['title'],
      message: parsedJson['message'],
    );
  }
}

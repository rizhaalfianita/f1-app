class F1Upcoming {
  String? date;
  String? image;
  String? title;

  F1Upcoming({this.date, this.image, this.title});

  F1Upcoming.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['image'] = image;
    data['title'] = title;
    return data;
  }
}

class F1AllSeason {
  String? link;
  String? year;

  F1AllSeason({this.link, this.year});

  F1AllSeason.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['year'] = year;
    return data;
  }
}

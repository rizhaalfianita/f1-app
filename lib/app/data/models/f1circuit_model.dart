class Circuit {
  String? country;
  String? image;
  String? lang;
  String? lapRecord;
  String? lapRecordDriver;
  String? lat;
  String? length;
  String? name;

  Circuit(
      {this.country,
      this.image,
      this.lang,
      this.lapRecord,
      this.lapRecordDriver,
      this.lat,
      this.length,
      this.name});

  Circuit.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    image = json['image'];
    lang = json['lang'];
    lapRecord = json['lap_record'];
    lapRecordDriver = json['lap_record_driver'];
    lat = json['lat'];
    length = json['length'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['country'] = country;
    data['image'] = image;
    data['lang'] = lang;
    data['lap_record'] = lapRecord;
    data['lap_record_driver'] = lapRecordDriver;
    data['lat'] = lat;
    data['length'] = length;
    data['name'] = name;
    return data;
  }
}

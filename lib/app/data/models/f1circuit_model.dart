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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['image'] = this.image;
    data['lang'] = this.lang;
    data['lap_record'] = this.lapRecord;
    data['lap_record_driver'] = this.lapRecordDriver;
    data['lat'] = this.lat;
    data['length'] = this.length;
    data['name'] = this.name;
    return data;
  }
}

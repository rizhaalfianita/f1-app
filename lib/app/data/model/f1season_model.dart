class F1Season {
  String? country;
  Race? race;

  F1Season({this.country, this.race});

  F1Season.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    race = json['race'] != null ? Race.fromJson(json['race']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    if (race != null) {
      data['race'] = race!.toJson();
    }
    return data;
  }
}

class Race {
  String? circuit;
  String? date;
  List<RaceResult>? raceResult;

  Race({this.circuit, this.date, this.raceResult});

  Race.fromJson(Map<String, dynamic> json) {
    circuit = json['circuit'];
    date = json['date'];
    if (json['race_result'] != null) {
      raceResult = <RaceResult>[];
      json['race_result'].forEach((v) {
        raceResult!.add(RaceResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['circuit'] = circuit;
    data['date'] = date;
    if (raceResult != null) {
      data['race_result'] = raceResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RaceResult {
  String? car;
  String? driver;
  String? laps;
  String? no;
  String? pTS;
  String? pos;
  String? timeRetired;

  RaceResult(
      {this.car,
      this.driver,
      this.laps,
      this.no,
      this.pTS,
      this.pos,
      this.timeRetired});

  RaceResult.fromJson(Map<String, dynamic> json) {
    car = json['Car'];
    driver = json['Driver'];
    laps = json['Laps'];
    no = json['No'];
    pTS = json['PTS'];
    pos = json['Pos'];
    timeRetired = json['Time/Retired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Car'] = car;
    data['Driver'] = driver;
    data['Laps'] = laps;
    data['No'] = no;
    data['PTS'] = pTS;
    data['Pos'] = pos;
    data['Time/Retired'] = timeRetired;
    return data;
  }
}

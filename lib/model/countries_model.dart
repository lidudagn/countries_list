import 'dart:convert';

List<CountriesModel> countriesModelFromJson(String str) =>
    List<CountriesModel>.from(
        json.decode(str).map((x) => CountriesModel.fromJson(x)));

String countriesModelToJson(List<CountriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesModel {
  final Name? name;
  final Region? region;
  final Flags? flag;

  CountriesModel({
    this.name,
    this.region,
    this.flag,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        region:json["region"]==null?null: regionValues.map[json["region"]],
        flag:json["flags"]==null?null: Flags.fromJson(json["flags"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "region": regionValues.reverse[region],
        "flag": flag,
      };
}

class Flags {
    final String? png;
    final String? svg;

    Flags({
        this.png,
        this.svg,
    });

    factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
    );

    Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
    };
}


class Translation {
  final String? official;
  final String? common;

  Translation({
    this.official,
    this.common,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class Name {
    final String? common;
    final String? official;

    Name({
        this.common,
        this.official,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
     );

    Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
    };
}

// ignore: constant_identifier_names
enum Region { AFRICA, AMERICAS, ANTARCTIC, ASIA, EUROPE, OCEANIA }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA
});

// ignore: constant_identifier_names
enum StartOfWeek { MONDAY, SATURDAY, SUNDAY }

final startOfWeekValues = EnumValues({
  "monday": StartOfWeek.MONDAY,
  "saturday": StartOfWeek.SATURDAY,
  "sunday": StartOfWeek.SUNDAY
});

// ignore: constant_identifier_names
enum Status { OFFICIALLY_ASSIGNED, USER_ASSIGNED }

final statusValues = EnumValues({
  "officially-assigned": Status.OFFICIALLY_ASSIGNED,
  "user-assigned": Status.USER_ASSIGNED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

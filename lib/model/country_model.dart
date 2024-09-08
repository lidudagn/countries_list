import 'dart:convert';

List<CountryModel> countyModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countyModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  final Name? name;
  final Currencies? currencies;
  final String? region;
  final String? subregion;
  final Map<String, dynamic>? languages;
  final Map<String, Translation>? translations;
  final List<String>? borders;
  final int? population;
  final Flags? flags;
  final List<String>? capital;

  CountryModel({
    this.name,
    this.currencies,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.borders,
    this.population,
    this.flags,
    this.capital,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        currencies: json["currencies"] == null
            ? null
            : Currencies.fromJson(json["currencies"]),
        region: json["region"],
        subregion: json["subregion"],
        languages: json["languages"],
        translations: Map.from(json["translations"]!).map((k, v) =>
            MapEntry<String, Translation>(k, Translation.fromJson(v))),
        borders: json["borders"] == null
            ? []
            : List<String>.from(json["borders"]!.map((x) => x)),
        population: json["population"],
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        capital: json["capital"] == null
            ? null
            : List<String>.from(json["capital"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "currencies": currencies?.toJson(),
        "region": region,
        "subregion": subregion,
        "languages": languages,
        "translations": Map.from(translations!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "borders":
            borders == null ? [] : List<dynamic>.from(borders!.map((x) => x)),
        "population": population,
        "flags": flags?.toJson(),
        "capital":
            capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
      };
}

class CapitalInfo {
  final List<double>? latlng;

  CapitalInfo({
    this.latlng,
  });

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null
            ? []
            : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "latlng":
            latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
      };
}

class Car {
  final List<String>? signs;
  final String? side;

  Car({
    this.signs,
    this.side,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null
            ? []
            : List<String>.from(json["signs"]!.map((x) => x)),
        side: json["side"],
      );

  Map<String, dynamic> toJson() => {
        "signs": signs == null ? [] : List<dynamic>.from(signs!.map((x) => x)),
        "side": side,
      };
}

class CoatOfArms {
  final String? png;
  final String? svg;

  CoatOfArms({
    this.png,
    this.svg,
  });

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

class Currencies {
  final Chf? chf;

  Currencies({
    this.chf,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        chf: json["CHF"] == null ? null : Chf.fromJson(json["CHF"]),
      );

  Map<String, dynamic> toJson() => {
        "CHF": chf?.toJson(),
      };
}

class Chf {
  final String? name;
  final String? symbol;

  Chf({
    this.name,
    this.symbol,
  });

  factory Chf.fromJson(Map<String, dynamic> json) => Chf(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Demonyms {
  final Eng? eng;
  final Eng? fra;

  Demonyms({
    this.eng,
    this.fra,
  });

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: json["eng"] == null ? null : Eng.fromJson(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng?.toJson(),
        "fra": fra?.toJson(),
      };
}

class Eng {
  final String? f;
  final String? m;

  Eng({
    this.f,
    this.m,
  });

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Flags {
  final String? png;
  final String? svg;
  final String? alt;

  Flags({
    this.png,
    this.svg,
    this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class Gini {
  final double? the2018;

  Gini({
    this.the2018,
  });

  factory Gini.fromJson(Map<String, dynamic> json) => Gini(
        the2018: json["2018"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "2018": the2018,
      };
}

class Idd {
  final String? root;
  final List<String>? suffixes;

  Idd({
    this.root,
    this.suffixes,
  });

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] == null
            ? []
            : List<String>.from(json["suffixes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes":
            suffixes == null ? [] : List<dynamic>.from(suffixes!.map((x) => x)),
      };
}

class Maps {
  final String? googleMaps;
  final String? openStreetMaps;

  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  final String? common;
  final String? official;
  final NativeName? nativeName;

  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: json["nativeName"] == null
            ? null
            : NativeName.fromJson(json["nativeName"]),
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName?.toJson(),
      };
}

class NativeName {
  final Translation? fra;
  final Translation? gsw;
  final Translation? ita;
  final Translation? roh;

  NativeName({
    this.fra,
    this.gsw,
    this.ita,
    this.roh,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        fra: json["fra"] == null ? null : Translation.fromJson(json["fra"]),
        gsw: json["gsw"] == null ? null : Translation.fromJson(json["gsw"]),
        ita: json["ita"] == null ? null : Translation.fromJson(json["ita"]),
        roh: json["roh"] == null ? null : Translation.fromJson(json["roh"]),
      );

  Map<String, dynamic> toJson() => {
        "fra": fra?.toJson(),
        "gsw": gsw?.toJson(),
        "ita": ita?.toJson(),
        "roh": roh?.toJson(),
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

class PostalCode {
  final String? format;
  final String? regex;

  PostalCode({
    this.format,
    this.regex,
  });

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}

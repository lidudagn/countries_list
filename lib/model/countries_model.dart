import 'dart:convert';

List<CountriesModel> countriesModelFromJson(String str) => List<CountriesModel>.from(json.decode(str).map((x) => CountriesModel.fromJson(x)));

String countriesModelToJson(List<CountriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesModel {
    final Name? name;
    final List<String>? tld;
    final String? cca2;
    final String? ccn3;
    final String? cca3;
    final bool? independent;
    final Status? status;
    final bool? unMember;
    final Map<String, Currency>? currencies;
    final Idd? idd;
    final List<String>? capital;
    final List<String>? altSpellings;
    final Region? region;
    final Map<String, String>? languages;
    final Map<String, Translation>? translations;
    final List<double>? latlng;
    final bool? landlocked;
    final double? area;
    final Demonyms? demonyms;
    final String? flag;
    final Maps? maps;
    final int? population;
    final Car? car;
    final List<String>? timezones;
    final List<Continent>? continents;
    final Flags? flags;
    final CoatOfArms? coatOfArms;
    final StartOfWeek? startOfWeek;
    final CapitalInfo? capitalInfo;
    final String? cioc;
    final String? subregion;
    final String? fifa;
    final List<String>? borders;
    final Map<String, double>? gini;
    final PostalCode? postalCode;

    CountriesModel({
        this.name,
        this.tld,
        this.cca2,
        this.ccn3,
        this.cca3,
        this.independent,
        this.status,
        this.unMember,
        this.currencies,
        this.idd,
        this.capital,
        this.altSpellings,
        this.region,
        this.languages,
        this.translations,
        this.latlng,
        this.landlocked,
        this.area,
        this.demonyms,
        this.flag,
        this.maps,
        this.population,
        this.car,
        this.timezones,
        this.continents,
        this.flags,
        this.coatOfArms,
        this.startOfWeek,
        this.capitalInfo,
        this.cioc,
        this.subregion,
        this.fifa,
        this.borders,
        this.gini,
        this.postalCode,
    });

    factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        tld: json["tld"] == null ? [] : List<String>.from(json["tld"]!.map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        independent: json["independent"],
        status: statusValues.map[json["status"]]!,
        unMember: json["unMember"],
        currencies: Map.from(json["currencies"]!).map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
        idd: json["idd"] == null ? null : Idd.fromJson(json["idd"]),
        capital: json["capital"] == null ? [] : List<String>.from(json["capital"]!.map((x) => x)),
        altSpellings: json["altSpellings"] == null ? [] : List<String>.from(json["altSpellings"]!.map((x) => x)),
        region: regionValues.map[json["region"]]!,
        languages: Map.from(json["languages"]!).map((k, v) => MapEntry<String, String>(k, v)),
        translations: Map.from(json["translations"]!).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: json["latlng"] == null ? [] : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
        landlocked: json["landlocked"],
        area: json["area"]?.toDouble(),
        demonyms: json["demonyms"] == null ? null : Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: json["maps"] == null ? null : Maps.fromJson(json["maps"]),
        population: json["population"],
        car: json["car"] == null ? null : Car.fromJson(json["car"]),
        timezones: json["timezones"] == null ? [] : List<String>.from(json["timezones"]!.map((x) => x)),
        continents: json["continents"] == null ? [] : List<Continent>.from(json["continents"]!.map((x) => continentValues.map[x]!)),
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        coatOfArms: json["coatOfArms"] == null ? null : CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: startOfWeekValues.map[json["startOfWeek"]]!,
        capitalInfo: json["capitalInfo"] == null ? null : CapitalInfo.fromJson(json["capitalInfo"]),
        cioc: json["cioc"],
        subregion: json["subregion"],
        fifa: json["fifa"],
        borders: json["borders"] == null ? [] : List<String>.from(json["borders"]!.map((x) => x)),
        gini: Map.from(json["gini"]!).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        postalCode: json["postalCode"] == null ? null : PostalCode.fromJson(json["postalCode"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "tld": tld == null ? [] : List<dynamic>.from(tld!.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "independent": independent,
        "status": statusValues.reverse[status],
        "unMember": unMember,
        "currencies": Map.from(currencies!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "idd": idd?.toJson(),
        "capital": capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        "altSpellings": altSpellings == null ? [] : List<dynamic>.from(altSpellings!.map((x) => x)),
        "region": regionValues.reverse[region],
        "languages": Map.from(languages!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "translations": Map.from(translations!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "latlng": latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
        "landlocked": landlocked,
        "area": area,
        "demonyms": demonyms?.toJson(),
        "flag": flag,
        "maps": maps?.toJson(),
        "population": population,
        "car": car?.toJson(),
        "timezones": timezones == null ? [] : List<dynamic>.from(timezones!.map((x) => x)),
        "continents": continents == null ? [] : List<dynamic>.from(continents!.map((x) => continentValues.reverse[x])),
        "flags": flags?.toJson(),
        "coatOfArms": coatOfArms?.toJson(),
        "startOfWeek": startOfWeekValues.reverse[startOfWeek],
        "capitalInfo": capitalInfo?.toJson(),
        "cioc": cioc,
        "subregion": subregion,
        "fifa": fifa,
        "borders": borders == null ? [] : List<dynamic>.from(borders!.map((x) => x)),
        "gini": Map.from(gini!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "postalCode": postalCode?.toJson(),
    };
}

class CapitalInfo {
    final List<double>? latlng;

    CapitalInfo({
        this.latlng,
    });

    factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null ? [] : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "latlng": latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
    };
}

class Car {
    final List<String>? signs;
    final Side? side;

    Car({
        this.signs,
        this.side,
    });

    factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null ? [] : List<String>.from(json["signs"]!.map((x) => x)),
        side: sideValues.map[json["side"]]!,
    );

    Map<String, dynamic> toJson() => {
        "signs": signs == null ? [] : List<dynamic>.from(signs!.map((x) => x)),
        "side": sideValues.reverse[side],
    };
}

enum Side {
    LEFT,
    RIGHT
}

final sideValues = EnumValues({
    "left": Side.LEFT,
    "right": Side.RIGHT
});

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

enum Continent {
    AFRICA,
    ANTARCTICA,
    ASIA,
    EUROPE,
    NORTH_AMERICA,
    OCEANIA,
    SOUTH_AMERICA
}

final continentValues = EnumValues({
    "Africa": Continent.AFRICA,
    "Antarctica": Continent.ANTARCTICA,
    "Asia": Continent.ASIA,
    "Europe": Continent.EUROPE,
    "North America": Continent.NORTH_AMERICA,
    "Oceania": Continent.OCEANIA,
    "South America": Continent.SOUTH_AMERICA
});

class Currency {
    final String? name;
    final String? symbol;

    Currency({
        this.name,
        this.symbol,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
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

class Idd {
    final String? root;
    final List<String>? suffixes;

    Idd({
        this.root,
        this.suffixes,
    });

    factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] == null ? [] : List<String>.from(json["suffixes"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": suffixes == null ? [] : List<dynamic>.from(suffixes!.map((x) => x)),
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
    final Map<String, Translation>? nativeName;

    Name({
        this.common,
        this.official,
        this.nativeName,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: Map.from(json["nativeName"]!).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
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

enum Region {
    AFRICA,
    AMERICAS,
    ANTARCTIC,
    ASIA,
    EUROPE,
    OCEANIA
}

final regionValues = EnumValues({
    "Africa": Region.AFRICA,
    "Americas": Region.AMERICAS,
    "Antarctic": Region.ANTARCTIC,
    "Asia": Region.ASIA,
    "Europe": Region.EUROPE,
    "Oceania": Region.OCEANIA
});

enum StartOfWeek {
    MONDAY,
    SATURDAY,
    SUNDAY
}

final startOfWeekValues = EnumValues({
    "monday": StartOfWeek.MONDAY,
    "saturday": StartOfWeek.SATURDAY,
    "sunday": StartOfWeek.SUNDAY
});

enum Status {
    OFFICIALLY_ASSIGNED,
    USER_ASSIGNED
}

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

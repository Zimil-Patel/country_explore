class CountryModel {
  final Name name;
  final bool independent, unMember, landlocked;
  final String status, region, startOfWeek;
  final List<dynamic> altSpellings;
  final List<dynamic> capital;
  final List<dynamic> latlng;
  final double area;
  final int population;
  final List<dynamic> timezones, continents;
  final Flags flag;

  CountryModel({
    required this.name,
    required this.independent,
    required this.unMember,
    required this.status,
    required this.altSpellings,
    required this.region,
    required this.latlng,
    required this.landlocked,
    required this.area,
    required this.population,
    required this.timezones,
    required this.continents,
    required this.flag,
    required this.startOfWeek,
    required this.capital,
  });

  factory CountryModel.fromJson(Map map) => CountryModel(
        name: Name.fronJson(map['name']),
        independent: map['independent'] ?? false,
        unMember: map['unMember'] ?? false,
        status: map['status'],
        capital: map['capital'] ?? [],
        altSpellings: map['altSpellings'],
        region: map['region'],
        latlng: map['latlng'],
        landlocked: map['landlocked'] ?? false,
        area: map['area'].toDouble() ?? 0.0,
        population: map['population'],
        timezones: map['timezones'],
        continents: map['continents'],
        flag: Flags.fromJson(map['flags']),
        startOfWeek: map['startOfWeek'],
      );
}

class Name {
  final String common, official;

  Name({
    required this.common,
    required this.official,
  });

  factory Name.fronJson(Map map) => Name(
        common: map['common'],
        official: map['official'],
      );
}

class Flags {
  final String png;

  Flags({
    required this.png,
  });

  factory Flags.fromJson(Map map) => Flags(png: map['png'] ?? "");
}

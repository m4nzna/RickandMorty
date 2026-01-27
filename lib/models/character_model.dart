

import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Info info;
  List<Result> results;

  Character({
    required this.info,
    required this.results,
  });

  Character copyWith({
    Info? info,
    List<Result>? results,
  }) =>
      Character(
        info: info ?? this.info,
        results: results ?? this.results,
      );

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    info: Info.fromJson(json["info"]),
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Info {
  int count;
  int pages;
  String next;
  dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  Info copyWith({
    int? count,
    int? pages,
    String? next,
    dynamic prev,
  }) =>
      Info(
        count: count ?? this.count,
        pages: pages ?? this.pages,
        next: next ?? this.next,
        prev: prev ?? this.prev,
      );

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class Result {
  int id;
  String name;
  Status status;
  Species species;
  String type;
  Gender gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  Result({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  Result copyWith({
    int? id,
    String? name,
    Status? status,
    Species? species,
    String? type,
    Gender? gender,
    Location? origin,
    Location? location,
    String? image,
    List<String>? episode,
    String? url,
    DateTime? created,
  }) =>
      Result(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        species: species ?? this.species,
        type: type ?? this.type,
        gender: gender ?? this.gender,
        origin: origin ?? this.origin,
        location: location ?? this.location,
        image: image ?? this.image,
        episode: episode ?? this.episode,
        url: url ?? this.url,
        created: created ?? this.created,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    status: statusValues.map[json["status"]]!,
    species: speciesValues.map[json["species"]]!,
    type: json["type"],
    gender: genderValues.map[json["gender"]]!,
    origin: Location.fromJson(json["origin"]),
    location: Location.fromJson(json["location"]),
    image: json["image"],
    episode: List<String>.from(json["episode"].map((x) => x)),
    url: json["url"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": statusValues.reverse[status],
    "species": speciesValues.reverse[species],
    "type": type,
    "gender": genderValues.reverse[gender],
    "origin": origin.toJson(),
    "location": location.toJson(),
    "image": image,
    "episode": List<dynamic>.from(episode.map((x) => x)),
    "url": url,
    "created": created.toIso8601String(),
  };
}

enum Gender {
  FEMALE,
  MALE,
  UNKNOWN
}

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "Male": Gender.MALE,
  "unknown": Gender.UNKNOWN
});

class Location {
  String name;
  String url;

  Location({
    required this.name,
    required this.url,
  });

  Location copyWith({
    String? name,
    String? url,
  }) =>
      Location(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

enum Species {
  ALIEN,
  HUMAN
}

final speciesValues = EnumValues({
  "Alien": Species.ALIEN,
  "Human": Species.HUMAN
});

enum Status {
  ALIVE,
  DEAD,
  UNKNOWN
}

final statusValues = EnumValues({
  "Alive": Status.ALIVE,
  "Dead": Status.DEAD,
  "unknown": Status.UNKNOWN
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

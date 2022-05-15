import 'package:equatable/equatable.dart';

class Rocket extends Equatable {
  final String id;
  final String name;
  final String country;
  final String manufacturer;

  const Rocket({
    required this.id,
    required this.name,
    required this.country,
    required this.manufacturer,
  });

  @override
  List<Object?> get props => [id, name, country, manufacturer];

  factory Rocket.fromJson(Map<String, dynamic> map) {
    return Rocket(
      id: map['id'],
      name: map['name'],
      country: map['country'],
      manufacturer: map['company'],);
  }

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'name': name,
        'country': country,
        'manufacturer': manufacturer,
      };
}

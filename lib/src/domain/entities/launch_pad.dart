import 'package:equatable/equatable.dart';

class LaunchPad extends Equatable {
  final String name;
  final String id;

  const LaunchPad({required this.name, required this.id});

  @override
  List<Object?> get props => [name];

  factory LaunchPad.fromJson(Map<String, dynamic> map) {
    return LaunchPad(
      name: map['name'],
      id: map['id'],
    );
  }

  Map<String, dynamic> toJson() => {'name': name, 'id': id};
}

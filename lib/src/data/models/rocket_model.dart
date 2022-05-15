import 'package:parpera_demo/src/domain/entities/rocket.dart';

class RocketModel {
  const RocketModel({required this.rocketList});

  final List<Rocket> rocketList;

  factory RocketModel.fromJson(List<dynamic> map) {
    return RocketModel(rocketList: List<Rocket>.from(map.map((x) => Rocket.fromJson(x))).toList());
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(rocketList.map((x) => x.toJson())),
      };
}

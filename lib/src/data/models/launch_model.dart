import 'package:parpera_demo/src/domain/entities/launch.dart';

import '../../domain/entities/rocket.dart';

class LaunchModel {
  const LaunchModel({required this.launchList});

  final List<Launch> launchList;

  factory LaunchModel.fromJson(List<dynamic> map) {
    return LaunchModel(launchList: List<Launch>.from(map.map((x) => Launch.fromJson(x))).toList());
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(launchList.map((x) => x.toJson())),
      };
}

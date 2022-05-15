import 'package:parpera_demo/src/domain/entities/launch_pad.dart';

class LaunchPadModel {
  const LaunchPadModel({required this.launchPadList});

  final List<LaunchPad> launchPadList;

  factory LaunchPadModel.fromJson(List<dynamic> map) {
    return LaunchPadModel(launchPadList: List<LaunchPad>.from(map.map((x) => LaunchPad.fromJson(x))).toList());
  }

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(launchPadList.map((x) => x.toJson())),
  };
}

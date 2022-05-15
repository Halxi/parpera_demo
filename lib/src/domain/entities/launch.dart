import 'package:equatable/equatable.dart';
import 'package:parpera_demo/src/domain/entities/launch_pad.dart';
import 'package:parpera_demo/src/domain/entities/rocket.dart';

class Launch extends Equatable {
  final String name;
  final String fireUTCDate;
  final bool? status;
  final String? smallMissionPatch;
  final String? largeMissionPatch;
  final String rocketId;
  final String launchPadId;
  late Rocket? rocket;
  late LaunchPad? launchPad;

  Launch(
      {required this.name,
      required this.fireUTCDate,
      required this.status,
      required this.smallMissionPatch,
      required this.largeMissionPatch,
      required this.rocketId,
      required this.launchPadId,
      this.rocket,
      this.launchPad});

  @override
  List<Object?> get props {
    return [name, fireUTCDate, status, smallMissionPatch, largeMissionPatch];
  }

  factory Launch.fromJson(Map<String, dynamic> map) {
    return Launch(
        name: map['name'],
        fireUTCDate: map['date_utc'],
        status: map['success'],
        smallMissionPatch: map['links']['patch']['small'],
        largeMissionPatch: map['links']['patch']['large'],
        rocketId: map['rocket'],
        launchPadId: map['launchpad']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'fireUTCDate': fireUTCDate,
        'success': name,
        'status': status,
        'smallMissionPatch': smallMissionPatch,
        'largeMissionPatch': largeMissionPatch,
        'rocketId': rocketId,
        'launchPadId': launchPadId,
        'rocket': rocket,
        'launchpad': launchPad,
      };
}

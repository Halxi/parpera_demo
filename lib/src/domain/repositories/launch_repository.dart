import 'package:parpera_demo/src/data/models/launch_model.dart';
import 'package:parpera_demo/src/data/models/rocket_model.dart';
import 'package:parpera_demo/src/domain/entities/rocket.dart';

import '../../data/models/launch_pad_model.dart';

abstract class LaunchRepository {
  Future<LaunchModel> getLaunches();

  Future<RocketModel> getRockets();

  Future<Rocket> getRocketById(String id);

  Future<LaunchPadModel> getLaunchPad();
}
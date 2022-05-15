import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:parpera_demo/src/core/utils/constants.dart';
import 'package:parpera_demo/src/data/models/launch_model.dart';
import 'package:parpera_demo/src/data/models/launch_pad_model.dart';
import 'package:parpera_demo/src/data/models/rocket_model.dart';
import 'package:parpera_demo/src/domain/entities/launch_pad.dart';
import 'package:parpera_demo/src/domain/entities/rocket.dart';
import 'package:parpera_demo/src/domain/repositories/launch_repository.dart';

class LaunchRepositoryImpl implements LaunchRepository {
  @override
  Future<LaunchModel> getLaunches() async {
    try {
      final response =
          await http.get(Uri.parse('$kBaseUrl$kLaunchListUrl')).timeout(const Duration(seconds: kTimeOutDuration));

      if (response.statusCode == HttpStatus.ok) {
        return LaunchModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<RocketModel> getRockets() async {
    try {
      final response =
          await http.get(Uri.parse('$kBaseUrl$kRocketListUrl')).timeout(const Duration(seconds: kTimeOutDuration));

      if (response.statusCode == HttpStatus.ok) {
        return RocketModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<Rocket> getRocketById(String id) async {
    try {
      final response =
          await http.get(Uri.parse('$kBaseUrl$kRocketListUrl$id')).timeout(const Duration(seconds: kTimeOutDuration));

      if (response.statusCode == HttpStatus.ok) {
        return Rocket.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  @override
  Future<LaunchPadModel> getLaunchPad() async {
    try {
      final response =
          await http.get(Uri.parse('$kBaseUrl$kLaunchPadListUrl')).timeout(const Duration(seconds: kTimeOutDuration));

      if (response.statusCode == HttpStatus.ok) {
        return LaunchPadModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parpera_demo/src/domain/entities/launch.dart';
import 'package:parpera_demo/src/domain/entities/launch_pad.dart';
import 'package:parpera_demo/src/domain/repositories/launch_repository.dart';

import '../../domain/entities/rocket.dart';

part 'launch_list_event.dart';

part 'launch_list_state.dart';

class LaunchListBloc extends Bloc<LaunchListEvent, LaunchListState> {
  final LaunchRepository _launchRepository;

  LaunchListBloc(this._launchRepository) : super(LaunchListInitial()) {
    on<LaunchListEvent>((event, emit) {});
    on<GetData>((event, emit) async {
      try {
        emit(DataLoadingState());
        final launchModel = await _launchRepository.getLaunches();
        await _launchRepository.getRockets().then((rocketModel) {
          for (var launch in launchModel.launchList) {
            launch.rocket = findRocketById(launch.rocketId, rocketModel.rocketList);
          }
        });
        await _launchRepository.getLaunchPad().then((launchPadModel) {
          for (var launch in launchModel.launchList) {
            launch.launchPad = findLaunchPadById(launch.launchPadId, launchPadModel.launchPadList);
          }

        });
        emit(LoadingSuccessState(launchModel.launchList));
      } catch (error) {
        emit(LoadingErrorState(error.toString()));
      }
    });

    on<OnLaunchSelectedEvent>((event, emit) async {
      emit(DataLoadingState());
      emit(DisplayLaunchDetailState(event.launch));
    });
  }

  Rocket findRocketById(String id, List<Rocket> rocketList) {
    return rocketList.firstWhere((element) => id == element.id);
  }

  LaunchPad findLaunchPadById(String id, List<LaunchPad> launchPadList) {
    return launchPadList.firstWhere((element) => id == element.id);
  }
}

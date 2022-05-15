part of 'launch_list_bloc.dart';

abstract class LaunchListState extends Equatable {
  const LaunchListState();
}

class LaunchListInitial extends LaunchListState {
  @override
  List<Object> get props => [];
}

class DataLoadingState extends LaunchListState {
  @override
  List<Object?> get props => [];
}

class LoadingSuccessState extends LaunchListState {
  final List<Launch> launchList;

  const LoadingSuccessState(this.launchList);

  @override
  List<Object?> get props => [launchList];
}

class LoadingErrorState extends LaunchListState {
  final String errorMsg;

  const LoadingErrorState(this.errorMsg);

  @override
  List<Object?> get props => [];
}

class DisplayLaunchDetailState extends LaunchListState {
  final Launch launch;

  const DisplayLaunchDetailState(this.launch);

  @override
  List<Object?> get props => [launch];
}

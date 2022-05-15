part of 'launch_list_bloc.dart';

abstract class LaunchListEvent extends Equatable {
  const LaunchListEvent();
}

class GetData extends LaunchListEvent {
  @override
  List<Object?> get props => [];
}

class OnLaunchSelectedEvent extends LaunchListEvent {
  final Launch launch;

  const OnLaunchSelectedEvent(this.launch);

  @override
  List<Object?> get props => [launch];
}

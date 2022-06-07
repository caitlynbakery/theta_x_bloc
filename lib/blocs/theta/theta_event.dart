part of 'theta_bloc.dart';

@immutable
abstract class ThetaEvent extends Equatable {
  const ThetaEvent();

  @override
  List<Object> get props => [];
}

class GetInfoEvent extends ThetaEvent {}

class GetStateEvent extends ThetaEvent {}

class PictureEvent extends ThetaEvent {}

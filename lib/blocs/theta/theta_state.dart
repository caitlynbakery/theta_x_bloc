part of 'theta_bloc.dart';

@immutable
class ThetaState extends Equatable {
  final String message;
  final bool showImage;
  final String lastImageUrl;

  const ThetaState(
      {required this.message, this.showImage = false, this.lastImageUrl = ""});

  factory ThetaState.initial() => ThetaState(message: "Response from Camera");

  ThetaState copyWith({
    String? message,
  }) {
    return ThetaState(
      message: message ?? this.message,
    );
  }

  @override
  String toString() => 'ThetaState(message: $message)';

  @override
  List<Object> get props => [message];
}

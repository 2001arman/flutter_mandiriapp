part of 'input_cubit.dart';

@immutable
abstract class InputState {}

class InputInitial extends InputState {}

class InputLoading extends InputState {}

class InputSuccess extends InputState {
  final InputModel input;

  InputSuccess(this.input);

  List<Object> get props => [input];
}

class InputFailed extends InputState {
  final String error;

  InputFailed(this.error);

  List<Object> get props => [error];
}

part of 'log_in_cubit.dart';

class LogInState {
  final bool isPasswordVisible;

  LogInState({this.isPasswordVisible = false});

  LogInState copyWith({bool? isPasswordVisible}) {
    return LogInState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}

part of 'timer_bloc.dart';

@immutable
abstract class TimerState extends Equatable {
  const TimerState();
}

class TimerInitializing extends TimerState {
  @override
  List<Object> get props => [];
}

class CountDownstarted extends TimerState {
  final int countdown;
  final bool canResend;
  const CountDownstarted({
    required this.countdown,
    required this.canResend,
  });
  @override
  List<Object?> get props => [countdown, canResend];
}

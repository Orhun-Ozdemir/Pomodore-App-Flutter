import 'package:pomodore_list/features/home_page/model/timer.dart';

abstract class TimerState {}

class TimerInitial extends TimerState {}

class TimerStart extends TimerState {
  int minutes;
  int seconds;
  TimerStart(this.minutes, this.seconds);
}

class TimerPause extends TimerState {}

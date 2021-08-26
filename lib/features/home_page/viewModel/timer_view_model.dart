import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodore_list/core/base/timer_state.dart';
import 'package:pomodore_list/features/home_page/model/timer.dart';
//import 'package:pomodore_list/features/home_page/model/timer.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit(TimerInitial initialState) : super(initialState);
  late Timer periodik =
      Timer(Duration(), () {}); //= Timer(Duration(seconds: 1), () {});
  String veri = "HAHAHAHAHHAH";

  late Time time;

  void _timereset() {
    time = Time(
        DateTime.now(),
        DateTime.now().add(
          Duration(minutes: 25),
        ),
        60,
        24);
  }

  void startTime() {
    periodik.cancel();
    _timereset();
    periodik = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (DateTime.now().minute == time.endTime.minute &&
            DateTime.now().second == time.endTime.second) {
          print("bitti");
          stoptime();
        } else {
          if (time.seconds == 0) {
            time.minutes = time.minutes - 1;
            time.seconds = 59;
          } else {
            time.seconds = time.seconds - 1;
          }
          emit(TimerStart(time.minutes, time.seconds));
        }
      },
    );
  }

  void stoptime() {
    periodik.cancel();
    emit(TimerPause());
  }

  void pauseTime(DateTime pausetime) {}
}

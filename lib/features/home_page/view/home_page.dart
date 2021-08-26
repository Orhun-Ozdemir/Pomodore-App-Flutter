import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodore_list/core/base/timer_state.dart';
import 'package:pomodore_list/core/components/navigation_button.dart';
import 'package:pomodore_list/features/home_page/viewModel/timer_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime endTime;
  late DateTime startTime;
  bool bas = false;
  int saniye = 59;
  late DateTime? pauseTime;
  int dakika = 24;
  bool devam = true;
  static late Timer timer;
  int currentIndex = 0;

  void timebegin(bool pause) {
    setState(
      () {
        timer = Timer.periodic(
          Duration(seconds: 1),
          (timer) {
            if (DateTime.now().minute == endTime.minute &&
                DateTime.now().second == endTime.second) {
              print("bitti");
              timedestroy();
            } else {
              //debugPrint(time.minute.toString());
              setState(
                () {
                  if (saniye == 0) {
                    dakika = dakika - 1;
                    saniye = 59;
                  } else {
                    saniye = saniye - 1;
                  }
                },
              );
            }
          },
        );
      },
    );
  }

  void timedestroy() {
    timer.cancel();
  }

  bool intvalue = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        bottomNavigationBar: Navigation(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.only(bottom: 5, right: 10),
              child: DefaultTabController(
                length: 2,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TabBar(
                      labelColor: Colors.orange,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mode_night,
                                size: 14,
                              )
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wb_sunny_rounded, size: 14),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "POMODORE LiST",
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  margin: EdgeInsets.only(bottom: 30),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        // Colors.blueGrey.shade300,
                        // Colors.blueGrey.shade200,
                        // Colors.blueGrey.shade200,
                        // Colors.blueGrey.shade100,
                        Colors.white,
                        Colors.white
                      ],
                      // stops: [
                      //   0.0,
                      //   0.3,
                      //   .73,
                      //   1.0,
                      // ],
                    ),
                    borderRadius: BorderRadius.circular(200),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15,
                          spreadRadius: 3),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(4.0, 4.0),
                        blurRadius: 12,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Center(
                      child: state is TimerStart
                          ? Text("${state.minutes} :${state.seconds}")
                          : Text("Bos")
                      // Text(
                      //   "${context.read<TimerCubit>().time.minutes}  : ${context.read<TimerCubit>().time.seconds} ",
                      //   //${saniye.toString().length == 1 ? "0$saniye" : saniye}",
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 50,
                      //     fontWeight: FontWeight.w200,
                      //   ),
                      // ),
                      ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onPressed: () {
                    context.read<TimerCubit>().startTime();
                    // if (bas == true) {
                    //   setState(() {
                    //     timedestroy();
                    //     bas = false;
                    //   });
                    // }

                    // bas == false
                    //     ? setState(() {
                    //         dakika = 24;
                    //         saniye = 59;
                    //         startTime = DateTime.now();
                    //         endTime = DateTime.now().add(
                    //           Duration(minutes: 25),
                    //         );

                    //         bas = true;
                    //       })
                    //     : bas = true;
                    // if (devam == false) {
                    // } else {
                    //   timebegin(false);
                    // }
                  },
                  child: Text(
                    bas == false ? "START" : "RESTART",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: bas == true
                      ? ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                devam = !devam;
                                if (devam == false) {
                                  pauseTime = DateTime.now();
                                  timer.cancel();
                                } else {
                                  int pastTime = startTime
                                      .difference(pauseTime!)
                                      .inSeconds
                                      .abs();
                                  pauseTime = null;
                                  int normalTime = startTime
                                      .difference(endTime)
                                      .inSeconds
                                      .abs();

                                  int remainTime = normalTime - pastTime;
                                  endTime = DateTime.now().add(
                                    Duration(seconds: remainTime),
                                  );
                                  timebegin(true);
                                }
                              },
                            );
                          },
                          child: Text(
                            devam == true
                                ? "  STOP   "
                                : pauseTime != null
                                    ? "CONTİNUE"
                                    : "",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      : SizedBox(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

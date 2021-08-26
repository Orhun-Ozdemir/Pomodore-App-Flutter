import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodore_list/features/home_page/view/home_page.dart';
import 'core/base/timer_state.dart';
import 'features/home_page/viewModel/timer_view_model.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => TimerCubit(TimerInitial()),
      child: MaterialApp(
          // initialRoute: "/",
          // routes: AppNavigaiton.approute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            iconTheme: IconThemeData(size: 20),
            textTheme: TextTheme(
              bodyText1: GoogleFonts.lato(fontSize: 7),
              bodyText2: GoogleFonts.quicksand(fontSize: 14),
            ),
            buttonColor: Colors.greenAccent.shade100,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent.shade100,
              ),
            ),
            primaryColor: Colors.greenAccent.shade100,
          ),
          home: HomePage()),
    ),
  );
}

import 'package:flutter/widgets.dart';
import 'package:pomodore_list/features/home_page/view/home_page.dart';
import 'package:pomodore_list/features/todo_page/view/todo_page_view.dart';

class AppNavigaiton {
  static Map<String, Widget Function(BuildContext)> approute = {
    '/': (context) => const HomePage(),
    '/Todos': (context) => const TodoPage()
  };
}

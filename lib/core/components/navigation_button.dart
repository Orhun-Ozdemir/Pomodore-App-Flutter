import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  //const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          Navigator.pushNamed(context, routes[index]);
        });
      },
      items: items,
    );
  }
}

const List<Icon> icons = [
  Icon(Icons.list),
  Icon(
    Icons.no_accounts,
    color: Colors.white,
  ),
  Icon(Icons.watch),
];

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    label: "HomePage",
    icon: icons[0],
  ),
  BottomNavigationBarItem(
    label: "DuumyPage",
    icon: icons[1],
  ),
  BottomNavigationBarItem(
    label: "Todos",
    icon: icons[2],
  ),
];

const List<String> routes = [
  "/",
  "/Todos",
  "/Todos",
];

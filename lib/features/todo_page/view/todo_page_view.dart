import 'package:flutter/material.dart';
import 'package:pomodore_list/core/components/navigation_button.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        bottomNavigationBar: Navigation(),
        body: Center(
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text(" Yapılıcak bir sürü iş var"),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: Colors.red,
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          size: 14,
                        ),
                        label: Text(
                          "DELETE",
                          style: TextStyle(fontSize: 10),
                        )),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: Colors.green,
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.update,
                          size: 14,
                        ),
                        label: Text(
                          "UPDATE",
                          style: TextStyle(fontSize: 10),
                        ))
                  ],
                );
              }),
        ),
      ),
    );
  }
}

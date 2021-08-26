import 'package:flutter/material.dart';

ElevatedButton custombutton(String text) => ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      child: Text(text),
    );

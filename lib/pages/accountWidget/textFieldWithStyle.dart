// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class textFieldWithStyle extends StatelessWidget {
  const textFieldWithStyle({
    super.key,
    required TextEditingController lastName, 
    required this.hintText,
  }) : _lastName = lastName;

  final TextEditingController _lastName;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _lastName,
      style: TextStyle(
        color: Colors.grey[800],
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(199, 226, 238, 251),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 127, 124, 124),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 103, 103, 103),
          ),
        ),
        focusedBorder: UnderlineInputBorder( 
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            /// clear whats currently in the text field
            _lastName.clear();
          },
          icon: Icon(
            Icons.clear,
            color: Colors.grey[600],
            size: 22,
          ),
        ),
      ),
    );
  }
}

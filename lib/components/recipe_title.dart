import 'package:flutter/material.dart';

class RecipeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        "올댓아너스클럽",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
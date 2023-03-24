import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
   SecondScreen({super.key, required this.completedWord, required this.titleWord});
  String completedWord;
  String titleWord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :AppBar(
        backgroundColor: Color.fromARGB(255, 90, 155, 88),
      ),
      // body: Center(
      //     child:ElevatedButton(
            
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       child: Text('Go Back'),
      //       style: ElevatedButton.styleFrom(
      //         primary: Color.fromARGB(255, 90, 155, 88),
      //       ),)
      //     ),
      body: Column(children: [
        Text(completedWord),
        Text(titleWord),
      ],),
    );
  }
}
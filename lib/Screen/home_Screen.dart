import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:learning/Screen/Second_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
var myController = TextEditingController();
var myTextController =TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(200.0),
                child: TextField(
                  controller: myController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: ElevatedButton(
                  onPressed: () async {
                    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
                    var response = await http.get(url);
                     print('Response status : ${response.statusCode}');
                    print('Response status : ${response.body}');
                    var data = jsonDecode(response.body);
                   // var text = data[0]["meanings"][0]["definitions"][0]["definition"];
                      // int completed =data['userId'];
                        String title =data['title'];
                       // String completed = data['completed'];

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SecondScreen(titleWord: title, completedWord: 'completed'),
                    ));
                    
                  },
                  child: Text('Go to HomeScreen'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 90, 155, 88),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//======================================================================================================

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:learning/Screen/Second_Screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
// var myController = TextEditingController();
// var myTextController =TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     myTextController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(200.0),
//                 child: TextField(
//                   controller: myController,
//                 ),
//               ),
//               SizedBox(height: 10),
//               FloatingActionButton(
//   // When the user presses the button, show an alert dialog containing
//   // the text that the user has entered into the text field.
//   onPressed: () {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           // Retrieve the text that the user has entered by using the
//           // TextEditingController.
//           content: Text(myTextController.text),
//         );
//       },
//     );
//   },
//   tooltip: 'Show me the value!',
//   child: const Icon(Icons.text_fields),
// ),
//               Padding(
//                 padding: const EdgeInsets.all(100.0),
//                 child: ElevatedButton(
//                   onPressed: () async {
                    
//                     print("my input");
//                     var uri =  'https://api.dictionaryapi.dev/api/v2/entries/en/'+myTextController.text;
//                     print(uri);
               
//                     var url = Uri.parse(uri);
//                     var response = await http.get(url);
//                     // print('Response status : ${response.statusCode}');
//                     // print('Response status : ${response.body}');
//                     var data = jsonDecode(response.body);
//                     var text = data[0]["meanings"][0]["definitions"][0]["definition"];
//                   // myController.text= text;
//                     myTextController.text =text;
//                     print(data[0]["meanings"][0]["definitions"][0]["definition"]);
//                     // Navigator.of(context).push(MaterialPageRoute(
//                     //   builder: (context) => SecondScreen(),
//                     // ));
//                   },
//                   child: Text('Go to HomeScreen'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Color.fromARGB(255, 90, 155, 88),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

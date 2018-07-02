// Import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get; //only importing the get function
import 'models/image_model.dart';
import 'dart:convert';
import 'Widgets/image_list.dart';

//* Stateless Widget example
// Create a class that will be out custom widget
// This class must extend the "StatelessWidget" base class
// class App extends StatelessWidget {
//** Must define a "build" method that returns the widgets that "this" widget will show
//   Widget build(contex) {
//     return MaterialApp(
//       home: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {
//             print('Hi, there');
//           },
//         ),
//         appBar: AppBar(
//           title: Text('Lets see images'),
//         ),
//       ),
//     );
//   }
// }

//* Stateful Widget

// Widget
class App extends StatefulWidget {
  @override
  AppState createState() {
    return AppState();
  }
}

// Widget State
class AppState extends State<App> {
  // instance variable that's going to change over time
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    final response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));

    //Causing UI to re-render with setState()
    setState(() {
      images.add(imageModel);
    });
  }

  // Must define a "build" method that returns the widgets that "this" widget will show
  Widget build(contex) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:
              fetchImage, //Passing the reference of the fetchImage function to the onPressed property, not calling it directly
        ),
        appBar: AppBar(
          title: Text('Lets see images'),
        ),
      ),
    );
  }
}

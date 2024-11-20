import 'package:flutter/material.dart';
import 'chat_screen.dart'; // Import the ChatScreen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Llama Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(), // Set the home screen to ChatScreen
    );
  }
}

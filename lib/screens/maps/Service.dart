import 'package:flutter/material.dart';

class ServiceWelcome extends StatefulWidget {
  @override
  _ServiceWelcomeState createState() => _ServiceWelcomeState();
}

class _ServiceWelcomeState extends State<ServiceWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Center(
        child: Text('Comming soon!'),
      ),
    );
  }
}

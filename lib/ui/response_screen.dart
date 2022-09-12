import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ResponseScreen extends StatefulWidget {
  const ResponseScreen({Key? key}) : super(key: key);

  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  String username = '';
  String password = '';

  @override
  void initState() {
    var box = Hive.box('user');
    username = box.get('username');
    password = box.get('password');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Response Page !'),
      ),
      body: Center(
          child: Column(
        children: [Text('Username: $username'), Text('Password: $password')],
      )),
    );
  }
}

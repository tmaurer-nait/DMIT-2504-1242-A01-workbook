import 'package:flutter/material.dart';

import 'package:testing_example/models/user.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({required this.user, super.key});

  final User user;

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  var _showInfo = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_showInfo) Text('Name: ${widget.user.name}'),
        if (_showInfo) Text('Email: ${widget.user.email}'),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _showInfo = true;
            });
          },
          child: Text('Show info'),
        )
      ],
    );
  }
}

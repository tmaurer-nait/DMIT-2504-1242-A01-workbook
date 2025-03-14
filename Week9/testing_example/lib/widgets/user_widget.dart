import 'package:flutter/material.dart';

import 'package:testing_example/models/user.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name: ${user.name}'),
        Text('Email: ${user.email}'),
      ],
    );
  }
}

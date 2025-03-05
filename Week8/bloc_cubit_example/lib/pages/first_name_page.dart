import 'package:flutter/material.dart';

import 'package:bloc_cubit_example/state/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Name Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return Text(
                    'User name: ${state.user.firstName} ${state.user.lastName}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user firs name here
        onPressed: () {
          final user = context.read<UserCubit>().state.user;
          user.firstName = 'NewFirstName';
          context.read<UserCubit>().updateUser(user);
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}

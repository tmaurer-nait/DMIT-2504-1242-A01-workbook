import 'package:flutter/material.dart';

import 'package:state_example/models/user.dart';

class UserNotifier extends InheritedNotifier<User> {
  const UserNotifier({
    super.key,
    required User user,
    required Widget child,
  }) : super(notifier: user, child: child);

  static UserNotifier? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserNotifier>();
  }

  static User of(BuildContext context) {
    // Get the most recent ancestor UserNotifier
    final result = maybeOf(context);

    if (result == null || result.notifier == null) {
      throw StateError('No UserNotifier found in context');
    }

    // return the notifier from the UserNotifier
    return result.notifier!;
  }
}

import 'package:flutter/material.dart';
import 'package:navigation_exercise/routes.dart' as routes;

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page One'),
            ElevatedButton(
              onPressed: () async {
                var retVal =
                    await Navigator.of(context).pushNamed(routes.pageTwoRoute);
                setState(() {
                  data = retVal as String;
                });
              },
              child: Text('Go to Page Two'),
            ),
            data.isEmpty ? Text('Awaiting Data') : Text('Received $data'),
          ],
        ),
      ),
    );
  }
}

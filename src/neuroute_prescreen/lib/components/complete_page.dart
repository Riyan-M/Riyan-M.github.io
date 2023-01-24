import 'package:flutter/material.dart';

class CompletionPage extends StatelessWidget {
  const CompletionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Color(0xff00C7A8),
              size: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Thank you for completing the form.\nYour details have been saved.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

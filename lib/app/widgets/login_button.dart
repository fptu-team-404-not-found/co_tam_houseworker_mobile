import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;

  const LoginButton({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const VoidCallback? onPressed = null;
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title
        ),
    );
  }
}

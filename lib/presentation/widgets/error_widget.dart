import 'package:flutter/material.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String messageError;
  const ErrorDisplayWidget({Key? key, required this.messageError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(messageError),
      action: SnackBarAction(label: 'Close', onPressed: () {}),
    );
  }
}

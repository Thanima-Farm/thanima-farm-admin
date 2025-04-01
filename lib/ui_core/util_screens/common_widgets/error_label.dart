import 'package:flutter/material.dart';

class InputErrorLabel extends StatelessWidget {
  final String? errorMessage;

  const InputErrorLabel({Key? key, this.errorMessage = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xFFfa6400),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        padding: const EdgeInsets.all(8),
        child: Text(
          errorMessage!,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}

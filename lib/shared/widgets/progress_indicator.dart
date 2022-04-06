import 'package:flutter/material.dart';

class TProgressIndicator extends StatelessWidget {
  const TProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

import 'package:flutter/material.dart';

class MvvmDetailsWidget extends StatelessWidget {
  const MvvmDetailsWidget({
    Key? key,
    required this.details,
  }) : super(key: key);

  final String details;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(details));
  }
}

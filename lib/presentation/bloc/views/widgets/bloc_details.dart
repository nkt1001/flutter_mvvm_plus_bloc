import 'package:flutter/material.dart';

class BlocDetailsWidget extends StatelessWidget {
  const BlocDetailsWidget({
    Key? key,
    required this.details,
  }) : super(key: key);

  final String details;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(details),
    );
  }
}

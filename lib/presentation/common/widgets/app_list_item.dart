
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppListItem extends StatelessWidget {
  final String title;
  final Function onTap;

  const AppListItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(title),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

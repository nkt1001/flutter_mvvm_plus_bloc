
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppListItem extends StatelessWidget {
  final String title;

  const AppListItem({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

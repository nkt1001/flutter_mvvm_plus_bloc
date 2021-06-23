import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/mvvm_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/mvvm/views/widgets/mvvm_details.dart';

class MvvmDetailsPage extends StatelessWidget {
  const MvvmDetailsPage({
    Key? key,
  }) : super(key: key);
  static const route = '/mvvm-details';

  @override
  Widget build(BuildContext context) {
    final details = ModalRoute.of(context)?.settings.arguments as MvvmItem;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mvvm Item Details'),
      ),
      body: MvvmDetailsWidget(
        details: details.title,
      ),
    );
  }
}

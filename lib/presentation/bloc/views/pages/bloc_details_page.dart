import 'package:flutter/material.dart';
import 'package:mvvm_plus_bloc_flutter_app/domain/entities/bloc_item.dart';
import 'package:mvvm_plus_bloc_flutter_app/presentation/bloc/views/widgets/bloc_details.dart';

class BlocDetailsPage extends StatelessWidget {
  const BlocDetailsPage({Key? key}) : super(key: key);

  static const route = '/bloc-details';

  @override
  Widget build(BuildContext context) {
    final details = ModalRoute.of(context)?.settings.arguments as BlocItem;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Item Details'),
      ),
      body: BlocDetailsWidget(
        details: details.title,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:chap9_gridview/widgets/gridview_builder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('top app bar'),
      ),
      body: SafeArea(
        child: GridViewBuilderWidget(
          key: UniqueKey(),
        ),
      ),
    );
  }
}

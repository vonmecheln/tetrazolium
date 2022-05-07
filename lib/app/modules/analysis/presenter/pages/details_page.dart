import 'package:flutter/material.dart';

import 'package:tetrazolium/app/shared/domain/entities/analysis.dart';

class DetailsPage extends StatefulWidget {
  final AnalysisEntity analysis;
  const DetailsPage({
    Key? key,
    required this.analysis,
  }) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.analysis.id),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.analysis.id),
          ],
        ),
      ),
    );
  }
}

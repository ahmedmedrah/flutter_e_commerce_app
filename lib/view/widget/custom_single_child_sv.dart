import 'package:flutter/material.dart';

class CustomSingleChildSV extends StatelessWidget {
  final Widget child;

  CustomSingleChildSV({@required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchLineup extends StatelessWidget {
  const MatchLineup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [Image.asset('assets/images/dummy/field.png')]),
    );
  }
}

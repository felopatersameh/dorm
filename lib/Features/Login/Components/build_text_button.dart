import 'package:flutter/material.dart';

class BuildTextButton extends StatelessWidget {
  final String title;
  final TextStyle style;
  const BuildTextButton({super.key, required this.title, required this.style});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
        child: TextButton(onPressed: () {}, child: Text(title, style: style)),
      ),
    );
  }
}

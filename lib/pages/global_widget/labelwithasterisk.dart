import 'package:flutter/material.dart';

class LabelWithAsterisk extends StatelessWidget {
  final String labelText;
  final Color asteriskColor;
  final TextStyle? labelStyle;

  const LabelWithAsterisk({
    Key? key,
    required this.labelText,
    this.asteriskColor = Colors.red,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: labelText,
            style: labelStyle ?? const TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: " *",
            style: TextStyle(color: asteriskColor),
          ),
        ],
      ),
    );
  }
}

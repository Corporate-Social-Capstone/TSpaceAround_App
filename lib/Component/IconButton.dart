import 'package:flutter/material.dart';

import '../Screen/MyApp.dart';

class CustomIconButton extends StatelessWidget {
  final int iconCase;
  final VoidCallback onPressed;

  const CustomIconButton({
    required this.iconCase,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: iconCase == 1
            ? Icon(Icons.book)
            : iconCase == 2
                ? Icon(Icons.search)
                : Icon(Icons.menu));
  }
}

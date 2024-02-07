import 'package:flutter/material.dart';

class SideLogo extends StatelessWidget {
  const SideLogo({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/finallogo.png",
      width: 75,
      height: 75,
      fit: BoxFit.cover,
    );
  }
}

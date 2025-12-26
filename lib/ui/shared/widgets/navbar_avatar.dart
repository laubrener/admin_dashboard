import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image(
        image: AssetImage('michael.jpg'),
        width: 30,
        height: 30,
        fit: BoxFit.cover,
      ),
    );
  }
}

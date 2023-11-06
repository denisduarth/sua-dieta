// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CircleAvatarModel extends StatelessWidget {
  void Function()? onPressed;
  Widget icon;
  Color? color;

  CircleAvatarModel(this.onPressed, this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 25,
      backgroundColor: color,
      child: IconButton.filled(
        onPressed: onPressed,
        icon: icon,
        color: Colors.white,
        alignment: AlignmentDirectional.center,
        iconSize: 30,
      ),
    );
  }
}

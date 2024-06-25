import 'package:flutter/material.dart';

class Abc extends StatelessWidget {
  const Abc({
    super.key,
    required this.text,
    required this.containerImage
  });

  final String text;
  final String containerImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  containerImage))),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
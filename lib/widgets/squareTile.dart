import 'package:flutter/material.dart';

class MySquareTile extends StatelessWidget {
  final String imageAdd;
  const MySquareTile({Key? key, required this.imageAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200]
      ),
      child: Image.asset(imageAdd, height: 40,),
    );
  }
}

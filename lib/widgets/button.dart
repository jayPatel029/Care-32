import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  Function()? onTap;
  final String bName;
  MyButton({Key? key, required this.onTap, required this.bName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(color: Colors.black,
        borderRadius: BorderRadius.circular(9),),

        child: Center(
          child: Text(bName,
          style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),

          ),
        ),
      ),
    );
  }
}

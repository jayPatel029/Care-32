import 'package:dental_minor/router/constraints.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Icons;
  final leading;
  final automaticallyImplyLeading;


  const CustomAppbar({
    Key? key,
    required this.title, this.Icons, this.leading, this.automaticallyImplyLeading,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,5,0,0),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                  context,
                  profileRoute,);
            },
            icon: Icon(
              Icons,
              color: Colors.black,
              size: 35,
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}

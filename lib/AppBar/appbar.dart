import 'package:flutter/material.dart';

class AppBar_Principal extends StatefulWidget implements PreferredSizeWidget{
  final String title;
  final Color couleurFond;
  final Color couleurText;
  final List<Widget> actions;

  AppBar_Principal({Key? key, required this.title, required this.couleurFond, required this.couleurText, this.actions = const []}) : super(key: key);

  @override
  _AppBar_PrincipalState createState() => _AppBar_PrincipalState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBar_PrincipalState extends State<AppBar_Principal> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: widget.couleurFond,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color : widget.couleurText,
          onPressed: () {
          },
        ),
        ...widget.actions,
      ],
    );
  }
}
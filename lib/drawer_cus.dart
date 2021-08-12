import 'package:flutter/material.dart';

class MenuItem {
  String title;
  String iconSource;
  Color color;
  MenuItem(
      {required this.title, required this.iconSource, required this.color});
}

class MenuCus extends StatefulWidget {
  final List<MenuItem> menuItems;
  final Duration animDuration;
  final Function onPressed;
  MenuCus(
      {required this.menuItems,
      required this.animDuration,
      required this.onPressed});

  @override
  State<MenuCus> createState() => _MenuCusState();
}

class _MenuCusState extends State<MenuCus> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    int selectMenuIndex = 0;
    List<Widget> _buildMenuItem() {
      List<Widget> _menuItems = [];
      for (int i = 0; i < widget.menuItems.length; i++) {
        bool isSelected = selectMenuIndex == i;
        _menuItems.add(FlatButton(
            onPressed: () {
              setState(() {
                selectMenuIndex = i;
                widget.onPressed(selectMenuIndex);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: Column(
                children: [
                  Image.asset(
                    widget.menuItems[i].iconSource,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.menuItems[i].title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            )));
      }
      return _menuItems;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildMenuItem(),
    );
  }
}

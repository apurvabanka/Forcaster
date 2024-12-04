import 'package:flutter/material.dart';
import 'package:forecaster_app/const/constant.dart';
import 'package:forecaster_app/data/side_menu_data.dart';

class SideMenuWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const SideMenuWidget(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => widget.onItemTapped(selectIndex),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
              color: selectIndex == index ? selectionColor : Colors.transparent,
            ),
            child: InkWell(
              onTap: () => setState(
                () {
                  selectIndex = index;
                  widget.onItemTapped(selectIndex);
                },
              ),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                    child: Icon(
                      data.menu[index].icon,
                      color: selectIndex == index ? Colors.black : Colors.grey,
                    ),
                  ),
                  Text(
                    data.menu[index].title,
                    style: TextStyle(
                        fontSize: 16,
                        color:
                            selectIndex == index ? Colors.black : Colors.grey,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

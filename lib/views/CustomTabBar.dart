import 'package:flutter/material.dart';

class HorizontalTabs extends StatefulWidget {
  @override
  _HorizontalTabsState createState() => _HorizontalTabsState();
}

class _HorizontalTabsState extends State<HorizontalTabs> {
  final List<String> _tabs = ["Tab 1", "Tab 2", "Tab 3", "Tab 4"];
  int _selectedIndex = 0;
  final Color _selectedTextColor = Colors.blue;
  final Color _unselectedTextColor = Colors.grey;
  final Color _indicatorColor = Colors.blue;

  final List<Widget> _tabContents = [
    Center(child: Text("Content for Tab 1", style: TextStyle(fontSize: 18))),
    Center(child: Text("Content for Tab 2", style: TextStyle(fontSize: 18))),
    Center(child: Text("Content for Tab 3", style: TextStyle(fontSize: 18))),
    Center(child: Text("Content for Tab 4", style: TextStyle(fontSize: 18))),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: Color(0xFFF8FAFB),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: List.generate(_tabs.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          _tabs[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: _selectedIndex == index ? FontWeight.w600 : FontWeight.w400,
                            color: _selectedIndex == index ? _selectedTextColor : _unselectedTextColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedIndex == index ? _indicatorColor : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        Expanded(
          child: _tabContents[_selectedIndex],
        ),
      ],
    );
  }
}

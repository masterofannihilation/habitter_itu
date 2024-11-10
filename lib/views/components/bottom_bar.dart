import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itu_habitter/constants.dart';
import 'package:itu_habitter/views/category_page.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation to different views based on the selected index
    switch (index) {
      case 0:
        // Navigate to Home view
        break;
      case 1:
        // Navigate to All Habits view
        break;
      case 2:
        // Navigate to Categories view
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryPage()),
        );
        break;
      case 3:
        // Navigate to stats view
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey, // Set the desired border color
            width: 1.0, // Set the desired border width
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/home.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 0 ? orangeColor : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/target.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? orangeColor : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: 'Target',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/categories.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 2 ? orangeColor : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/pie-chart.svg',
              colorFilter: ColorFilter.mode(
                _selectedIndex == 3 ? orangeColor : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: 'Stats',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: orangeColor,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}

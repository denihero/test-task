import 'package:flutter/material.dart';
import 'package:test_task/src/screens/home_screen/page/favourite_page.dart';
import 'package:test_task/src/screens/home_screen/page/home_page.dart';
import 'package:test_task/src/screens/home_screen/page/map_page.dart';
import 'package:test_task/src/screens/home_screen/page/profile_page.dart';
import 'package:test_task/src/screens/home_screen/widget/info_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    HomePage(),
    MapPage(),
    FavouritePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.92),
        body:pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
            selectedItemColor: const Color.fromRGBO(70,49,210,1),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Лента',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Карта'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Избранное'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Профиль'
              ),
            ]
        ),
      ),
    );
  }
}

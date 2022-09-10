import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  List<Widget> pages = const [
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
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: const Color.fromRGBO(70, 49, 210, 1),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/lenta.svg',
                    height: 23,
                    width: 23,
                    color: _selectedIndex == 0
                        ? const Color.fromRGBO(70, 49, 210, 1)
                        : Colors.black),
                label: 'Лента',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/map.svg',
                      height: 23,
                      width: 23,
                      color: _selectedIndex == 1
                          ? const Color.fromRGBO(70, 49, 210, 1)
                          : Colors.black),
                  label: 'Карта'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'Избранные'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/profile.svg',
                      height: 23,
                      width: 23,
                      color: _selectedIndex == 3
                          ? const Color.fromRGBO(70, 49, 210, 1)
                          : Colors.black),
                  label: 'Профиль'),
            ]),
      ),
    );
  }
}

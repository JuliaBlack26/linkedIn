import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin1/screens/home_page/home_screen.dart';
import 'package:linkedin1/screens/home_page/post_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  
  final List<Widget> _children = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  void onTabTapped(int index) {
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen(),));
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SafeArea(
          child: Scaffold(
            body: _children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              iconSize: 22,
              unselectedItemColor: const Color(0xFF666666),
              selectedFontSize: 14,
              unselectedFontSize: 14,
              selectedItemColor: Colors.black,
              showSelectedLabels: true,
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house_fill, size: 25),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.userGroup, size: 22),
                  label: 'My network',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.solidSquarePlus, size: 22),
                  label: 'Post',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.bell_fill, size: 25),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.briefcase),
                  label: 'Jobs',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

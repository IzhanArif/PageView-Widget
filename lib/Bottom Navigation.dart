import 'package:flutter/material.dart';
import 'package:pageview/pages/page1.dart';
import 'package:pageview/pages/page2.dart';
import 'package:pageview/pages/page3.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selecteditem = 0;
  final _pages = [const FirstPage(), const SecondPage(), const ThirdPage()];
  final _pagecntrl = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page View Navigation Example"),
      ),
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selecteditem = index;
          });
        },
        controller: _pagecntrl,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: ("Home"),
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(icon: Icon(Icons.photo), label: ("Photos")),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: ("Calling")),
          ],
          currentIndex: _selecteditem,
          onTap: (index) {
            setState(() {
              _selecteditem = index;
              _pagecntrl.animateToPage(_selecteditem,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear);
            });
          }),
    );
  }
}

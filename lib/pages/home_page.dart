import 'package:bill_splitter/pages/bill_calculator.dart';
import 'package:bill_splitter/pages/bill_splitter.dart';
import 'package:bill_splitter/pages/home_screen.dart';
import 'package:bill_splitter/pages/profile.dart';
import 'package:bill_splitter/utils/dialogue_box.dart';
import 'package:flutter/material.dart';
import '../utils/amount_calc_tile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    HomeScreen(),
    BillSplitter(),
    BillCalculator(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6ECCAF),
      appBar: AppBar(
        backgroundColor: Color(0xFF344D67),
        elevation: 0,
        title: Center(
          child: Text(
            'Bill Splitter',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
            onTabChange: navigateBottomBar,
            selectedIndex: _selectedIndex,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(16),
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.horizontal_split_outlined,
                text: 'Splitter',
              ),
              GButton(
                icon: Icons.calculate_rounded,
                text: 'Calculator',
              ),
              GButton(
                icon: Icons.person,
                text: 'profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stock_market_appp/pages/analysis.dart';
import 'package:stock_market_appp/pages/home_page.dart';
import 'package:stock_market_appp/pages/portfolio.dart';
import 'package:stock_market_appp/pages/profile.dart';
import 'package:stock_market_appp/pages/trends.dart';
import 'package:stock_market_appp/widgets/navBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      AnalysisPage(),
      TrendsPage(),
      PortfolioPage(),
      ProfilePage(),
    ];
  }

  void _setNavigationIndex(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavBar(
          selectedIndex: _selectedIndex,
          setNavigationIndex: _setNavigationIndex,
      ),
    );
  }
}

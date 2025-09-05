import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> setNavigationIndex;
  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.setNavigationIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            return states.contains(WidgetState.selected)
                ? const TextStyle(color: Colors.green)
                : const TextStyle(color: Colors.grey);
          }),
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
            return states.contains(WidgetState.selected)
                ? const IconThemeData(color: Colors.green, size: 24)
                : const IconThemeData(color: Colors.grey, size: 24);
          }),
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: setNavigationIndex,
          destinations: const[
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.analytics), label: "Analysis"),
            NavigationDestination(icon: Icon(Icons.trending_up), label: "Trends"),
            NavigationDestination(icon: Icon(Icons.pie_chart), label: "Portfolio"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile")

          ],
        ),
      ),
    );
  }
}

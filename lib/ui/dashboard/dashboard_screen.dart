import 'package:flutter/material.dart';
import 'package:milk/ui/calender/calender.dart';
import 'package:milk/ui/dashboard/dashboard.dart';
import 'package:milk/ui/my_history/my_history.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SideDrawer(currentIndex, (selectedIndex) {
        currentIndex = selectedIndex;
        setState(() {});
      }),
      body: getCurrentPages(),
    );
  }

  getCurrentPages() {
    switch (currentIndex) {
      case 0:
        return HomeScreen(
            parentScaffoldKey: scaffoldKey,
            callback: (selectedIndex) {
              currentIndex = selectedIndex;
              setState(() {});
            });
      case 11:
        return ProductListScreen(
            parentScaffoldKey: scaffoldKey,
            callback: (selectedIndex) {
              currentIndex = selectedIndex;
              setState(() {});
            });

      case 3:
        return MyHistoryScreen(
            parentScaffoldKey: scaffoldKey,
            callback: (selectedIndex) {
              currentIndex = selectedIndex;
              setState(() {});
            });
      case 4:
        return CalenderScreen(parentScaffoldKey: scaffoldKey);

      default:
        return Container();
    }
  }
}

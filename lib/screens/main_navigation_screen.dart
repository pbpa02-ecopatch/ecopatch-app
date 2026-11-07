import 'package:flutter/material.dart';
import 'package:ecopatch_app/widgets/left_drawer.dart';
import 'package:ecopatch_app/plant_library/screens/plant_library_page.dart';
import 'package:ecopatch_app/my_ecopatch/screens/my_ecopatch_page.dart';
import 'package:ecopatch_app/smart_care/screens/smart_care_page.dart';
import 'package:ecopatch_app/garden_journal/screens/garden_journal_page.dart';
import 'package:ecopatch_app/seed_exchange/screens/seed_exchange_page.dart';
import 'package:ecopatch_app/theme/app_colors.dart';

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;
  const MainNavigationScreen({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;

  final List<Widget> _pages = const [
    PlantLibraryPage(),
    MyEcoPatchPage(),
    SmartCarePage(),
    GardenJournalPage(),
    SeedExchangePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.brandGreen,
          unselectedItemColor: AppColors.inkMuted,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_florist_outlined),
              activeIcon: Icon(Icons.local_florist),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.yard_outlined),
              activeIcon: Icon(Icons.yard),
              label: 'My EcoPatch',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.water_drop_outlined),
              activeIcon: Icon(Icons.water_drop),
              label: 'Smart Care',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories_outlined),
              activeIcon: Icon(Icons.auto_stories),
              label: 'Journal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horizontal_circle_outlined),
              activeIcon: Icon(Icons.swap_horizontal_circle),
              label: 'Exchange',
            ),
          ],
        ),
      ),
    );
  }
}

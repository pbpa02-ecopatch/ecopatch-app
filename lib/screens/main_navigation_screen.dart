import 'package:flutter/material.dart';

import 'package:ecopatch_app/theme/app_icons.dart';
import 'package:ecopatch_app/widgets/left_drawer.dart';
import 'package:ecopatch_app/widgets/module_icon.dart';
import 'package:ecopatch_app/plant_library/screens/plant_library_page.dart';
import 'package:ecopatch_app/my_ecopatch/screens/my_ecopatch_page.dart';
import 'package:ecopatch_app/smart_care/screens/smart_care_page.dart';
import 'package:ecopatch_app/garden_journal/screens/garden_journal_page.dart';
import 'package:ecopatch_app/seed_exchange/screens/seed_exchange_page.dart';

class MainNavigationScreen extends StatefulWidget {
  final int initialIndex;
  const MainNavigationScreen({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  static const List<EcoModule> _modules = EcoModule.values;

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
      drawer: LeftDrawer(currentIndex: _currentIndex),
      appBar: AppBar(
        title: Text(_modules[_currentIndex].label),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          for (final module in _modules)
            NavigationDestination(
              icon: ModuleIcon(module, size: 24),
              selectedIcon: ModuleIcon(module, size: 26),
              label: module.shortLabel,
            ),
        ],
      ),
    );
  }
}

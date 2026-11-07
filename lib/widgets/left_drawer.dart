import 'package:flutter/material.dart';
import 'package:ecopatch_app/screens/main_navigation_screen.dart';
import 'package:ecopatch_app/theme/app_colors.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cardSurface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.brandGreen,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.eco,
                    color: AppColors.brandGreen,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'EcoPatch',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Sustainable Urban Farming',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.local_florist_outlined, color: AppColors.brandGreen),
            title: const Text('Plant Library', style: TextStyle(color: AppColors.ink, fontWeight: FontWeight.w600)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigationScreen(initialIndex: 0),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.yard_outlined, color: AppColors.brandGreen),
            title: const Text('My EcoPatch', style: TextStyle(color: AppColors.ink, fontWeight: FontWeight.w600)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigationScreen(initialIndex: 1),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.water_drop_outlined, color: AppColors.brandGreen),
            title: const Text('Smart Care', style: TextStyle(color: AppColors.ink, fontWeight: FontWeight.w600)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigationScreen(initialIndex: 2),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.auto_stories_outlined, color: AppColors.brandGreen),
            title: const Text('Garden Journal', style: TextStyle(color: AppColors.ink, fontWeight: FontWeight.w600)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigationScreen(initialIndex: 3),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.swap_horizontal_circle_outlined, color: AppColors.brandGreen),
            title: const Text('Seed Exchange', style: TextStyle(color: AppColors.ink, fontWeight: FontWeight.w600)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigationScreen(initialIndex: 4),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

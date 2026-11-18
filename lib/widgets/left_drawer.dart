import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecopatch_app/screens/main_navigation_screen.dart';
import 'package:ecopatch_app/theme/app_colors.dart';
import 'package:ecopatch_app/theme/app_icons.dart';
import 'package:ecopatch_app/theme/app_theme.dart';
import 'package:ecopatch_app/widgets/module_icon.dart';

/// Menu samping, meniru `.site-navbar--side` di web: kartu putih susu dengan
/// sudut 30 px, judul grup kecil, dan pil hijau untuk halaman yang sedang dibuka.
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key, this.currentIndex = 0});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
        side: BorderSide(color: AppColors.sideLine),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(12, 18, 12, 14),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 14),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.sideLine)),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/logo.svg', width: 30, height: 30),
                  const SizedBox(width: 8),
                  Text(
                    'EcoPatch',
                    style: AppTheme.heading(
                      fontSize: 24,
                      color: AppColors.brand600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            _groupLabel('Kebun'),
            _item(context, EcoModule.plantLibrary),
            _item(context, EcoModule.myEcoPatch),
            _groupLabel('Perawatan'),
            _item(context, EcoModule.smartCare),
            _item(context, EcoModule.gardenJournal),
            _groupLabel('Komunitas'),
            _item(context, EcoModule.seedExchange),
          ],
        ),
      ),
    );
  }

  Widget _groupLabel(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
      child: Text(
        text,
        style: AppTheme.body(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.inkMuted,
        ).copyWith(letterSpacing: 0.4),
      ),
    );
  }

  Widget _item(BuildContext context, EcoModule module) {
    final active = EcoModule.values.indexOf(module) == currentIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: active ? AppColors.sideActive : Colors.transparent,
          borderRadius: BorderRadius.circular(AppTheme.radiusNav),
          boxShadow: active ? AppTheme.activeNavShadow : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppTheme.radiusNav),
            onTap: () => _open(context, module),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              child: Row(
                children: [
                  ModuleIcon(module, size: 26, onBrand: active),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      module.label,
                      style: AppTheme.body(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                        color: active ? Colors.white : AppColors.ink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _open(BuildContext context, EcoModule module) {
    final index = EcoModule.values.indexOf(module);
    final navigator = Navigator.of(context);
    navigator.pop();
    if (index == currentIndex) return;
    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainNavigationScreen(initialIndex: index),
      ),
    );
  }
}

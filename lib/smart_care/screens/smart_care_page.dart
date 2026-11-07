import 'package:flutter/material.dart';
import 'package:ecopatch_app/theme/app_colors.dart';

class SmartCarePage extends StatelessWidget {
  const SmartCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Smart Care'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.brandMint.withOpacity(0.35),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.water_drop_outlined,
                  size: 64,
                  color: AppColors.brandGreen,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Smart Care',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'PIC: Salwa Alifia Putri',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.inkMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: AppColors.border),
                ),
                color: AppColors.cardSurface,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Jadwal perawatan tanaman dan prakiraan cuaca Open-Meteo akan diimplementasikan di sini.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: AppColors.ink),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

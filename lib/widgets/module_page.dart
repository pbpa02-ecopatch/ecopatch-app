import 'package:flutter/material.dart';

import 'package:ecopatch_app/theme/app_colors.dart';
import 'package:ecopatch_app/theme/app_icons.dart';
import 'package:ecopatch_app/theme/app_theme.dart';
import 'package:ecopatch_app/widgets/module_icon.dart';

/// Isi halaman satu modul.
///
/// Untuk sementara halaman ini menjelaskan modulnya dan endpoint yang dipakai,
/// mengikuti gaya kartu web: putih, bergaris `--border`, sudut 28 px.
class ModulePage extends StatelessWidget {
  const ModulePage({super.key, required this.module});

  final EcoModule module;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: AppTheme.card(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64,
                height: 64,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.brand300,
                  shape: BoxShape.circle,
                ),
                child: ModuleIcon(module, size: 34),
              ),
              const SizedBox(height: 18),
              Text(module.heading, style: AppTheme.heading(fontSize: 26)),
              const SizedBox(height: 10),
              Text(
                module.description,
                style: AppTheme.body(color: AppColors.inkMuted),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: AppTheme.card(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ENDPOINT DJANGO REST FRAMEWORK',
                style: AppTheme.body(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.inkMuted,
                ).copyWith(letterSpacing: 0.6),
              ),
              const SizedBox(height: 12),
              ...module.endpoints.map(
                (ep) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.api,
                        size: 16,
                        color: AppColors.brand600,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          ep,
                          style: AppTheme.body(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Endpoint di atas siap dihubungkan dengan aplikasi mobile melalui Django REST Framework.',
                style: AppTheme.body(fontSize: 12.5, color: AppColors.inkMuted),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

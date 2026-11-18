import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecopatch_app/theme/app_icons.dart';

/// Ikon modul dari repo web.
///
/// [onBrand] memakai versi garis putih dengan sentuhan krem, untuk diletakkan di
/// atas latar hijau (pil menu samping yang sedang dibuka).
class ModuleIcon extends StatelessWidget {
  const ModuleIcon(this.module, {super.key, this.size = 24, this.onBrand = false});

  final EcoModule module;
  final double size;
  final bool onBrand;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      onBrand ? module.iconOnBrandAsset : module.iconAsset,
      width: size,
      height: size,
      semanticsLabel: module.label,
    );
  }
}

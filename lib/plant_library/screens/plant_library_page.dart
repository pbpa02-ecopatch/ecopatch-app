import 'package:flutter/material.dart';

import 'package:ecopatch_app/theme/app_icons.dart';
import 'package:ecopatch_app/widgets/module_page.dart';

class PlantLibraryPage extends StatelessWidget {
  const PlantLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePage(module: EcoModule.plantLibrary);
  }
}

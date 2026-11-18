import 'package:flutter/material.dart';

import 'package:ecopatch_app/theme/app_icons.dart';
import 'package:ecopatch_app/widgets/module_page.dart';

class GardenJournalPage extends StatelessWidget {
  const GardenJournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModulePage(module: EcoModule.gardenJournal);
  }
}

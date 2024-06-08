import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskwarrior/app/modules/home/controllers/home_controller.dart';
import 'package:taskwarrior/app/modules/settings/views/settings_page_on_task_start_list_tile.dart';
import 'package:taskwarrior/app/modules/splash/controllers/splash_controller.dart';
import 'package:taskwarrior/app/utils/constants/taskwarrior_fonts.dart';
import 'package:taskwarrior/app/utils/constants/utilites.dart';

import '../controllers/settings_controller.dart';

import 'package:taskwarrior/app/utils/constants/palette.dart';
import 'package:taskwarrior/app/utils/constants/taskwarrior_colors.dart';
import 'package:taskwarrior/app/utils/theme/app_settings.dart';

import 'package:flutter/material.dart';

class SettingsPageOnTaskCreateListTile extends StatelessWidget {
  final SettingsController controller;
  const SettingsPageOnTaskCreateListTile({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Sync on Task Create',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: TaskWarriorFonts.fontSizeMedium,
          color: AppSettings.isDarkMode
              ? TaskWarriorColors.white
              : TaskWarriorColors.black,
        ),
      ),
      subtitle: Text(
        'Enable automatic syncing when creating a new task',
        style: GoogleFonts.poppins(
          color: TaskWarriorColors.grey,
          fontSize: TaskWarriorFonts.fontSizeSmall,
        ),
      ),
      trailing: Obx(
        () => Switch(
          value: controller.isSyncOnTaskCreateActivel.value,
          onChanged: (bool value) async {
            controller.isSyncOnTaskCreateActivel.value = value;
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setBool('sync-OnTaskCreate', value);
          },
        ),
      ),
    );
  }
}

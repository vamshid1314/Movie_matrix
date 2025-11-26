import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_matrix/widgets/app%20bar/app_bar.dart';

import '../../controllers/theme_controller.dart';

class AllMoviesScreen extends StatelessWidget {
  const AllMoviesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Get.put(ThemeController()).themeData;

    return Scaffold(
      appBar: CustomAppBar(theme: theme),
      body: Center(child: Text("All Movies Screen")),
    );
  }
}

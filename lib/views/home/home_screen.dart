import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_matrix/core/themes/app_spacing.dart';
import 'package:movie_matrix/widgets/app%20bar/app_bar.dart';

import '../../controllers/theme_controller.dart';
import '../../widgets/common/movie_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Get.put(ThemeController()).themeData;

    return Scaffold(
      appBar: CustomAppBar(theme: theme),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieCard(
                theme: theme,
                sectionHeader: "Trending",
            ),
            SizedBox(height: AppSpacing.lg),
            MovieCard(
                theme: theme,
                sectionHeader: "Top Rated"
            ),
            SizedBox(height: AppSpacing.lg),
            MovieCard(
                theme: theme,
                sectionHeader: "For You"
            ),
            SizedBox(height: AppSpacing.lg),
          ],
        ),
      )

    );
  }
}

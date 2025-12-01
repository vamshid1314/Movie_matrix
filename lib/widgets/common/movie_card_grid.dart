import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_matrix/views/home/all_movies_screen.dart';
import 'package:movie_matrix/widgets/common/build_movie_card.dart';
import '../../../core/themes/app_spacing.dart';

class MovieCardGrid extends StatelessWidget {
  final ThemeData theme;
  final String sectionHeader;
  final int itemCount;

  const MovieCardGrid({
    super.key,
    required this.theme,
    required this.itemCount,
    required this.sectionHeader,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.md),

            // --- Title Row ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sectionHeader,
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            // --- Movies List ---
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85),
              children: List.generate(itemCount, (index) {
                final movieData = {
                  'imgUrl': "https://picsum.photos/200/300",
                  'title': 'Pushpa 2',
                  'rating': (5.0 + index % 5).toDouble(),
                };

                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: BuildMovieCard(
                    theme: theme,
                    imgUrl: movieData['imgUrl'] as String,
                    title: movieData['title'] as String,
                    rating: movieData['rating'] as double,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

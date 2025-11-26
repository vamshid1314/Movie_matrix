import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_matrix/views/home/all_movies_screen.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_spacing.dart';

class MovieCard extends StatelessWidget {
  final ThemeData theme;
  final String sectionHeader;

  const MovieCard({
    super.key,
    required this.theme,
    required this.sectionHeader,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
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
              GestureDetector(
                onTap: () {
                  Get.to(AllMoviesScreen());
                },
                child: Text(
                  "see all",
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: AppColors.ratingLow),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.md),

          // --- Movies List ---
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 11, // 10 cards + 1 arrow icon at the end
              itemBuilder: (context, index) {
                if (index < 10) {
                  final movieData = {
                    'imgUrl':
                    'https://via.placeholder.com/150x220.png?text=Movie+${index +
                        1}',
                    'title': 'Movie ${index + 1}',
                    'rating': (5.0 + index % 5).toDouble(),
                  };

                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _buildMovieCard(
                      theme: theme,
                      imgUrl: movieData['imgUrl'] as String,
                      title: movieData['title'] as String,
                      rating: movieData['rating'] as double,
                    ),
                  );
                }

                // --- Final Arrow Button ---
                return GestureDetector(
                  onTap: () {
                    Get.to(AllMoviesScreen());
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCard(
      {ThemeData? theme, String? imgUrl, String? title, double? rating}) {
    return SizedBox(
      width: 115, // Fixed width for consistent sizing
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Movie Poster Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imgUrl!,
                  width: double.infinity,
                  height: 120,
                  // Reduced height to fit content
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Container(
                        width: double.infinity,
                        height: 120,
                        color: Colors.grey[300],
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                  errorWidget: (context, url, error) =>
                      Container(
                        width: double.infinity,
                        height: 120,
                        color: Colors.grey[300],
                        child: const Icon(Icons.error, color: Colors.grey),
                      ),
                ),
              ),

              SizedBox(height: AppSpacing.md),

              Text(
                title ?? "No Title",
                style: theme?.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: AppSpacing.sm),

              // Rating Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: theme?.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
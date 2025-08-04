import 'package:ai_fit_coach/features/trending_screen/trending_details/bloc/trending_details_bloc.dart';
import 'package:ai_fit_coach/ui/widgets/custom_trending_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingSubScreen extends StatefulWidget {
  const TrendingSubScreen({
    super.key,
    required this.id,
    required this.recommendationCategory,
  });

  final String id;
  final RecommendationCategory recommendationCategory;

  @override
  State<TrendingSubScreen> createState() => _TrendingSubScreenState();
}

class _TrendingSubScreenState extends State<TrendingSubScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TrendingDetailsBloc>().add(
          LoadingTrendingDetails(
            id: widget.id,
            recommendationCategory: widget.recommendationCategory,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<TrendingDetailsBloc, TrendingDetailsState>(
        builder: (context, state) {
          if (state is TrendingDetailsLoaded) {
            final item = state.recommendationItem;

            return CustomScrollView(
              slivers: [
                // Картинка зверху без заокруглень
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: false,
                  expandedHeight: MediaQuery.of(context).size.height * 0.34,
                  flexibleSpace: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/challenges/exercise/2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Контейнер з інформацією з заокругленими верхніми кутами і "наїжджає" на картинку
                SliverToBoxAdapter(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -32), // зсуваємо вгору
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 32, left: 16, right: 16, bottom: 20),
                            color: theme.colorScheme.tertiary,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item.title,
                                  style: theme.textTheme.displaySmall?.copyWith(
                                    fontSize: 24,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                if (item.subtitle != null)
                                  Text(
                                    item.subtitle!,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: 16,
                                      color: theme.colorScheme.onSurface,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                const SizedBox(height: 8),
                                if (item.description != null)
                                  Text(
                                    item.description!,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: 16,
                                      color: theme.colorScheme.onSurface,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.favorite_border_outlined),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.width * 0.12,
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: theme.colorScheme.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Start',
                                          style: theme.textTheme.displaySmall
                                              ?.copyWith(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Заголовок Recommendations
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                    child: Text(
                      'Recommendations',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ),

                // Список карток рекомендацій
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Column(
                          children: [
                            if (index != 0) ...[
                              const Divider(thickness: 0.5),
                              const SizedBox(height: 8),
                            ],
                            CustomTrendingCard(
                              title: item.recommendationItems[index],
                            ),
                          ],
                        );
                      },
                      childCount: item.recommendationItems.length,
                    ),
                  ),
                ),

                // Відступ знизу
                const SliverToBoxAdapter(
                  child: SizedBox(height: 32),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}

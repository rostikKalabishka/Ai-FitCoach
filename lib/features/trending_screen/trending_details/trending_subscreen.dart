import 'package:ai_fit_coach/features/trending_screen/trending_details/bloc/trending_details_bloc.dart';
<<<<<<< HEAD
=======
import 'package:ai_fit_coach/features/trending_screen/trending_screen/bloc/list_bloc.dart';
>>>>>>> a52f4f2 (methods, conn data to trending recommendations)
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
    context.read<TrendingDetailsBloc>().add(LoadingTrendingDetails(
        id: widget.id, recommendationCategory: widget.recommendationCategory));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocBuilder<TrendingDetailsBloc, TrendingDetailsState>(
        builder: (context, state) {
          if (state is TrendingDetailsLoaded) {
            final item = state.recommendationItem;
<<<<<<< HEAD
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.38,
                        width: double.infinity,
=======
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
>>>>>>> a52f4f2 (methods, conn data to trending recommendations)
                        child: Image(
                          image: CachedNetworkImageProvider(item.imageUrl),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/challenges/exercise/2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 40),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: theme
                                .bottomNavigationBarTheme.unselectedItemColor,
                            size: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 310),
                        child: Container(
<<<<<<< HEAD
                          height: MediaQuery.of(context).size.height * 0.25,
=======
                          height: 220,
>>>>>>> a52f4f2 (methods, conn data to trending recommendations)
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.tertiary,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        item.title,
                                        style: theme.textTheme.displaySmall
                                            ?.copyWith(
                                          fontSize: 24,
                                          color: theme.colorScheme.onSurface,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 4, top: 4),
                                      child: Text(
                                        item.subtitle ?? '',
                                        style: theme.textTheme.displaySmall
                                            ?.copyWith(
                                          fontSize: 16,
                                          color: theme.colorScheme.onSurface,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
<<<<<<< HEAD
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 4, top: 4),
                                      child: Text(
                                        item.description ?? '',
                                        style: theme.textTheme.displaySmall
                                            ?.copyWith(
                                          fontSize: 16,
                                          color: theme.colorScheme.onSurface,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
=======
                                    SizedBox(
                                      height: 16,
>>>>>>> a52f4f2 (methods, conn data to trending recommendations)
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.favorite_border_outlined),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            theme.colorScheme.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
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
                    ],
                  ),
<<<<<<< HEAD
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Text(
                      'Recommendations',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CustomTrendingCard(
                          title: item.recommendationItems[index],
                        );
                      },
                      childCount: item.recommendationItems.length,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
=======
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recommendations',
                            style: theme.textTheme.labelSmall,
                          ),
                          const SizedBox(height: 24),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: item.recommendationItems.length,
                            itemBuilder: (context, index) {
                              return CustomTrendingCard(title: item.recommendationItems[index]);
                            },
                          ),
                        ],
                      )),
                ],
              ),
            );
          } else {
            return Center(
>>>>>>> a52f4f2 (methods, conn data to trending recommendations)
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}

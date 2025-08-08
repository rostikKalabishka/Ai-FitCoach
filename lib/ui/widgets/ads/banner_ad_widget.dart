import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ai_fit_coach/blocs/ads_bloc/ads_bloc.dart';

class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        if (state is AdsLoadedState && state.bannerAd != null) {
          return Container(
            alignment: Alignment.center,
            width: state.bannerAd!.size.width.toDouble(),
            height: state.bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: state.bannerAd!),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

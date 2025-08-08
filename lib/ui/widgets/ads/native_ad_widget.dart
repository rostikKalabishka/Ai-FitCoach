import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ai_fit_coach/blocs/ads_bloc/ads_bloc.dart';

class NativeAdWidget extends StatelessWidget {
  const NativeAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        if (state is AdsLoadedState && state.nativeAd != null) {
          return Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey[200],
            child: AdWidget(ad: state.nativeAd!),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

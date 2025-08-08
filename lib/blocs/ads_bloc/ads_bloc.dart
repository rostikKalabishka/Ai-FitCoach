import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:ai_fit_coach/repositories/ads_repository/ads.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final AbstractAdsRepository _adsRepository;

  AdsBloc({required AbstractAdsRepository adsRepository})
      : _adsRepository = adsRepository,
        super(AdsInitialState()) {
    on<LoadBannerAdEvent>(_onLoadBannerAd);
    on<SetBannerEvent>((event, emit) {
      emit(AdLoadedState(ad: event.bannerAd));
    });
  }

  void _onLoadBannerAd(LoadBannerAdEvent event, Emitter<AdsState> emit) {
    BannerAd(
      adUnitId: _adsRepository.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          add(SetBannerEvent(bannerAd: ad as BannerAd));
          log('Banner ad loaded successfully.');
        },
        onAdFailedToLoad: (ad, error) {
          log('Failed to load a banner ad: ${error.message}, code: ${error.code}');
          ad.dispose();
          emit(AdFailedState(errorMessage: error.message));
        },
      ),
    ).load();
  }

  @override
  Future<void> close() {
    final currentState = state;
    if (currentState is AdLoadedState) {
      currentState.ad.dispose();
    }
    return super.close();
  }
}

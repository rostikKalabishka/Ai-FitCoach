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
        super(const AdsInitialState()) {
    on<LoadBannerAdEvent>(_onLoadBannerAd);
    on<LoadInterstitialAdEvent>(_onLoadInterstitialAd);
    on<LoadNativeAdEvent>(_onLoadNativeAd);

    on<SetBannerAdEvent>(_onSetBannerAd);
    on<SetInterstitialAdEvent>(_onSetInterstitialAd);
    on<SetNativeAdEvent>(_onSetNativeAd);

    on<ShowInterstitialAdEvent>(_onShowInterstitialAd);
  }

  void _onLoadBannerAd(LoadBannerAdEvent event, Emitter<AdsState> emit) {
    BannerAd(
      adUnitId: _adsRepository.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          add(SetBannerAdEvent(bannerAd: ad as BannerAd));
          log('Banner ad loaded successfully.');
        },
        onAdFailedToLoad: (ad, error) {
          log('Failed to load a banner ad: ${error.message}, code: ${error.code}');
          ad.dispose();
          if (state is AdsLoadedState) {
            emit((state as AdsLoadedState).copyWith(bannerAd: null));
          }
        },
      ),
    ).load();
  }

  void _onLoadInterstitialAd(
      LoadInterstitialAdEvent event, Emitter<AdsState> emit) {
    InterstitialAd.load(
      adUnitId: _adsRepository.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          add(SetInterstitialAdEvent(interstitialAd: ad));
          log('Interstitial ad loaded successfully.');
        },
        onAdFailedToLoad: (error) {
          log('Failed to load interstitial ad: ${error.message}');
          if (state is AdsLoadedState) {
            emit((state as AdsLoadedState).copyWith(interstitialAd: null));
          }
        },
      ),
    );
  }

  void _onLoadNativeAd(LoadNativeAdEvent event, Emitter<AdsState> emit) {
    NativeAd(
      adUnitId: _adsRepository.nativeAdUnitId,
      factoryId:
          'listTile', // Використовуйте Factory ID, який ви налаштували у Firebase
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          add(SetNativeAdEvent(nativeAd: ad as NativeAd));
          log('Native ad loaded successfully.');
        },
        onAdFailedToLoad: (ad, error) {
          log('Failed to load a native ad: ${error.message}, code: ${error.code}');
          ad.dispose();
          if (state is AdsLoadedState) {
            emit((state as AdsLoadedState).copyWith(nativeAd: null));
          }
        },
      ),
    ).load();
  }

  void _onSetBannerAd(SetBannerAdEvent event, Emitter<AdsState> emit) {
    if (state is AdsLoadedState) {
      emit((state as AdsLoadedState).copyWith(bannerAd: event.bannerAd));
    } else {
      emit(AdsLoadedState(bannerAd: event.bannerAd));
    }
  }

  void _onSetInterstitialAd(
      SetInterstitialAdEvent event, Emitter<AdsState> emit) {
    if (state is AdsLoadedState) {
      emit((state as AdsLoadedState)
          .copyWith(interstitialAd: event.interstitialAd));
    } else {
      emit(AdsLoadedState(interstitialAd: event.interstitialAd));
    }
  }

  void _onSetNativeAd(SetNativeAdEvent event, Emitter<AdsState> emit) {
    if (state is AdsLoadedState) {
      emit((state as AdsLoadedState).copyWith(nativeAd: event.nativeAd));
    } else {
      emit(AdsLoadedState(nativeAd: event.nativeAd));
    }
  }

  void _onShowInterstitialAd(
      ShowInterstitialAdEvent event, Emitter<AdsState> emit) {
    if (state is AdsLoadedState &&
        (state as AdsLoadedState).interstitialAd != null) {
      (state as AdsLoadedState).interstitialAd!.show();
      // Тут ми можемо додати логіку для повторного завантаження, якщо реклама була показана
      // Це гарантує, що наступного разу реклама буде готова
      add(LoadInterstitialAdEvent());
    } else {
      log('Interstitial ad is not loaded.');
      // Якщо реклама не була завантажена, ми завантажуємо її і одразу показуємо
      add(LoadInterstitialAdEvent());
      // Зауважте: це не гарантує, що реклама одразу покажеться
    }
  }

  @override
  Future<void> close() {
    final currentState = state;
    if (currentState is AdsLoadedState) {
      currentState.bannerAd?.dispose();
      currentState.interstitialAd?.dispose();
      currentState.nativeAd?.dispose();
    }
    return super.close();
  }
}

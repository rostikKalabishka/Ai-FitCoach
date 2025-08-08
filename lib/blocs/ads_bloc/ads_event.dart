part of 'ads_bloc.dart';

abstract class AdsEvent extends Equatable {
  const AdsEvent();

  @override
  List<Object> get props => [];
}

class LoadBannerAdEvent extends AdsEvent {}

class LoadInterstitialAdEvent extends AdsEvent {}

class LoadNativeAdEvent extends AdsEvent {}

class SetBannerAdEvent extends AdsEvent {
  final BannerAd bannerAd;
  const SetBannerAdEvent({required this.bannerAd});

  @override
  List<Object> get props => [bannerAd];
}

class SetInterstitialAdEvent extends AdsEvent {
  final InterstitialAd interstitialAd;
  const SetInterstitialAdEvent({required this.interstitialAd});

  @override
  List<Object> get props => [interstitialAd];
}

class SetNativeAdEvent extends AdsEvent {
  final NativeAd nativeAd;
  const SetNativeAdEvent({required this.nativeAd});

  @override
  List<Object> get props => [nativeAd];
}

class ShowInterstitialAdEvent extends AdsEvent {}

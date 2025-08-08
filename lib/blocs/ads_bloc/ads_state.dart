part of 'ads_bloc.dart';

abstract class AdsState extends Equatable {
  const AdsState();

  @override
  List<Object> get props => [];
}

class AdsInitialState extends AdsState {
  const AdsInitialState();
}

class AdsLoadedState extends AdsState {
  final BannerAd? bannerAd;
  final InterstitialAd? interstitialAd;
  final NativeAd? nativeAd;

  const AdsLoadedState({
    this.bannerAd,
    this.interstitialAd,
    this.nativeAd,
  });

  AdsLoadedState copyWith({
    BannerAd? bannerAd,
    InterstitialAd? interstitialAd,
    NativeAd? nativeAd,
  }) {
    return AdsLoadedState(
      bannerAd: bannerAd ?? this.bannerAd,
      interstitialAd: interstitialAd ?? this.interstitialAd,
      nativeAd: nativeAd ?? this.nativeAd,
    );
  }

  @override
  List<Object> get props =>
      [bannerAd ?? '', interstitialAd ?? '', nativeAd ?? ''];
}

class AdFailedState extends AdsState {
  final String errorMessage;
  const AdFailedState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

part of 'ads_bloc.dart';

abstract class AdsEvent extends Equatable {
  const AdsEvent();

  @override
  List<Object> get props => [];
}

class LoadBannerAdEvent extends AdsEvent {}

class SetBannerEvent extends AdsEvent {
  final BannerAd bannerAd;

  const SetBannerEvent({required this.bannerAd});

  @override
  List<Object> get props => [bannerAd];
}

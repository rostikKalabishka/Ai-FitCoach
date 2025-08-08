part of 'ads_bloc.dart';

abstract class AdsState extends Equatable {
  const AdsState();

  @override
  List<Object> get props => [];
}

class AdsInitialState extends AdsState {}

class AdLoadedState extends AdsState {
  final BannerAd ad;
  const AdLoadedState({required this.ad});

  AdLoadedState copyWith({
    BannerAd? ad,
  }) {
    return AdLoadedState(
      ad: ad ?? this.ad,
    );
  }

  @override
  List<Object> get props => [ad];
}

class AdFailedState extends AdsState {
  final String errorMessage;
  const AdFailedState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

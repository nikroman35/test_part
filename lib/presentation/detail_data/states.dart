part of 'bloc.dart';

class DetailPlaceState {
  final PlaceScreenModel? data;
  final bool isLoading;

  DetailPlaceState({
    required this.data,
    required this.isLoading,
  });

  DetailPlaceState copyWith({
    PlaceScreenModel? data,
    bool? isLoading,
  }) {
    return DetailPlaceState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
part of 'bloc.dart';

@freezed
sealed class DetailPlaceEvent with _$DetailPlaceEvent {
  const factory DetailPlaceEvent.init() = _InitEvent;
  const factory DetailPlaceEvent.openUrl(String url) = _OpenUrlEvent;
}

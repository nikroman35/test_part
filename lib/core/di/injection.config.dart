// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/network/api/place.dart' as _i4;
import '../../data/repository/place_repository.dart' as _i5;
import '../../domain/usecases/places_usecase.dart' as _i6;
import '../../presentation/detail_data/bloc.dart' as _i7;
import 'injection.dart' as _i8;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.factory<_i4.PlaceService>(() => _i4.PlaceServiceImpl(gh<_i3.Dio>()));
  gh.factory<_i5.PlacesRepository>(
      () => _i5.PlacesRepositoryImpl(gh<_i4.PlaceService>()));
  gh.factory<_i6.PlaceUseCase>(
      () => _i6.PlaceUseCaseImpl(gh<_i5.PlacesRepository>()));
  gh.factoryParam<_i7.DetailPlaceBloc, int, dynamic>((
    placeId,
    _,
  ) =>
      _i7.DetailPlaceBloc(
        gh<_i6.PlaceUseCase>(),
        placeId,
      ));
  return getIt;
}

class _$RegisterModule extends _i8.RegisterModule {}

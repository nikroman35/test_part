import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


import '../../data/network/interceptor.dart';
import '../../data/network/service.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)

FutureOr<GetIt> configureInjection() => init(getIt);

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => NetworkClient(_appInterceptor).create();

  @lazySingleton
  AppInterceptor get _appInterceptor {
    return AppInterceptor();
  }
}

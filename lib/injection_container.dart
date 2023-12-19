// ignore_for_file: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/quran/data/data_sources/local/app_database.dart';
import 'features/quran/data/data_sources/network/quran_api_service.dart';
import 'features/quran/data/repositories/quran_repository_impl.dart';
import 'features/quran/domain/repositories/quran_repository.dart';
import 'features/quran/domain/usecases/get_all_surah_usecase.dart';
import 'features/quran/domain/usecases/get_surah_detail_usecase.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // DB SERVICE
  final database =
      await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  serviceLocator.registerSingleton<AppDatabase>(database);

  // DIO SERVICE
  serviceLocator.registerSingleton<Dio>(Dio());

  // QURAN SERVICE
  serviceLocator.registerSingleton<QuranApiService>(
      QuranApiService(serviceLocator<Dio>()));
  serviceLocator.registerSingleton<QuranRepository>(QuranRepositoryImpl(
    serviceLocator<QuranApiService>(),
    serviceLocator<AppDatabase>(),
  ));

  // USE CASE
  // QURAN
  serviceLocator.registerSingleton<GetAllSurahUseCase>(
      GetAllSurahUseCase(serviceLocator<QuranRepository>()));
  serviceLocator.registerSingleton<GetSurahDetailUseCase>(
      GetSurahDetailUseCase(serviceLocator<QuranRepository>()));
}

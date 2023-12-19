import 'package:retrofit/retrofit.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

import '../../../../../core/constants/constants.dart';
import '../../models/surah_model.dart';

part 'quran_api_service.g.dart';

@RestApi(baseUrl: quranIdAPIBaseUrl)
abstract class QuranApiService {
  factory QuranApiService(Dio dio) = _QuranApiService;

  @GET('/surat')
  Future<HttpResponse<List<SurahModel>>> getAllSurah();

  @GET('/surat/{id}')
  Future<HttpResponse<SurahModel>> getSurahDetail(@Path() String id);

  @GET('/tafsir/{id}')
  Future<HttpResponse<SurahModel>> getInterpretationDetail(@Path() String id);
}

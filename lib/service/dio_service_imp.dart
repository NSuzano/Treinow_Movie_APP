import 'package:dio/dio.dart';
import 'dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(BaseOptions(baseUrl: 'http://api.themoviedb.org/4/', headers: {
      'Content-Type': 'application/json;charset=utf-8',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Mjg2YjI5ODFiZjNkMzAwNjk1NmQzNjhmZjA3YThjYyIsInN1YiI6IjYzZjYxZTYzOTkyZmU2MDBiYzNkMTc5MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6HVSXwNb0nuEXG1aDcEoNAacY-eJ4EpgeruxH2kHYbU',
    }));
  }
}

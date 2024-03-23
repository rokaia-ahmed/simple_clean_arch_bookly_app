import 'package:dio/dio.dart';

abstract class Failure{
  final String message ;

  Failure(this.message);
}
class ServerFailure extends Failure{
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException e){
    switch(e.type) {
      case DioExceptionType.connectionTimeout:
       return ServerFailure('connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with api server');
      case DioExceptionType.badResponse:
        return  ServerFailure.fromResponse(e.response!.statusCode! ,e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('request to api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('no internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps There was an error, please try again');
    }
  }
  /////////////////////////////////////////////////////////////////
  factory ServerFailure.fromResponse(int statusCode ,dynamic response ){
     if(statusCode ==404){
       return ServerFailure('Your request was not found, please try later');
     }else if(statusCode == 500){
       return ServerFailure('there is a problem  with server, please try later');
     }else if(statusCode == 400 ||statusCode == 401 ||statusCode == 403){
       return ServerFailure(response['error']['message']);
     }else{
       return ServerFailure('there was an error, please try again');
     }

  }
}

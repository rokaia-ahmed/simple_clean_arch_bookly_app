import 'package:get_it/get_it.dart';
import '../../Features/home/Data/data_source/local_data_source.dart';
import '../../Features/home/Data/data_source/remote_data_source.dart';
import '../../Features/home/Data/repos/home_repo_impl.dart';
import 'api_service.dart';

class GetItService{
 static late final GetIt getIt ;

 static final gitItHomeRepo =  getIt.registerSingleton<HomeRepoImpl>( HomeRepoImpl(
  homeRemoteDataSource:
  HomeRemoteDataSourceImpel(ApiService()),
  homeLocalDataSource: HomeLocalDataSourceImpl()));

}
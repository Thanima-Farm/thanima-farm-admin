import 'package:thanima_admin/core/config/app_config.dart';
import 'package:thanima_admin/core/config/constants.dart';
import 'package:thanima_admin/core/services/api_client.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  locator.registerLazySingleton(() => AppConfig());
  // // Register the HTTP client
  // locator.registerLazySingleton<http.Client>(() => http.Client());
  //
  // // Register the remote data source
  // locator.registerLazySingleton<JokeRemoteDataSource>(
  //     () => JokeRemoteDataSourceImpl(client: sl<http.Client>()));
  //
  // // Register the repository
  // locator.registerLazySingleton<JokeRepository>(
  //     () => JokeRepositoryImpl(remoteDataSource: sl<JokeRemoteDataSource>()));
  //
  // // Register use cases
  // locator.registerLazySingleton(() => GetRandomJoke(sl<JokeRepository>()));
  // locator.registerLazySingleton(() => SearchJokes(sl<JokeRepository>()));

  // locator.registerSingleton<Dio.Client>()
//   final dioInstance = DioClient().dio;
//
// // Cart Module Service
//   final cartService = CartServiceImpl(dioInstance);
//
// // Payment Module Service
//   final paymentService = PaymentServiceImpl(dioInstance);

  // locator.registerLazySingleton(() => AppConfig());

  // locator.registerLazySingleton(() => AppConfig());
  // locator.registerLazySingleton(() => AppConfig());

  locator.registerSingleton<ApiClient>(ApiClient(baseUrl: Constants.baseURL));
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:mobile_application_project/core/network/api_service.dart';
import 'package:mobile_application_project/core/network/local_network.dart';
import 'package:mobile_application_project/features/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import 'package:mobile_application_project/features/auth/data/data_source/remote_datasource/auth_remote_data_source.dart';
import 'package:mobile_application_project/features/auth/data/repository/auth_local_repository.dart';
import 'package:mobile_application_project/features/auth/data/repository/auth_remote_repository.dart';
import 'package:mobile_application_project/features/auth/domain/use_case/login_usecase.dart';
import 'package:mobile_application_project/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:mobile_application_project/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:mobile_application_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:mobile_application_project/features/auth/presentation/view_model/register/register_bloc.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_cubit.dart';
import 'package:mobile_application_project/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();

  await _initSplashScreenDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() {
// =========================== Data Source ===========================

  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(dio: getIt<Dio>()),
  );

  // =========================== Repository ===========================

  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // =========================== Usecases ===========================

  getIt.registerLazySingleton<RegisterUserUseCase>(
    () => RegisterUserUseCase(userRepository: getIt<AuthRemoteRepository>()),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUserUseCase: getIt(),
      uploadImageUsecase: getIt(),
      verifyBloc: null,
    ),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  // =========================== Token Shared Preferences ===========================
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  // =========================== Usecases ===========================
  getIt.registerLazySingleton<LoginUserUseCase>(
    () => LoginUserUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

//   getIt.registerLazySingleton<RegisterUserUseCase>(
//   () => RegisterUserUseCase(userRepository: getIt<AuthRemoteRepository>()),
// );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUserUseCase: getIt<LoginUserUseCase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<LoginBloc>()),
  );
}

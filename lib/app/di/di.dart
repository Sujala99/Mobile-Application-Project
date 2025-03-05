import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application_project/features/booking/data/data_source/remote_data_source/booking_remote_data_source.dart';
import 'package:mobile_application_project/features/booking/data/repository/booking_remote_repository/booking_remote_repository.dart';
import 'package:mobile_application_project/features/booking/domain/use_case/create_booking_usecase.dart';
import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_bloc.dart';
import 'package:mobile_application_project/features/doctor/data/data_source/local_datasource/doctor_local_data_source.dart';
import 'package:mobile_application_project/features/doctor/data/data_source/remote_datasource/doctor_remote_datasource.dart';
import 'package:mobile_application_project/features/doctor/data/repository/doctor_local_repository.dart';
import 'package:mobile_application_project/features/doctor/data/repository/doctor_remote_repository.dart';
import 'package:mobile_application_project/features/doctor/domain/repository/doctor_repository.dart';
import 'package:mobile_application_project/features/doctor/domain/use_case/get_all_doctor_usecase.dart';
import 'package:mobile_application_project/features/doctor/domain/use_case/get_doctor_details_usecase.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/api_service.dart';
import '../../core/network/local_network.dart';
import '../../features/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import '../../features/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import '../../features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import '../../features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import '../../features/auth/domain/use_case/login_usecase.dart';
import '../../features/auth/domain/use_case/register_user_usecase.dart';
import '../../features/auth/domain/use_case/upload_image_usecase.dart';
import '../../features/auth/presentation/view_model/login/login_bloc.dart';
import '../../features/auth/presentation/view_model/signup/register_bloc.dart';
import '../../features/home/presentation/view_model/home_cubit.dart';
import '../../features/splash/presentation/view_model/splash_cubit.dart';
import '../shared_prefs/token_shared_prefs.dart';

final getIt = GetIt.instance;

/// *Initialize All Dependencies*
Future<void> initDependencies() async {
  await _initSharedPreferences();
  _initHiveService();
  _initApiService();

  // _initDependencies();
  _initAuthDependencies();
  _initHomeDependencies();
  _initDoctorDependencies();
  _initBookingDependencies();
  _initLoginDependencies();
  _initSplashScreenDependencies();
  // _initOnboardingScreenDependencies();
}

/// *Initialize Shared Preferences*
Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<TokenSharedPrefs>(
      () => TokenSharedPrefs(sharedPreferences));
}

/// -------------------------- *Initialize API Service*--------------------------
void _initApiService() {
  getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);
}

/// *Initialize Hive Service for Local Storage*
void _initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

// -------------- Authentication Dependencies-----------------
void _initAuthDependencies() {
  getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(getIt<HiveService>()));
  getIt.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasource(getIt<Dio>()));

  getIt.registerLazySingleton<AuthLocalRepository>(
      () => AuthLocalRepository(getIt<AuthLocalDataSource>()));
  getIt.registerLazySingleton<AuthRemoteRepository>(
      () => AuthRemoteRepository(getIt<AuthRemoteDatasource>()));

  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(getIt<AuthRemoteRepository>()));

  getIt.registerLazySingleton<UploadImageUsecase>(
      () => UploadImageUsecase(getIt<AuthRemoteRepository>()));

  getIt.registerFactory<RegisterBloc>(() => RegisterBloc(
        registerUseCase: getIt(),
        uploadImageUsecase: getIt(),
        verifyBloc: null,
      ));
}

/// --------------------------*Initialize Home Dependencies*--------------------------
void _initHomeDependencies() {
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}

/// *Initialize Login Dependencies*
void _initLoginDependencies() {
  getIt.registerLazySingleton<LoginUseCase>(() =>
      LoginUseCase(getIt<TokenSharedPrefs>(), getIt<AuthRemoteRepository>()));

  getIt.registerFactory<LoginBloc>(() => LoginBloc(
        registerBloc: getIt<RegisterBloc>(),
        homeCubit: getIt<HomeCubit>(),
        loginUseCase: getIt<LoginUseCase>(),
      ));
}

/// --------------------------*Initialize Doctor Dependencies*--------------------------

// =========================== Data Source ===========================
void _initDoctorDependencies() {
  getIt.registerFactory<DoctorLocalDataSource>(
      () => DoctorLocalDataSource(hiveService: getIt<HiveService>()));

  getIt.registerFactory<DoctorRemoteDatasource>(
      () => DoctorRemoteDatasource(getIt<Dio>()));

  // =========================== Repository ===========================

  getIt.registerLazySingleton<DoctorLocalRepository>(() =>
      DoctorLocalRepository(
          doctorLocalDataSource: getIt<DoctorLocalDataSource>()));

  getIt.registerLazySingleton<DoctorRemoteRepository>(
    () => DoctorRemoteRepository(
      getIt<DoctorRemoteDatasource>(),
    ),
  );

  // ===========================Usecases===========================
  getIt.registerLazySingleton<GetAllDoctorUsecase>(
    () => GetAllDoctorUsecase(
      doctorRepository: getIt<DoctorRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetDoctorDetailUseCase>(
    () => GetDoctorDetailUseCase(
      doctorRepository: getIt<DoctorRemoteRepository>(),
    ),
  );

  // ===========================Bloc===========================

  getIt.registerFactory<DoctorBloc>(
    () => DoctorBloc(
      getAllDoctorUsecase: getIt<GetAllDoctorUsecase>(),
      getDoctorDetailUsecase: getIt<GetDoctorDetailUseCase>(),
      bookingBloc: getIt<BookingBloc>(),
    ),
  );
}

/// --------------------------*Initialize Booking Dependencies*--------------------------

// =========================== Data Source ===========================
void _initBookingDependencies() {
  getIt.registerFactory<BookingRemoteDataSource>(
      () => BookingRemoteDataSource(getIt<Dio>(),
                  getIt<TokenSharedPrefs>(),  // ✅ Second argument (Token storage)

      ));

  // =========================== Repository ===========================

  getIt.registerLazySingleton<BookingRemoteRepository>(
    () => BookingRemoteRepository(
      getIt<BookingRemoteDataSource>(),
    ),
  );

  // ===========================Usecases===========================
  getIt.registerLazySingleton<CreateBookingUsecase>(
    () => CreateBookingUsecase(
      bookingRepository: getIt<BookingRemoteRepository>(),
    ),
  );

  // ===========================Bloc===========================

  getIt.registerSingleton<BookingBloc>(BookingBloc(
  createBookingUsecase: getIt<CreateBookingUsecase>(),
   tokenSharedPrefs: getIt<TokenSharedPrefs>(),
));
}

/// *Initialize Splash Screen Dependencies*
void _initSplashScreenDependencies() {
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt<LoginBloc>()));
}

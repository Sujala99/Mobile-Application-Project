import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
// Application (Job Applications)
// import 'package:job_scout_project/features/application/data/data_source/remote_datasource/application_remote_datasource.dart';
// import 'package:job_scout_project/features/application/data/repository/application_remote_repository.dart';
// import 'package:job_scout_project/features/application/domain/repository/application_repository.dart';
// import 'package:job_scout_project/features/application/domain/usecase/create_application_usecase.dart';
// import 'package:job_scout_project/features/application/presentation/view_model/application_bloc.dart';
// Authentication

// Company
// import 'package:job_scout_project/features/company/data/data_source/remote_datasource/company_remote_datasource.dart';
// import 'package:job_scout_project/features/company/data/repository/company_remote_repository.dart';
// import 'package:job_scout_project/features/company/domain/usecase/get_all_company_usecase.dart';
// import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
// import 'package:job_scout_project/features/home/presentation/view_model/home_cubit.dart';
// import 'package:job_scout_project/features/jobs/data/data_source/remote_datasource/jobs_remote_data_source.dart';
// import 'package:job_scout_project/features/jobs/data/repository/jobs_remote_repository.dart';
// import 'package:job_scout_project/features/jobs/domain/use_case/get_all_jobs_usecase.dart';
// import 'package:job_scout_project/features/jobs/domain/use_case/get_job_by_id_usecase.dart';
// import 'package:job_scout_project/features/jobs/presentation/view_model/job_bloc.dart';
// import 'package:job_scout_project/features/splash/presentation/view_model/on_boarding/on_boarding_cubit.dart';
// import 'package:job_scout_project/features/splash/presentation/view_model/splash_cubit.dart';
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
  // _initCompanyDependencies();
  // _initApplicationDependencies();
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

/// *Initialize API Service*
void _initApiService() {
  getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);
}

/// *Initialize Hive Service for Local Storage*
void _initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

/// *Initialize Authentication Dependencies*
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

/// *Initialize Home Dependencies*
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

/// *Initialize Company Dependencies*
// void _initCompanyDependencies() {
//   getIt.registerLazySingleton<CompanyRemoteDataSource>(
//       () => CompanyRemoteDataSource(getIt<Dio>()));

//   getIt.registerLazySingleton<ICompanyRepository>(
//       () => CompanyRemoteRepository(getIt<CompanyRemoteDataSource>()));

//   getIt.registerLazySingleton<CreateCompanyUseCase>(() => CreateCompanyUseCase(
//         companyRepository: getIt<ICompanyRepository>(),
//         tokenSharedPrefs: getIt<TokenSharedPrefs>(),
//       ));

//   getIt.registerFactory<CompanyBloc>(() => CompanyBloc(
//         createCompanyUseCase: getIt<CreateCompanyUseCase>(),
//       ));
// }

/// *Initialize Splash Screen Dependencies*
void _initSplashScreenDependencies() {
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt<LoginBloc>()));
}

/// *Initialize Onboarding Screen Dependencies*
// void _initOnboardingScreenDependencies() {
//   getIt.registerFactory<OnboardingCubit>(
//       () => OnboardingCubit(getIt<LoginBloc>()));
// }

/// *Initialize Company Dependencies*
// void _initApplicationDependencies() {
//   getIt.registerLazySingleton<ApplicationRemoteDataSource>(
//       () => ApplicationRemoteDataSource(getIt<Dio>()));

//   getIt.registerLazySingleton<IApplicationRepository>(
//       () => ApplicationRemoteRepository(getIt<ApplicationRemoteDataSource>()));

//   getIt.registerLazySingleton<CreateApplicationUseCase>(
//       () => CreateApplicationUseCase(
//             applicationRepository: getIt<IApplicationRepository>(),
//             tokenSharedPrefs: getIt<TokenSharedPrefs>(),
//           ));
//   getIt.registerFactory<ApplicationBloc>(() => ApplicationBloc(
//         createApplicationUseCase: getIt<CreateApplicationUseCase>(),
//       ));
// }

//================================== Job ============================================

// void _initJobDependencies() {
//   //DataSource
//   getIt.registerLazySingleton<JobsRemoteDataSource>(
//     () => JobsRemoteDataSource(
//       getIt<Dio>(),
//     ),
//   );

//   //Repository
//   getIt.registerLazySingleton<JobRemoteRepository>(
//     () => JobRemoteRepository(
//       getIt<JobsRemoteDataSource>(),
//     ),
//   );

//   //Usecase
//   getIt.registerLazySingleton<GetAllJobs>(
//     () => GetAllJobs(
//       getIt<JobRemoteRepository>(),
//     ),
//   );
//   getIt.registerLazySingleton<GetJobById>(
//     () => GetJobById(
//       getIt<JobRemoteRepository>(),
//     ),
//   );
//   //Bloc
//   getIt.registerFactory<JobBloc>(
//     () => JobBloc(
//       getAllJobs: getIt<GetAllJobs>(),
//       getJobById: getIt<GetJobById>(),
//     ),
//   );
// }

// //================================== Company ============================================

// void _initCompanyDependencies() {
//   // DataSource
//   getIt.registerLazySingleton<CompanyRemoteDataSource>(
//     () => CompanyRemoteDataSource(getIt<Dio>()),
//   );

//   // Repository
//   getIt.registerLazySingleton<CompanyRemoteRepository>(
//     () => CompanyRemoteRepository(getIt<CompanyRemoteDataSource>()),
//   );

//   // UseCase
//   getIt.registerLazySingleton<GetAllCompany>(
//     () => GetAllCompany(getIt<CompanyRemoteRepository>()),
//   );

//   // Bloc
//   getIt.registerFactory<CompanyBloc>(
//     () => CompanyBloc(
//       getAllCompany: getIt<GetAllCompany>(),
//     ),
//   );
// }

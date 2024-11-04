import 'package:eshop/features/auth/login/data/remote_data_source/login_remote.dart';
import 'package:eshop/features/auth/login/data/repo_imp/login_repo.dart';
import 'package:eshop/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:eshop/features/auth/register/data/data_source/register_api.dart';
import 'package:eshop/features/auth/register/data/repo/register_repo.dart';
import 'package:eshop/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  // LOGIN
  getIt.registerLazySingleton<LoginRemote>(() => LoginRemote());
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // REGISTER
  getIt.registerLazySingleton<RegisterApi>(() => RegisterApi());
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo( registerApi: getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));




}
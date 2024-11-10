import 'package:eshop/features/auth/login/data/remote_data_source/login_remote.dart';
import 'package:eshop/features/auth/login/data/repo_imp/login_repo.dart';
import 'package:eshop/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:eshop/features/auth/register/data/data_source/register_api.dart';
import 'package:eshop/features/auth/register/data/repo/register_repo.dart';
import 'package:eshop/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:eshop/features/fav/data/data_sources/favourite_data_source.dart';
import 'package:eshop/features/fav/data/repositories/fav_repo_imp.dart';
import 'package:eshop/features/fav/domain/repositories/fav_base_repo.dart';
import 'package:eshop/features/fav/domain/use_cases/fav_use_case.dart';
import 'package:eshop/features/fav/presentation/manager/favorite_cubit.dart';
import 'package:eshop/features/home/data/data_sources/home_api.dart';
import 'package:eshop/features/home/data/repositories/home_repo.dart';
import 'package:eshop/features/home/domain/repositories/base_home_repo.dart';
import 'package:eshop/features/home/domain/use_cases/home_usecase.dart';
import 'package:eshop/features/home/presentation/manager/home_cubit.dart';
import 'package:eshop/features/product_details/data/data_source/product_details_api.dart';
import 'package:eshop/features/product_details/data/repo/pd_repo_imp.dart';
import 'package:eshop/features/product_details/domain/repo/pd_base_repo.dart';
import 'package:eshop/features/product_details/domain/usecase/pd_usecase.dart';
import 'package:eshop/features/product_details/presentation/manager/product_details_cubit.dart';
import 'package:eshop/features/products/data/data_sources/categories_api.dart';
import 'package:eshop/features/products/data/repositories/categories_repo.dart';
import 'package:eshop/features/products/domain/repositories/category_products_base_repo.dart';
import 'package:eshop/features/products/domain/use_cases/products_categories_usecase.dart';
import 'package:eshop/features/products/presentation/manager/category_products_cubit.dart';
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

  // HOME
  getIt.registerLazySingleton<HomeUseCase>(() => HomeUseCase( baseHomeRepo: getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<BaseHomeRepo>(() => HomeRepoImpl(homeApi: getIt()));
  getIt.registerLazySingleton<HomeApi>(() => HomeApi());

  // CATEGORIES
  getIt.registerLazySingleton<CategoriesProductsUseCase>(() => CategoriesProductsUseCase(categoriesProductsRepository: getIt()));
  getIt.registerLazySingleton<CategoryProductsCubit>(() => CategoryProductsCubit(getIt()));
  getIt.registerLazySingleton<CategoryProductsBaseRepo>(() => CategoriesProductsRepositoryImp(categoriesApi: getIt()));
  getIt.registerLazySingleton<CategoriesProductsApi>(() => CategoriesProductsApi());

  // PRODUCT DETAILS
  getIt.registerLazySingleton<PDUseCase>(() => PDUseCase(getIt()));
  getIt.registerLazySingleton<ProductDetailsCubit>(() => ProductDetailsCubit(getIt()));
  getIt.registerLazySingleton<PDBaseRepo>(() => PDRepoImp(getIt()));
  getIt.registerLazySingleton<ProdcutDetailsApi>(() => ProdcutDetailsApi());


  // Favorite
  getIt.registerLazySingleton<FavUseCase>(() => FavUseCase(getIt()));
  getIt.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit(getIt()));
  getIt.registerLazySingleton<FavBaseRepo>(() => FavRepoImp(getIt()));
  getIt.registerLazySingleton<FavouriteDataSource>(() => FavouriteDataSource());

}
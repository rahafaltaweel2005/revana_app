import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revana_app/feature/auth/domain/usecase/get_profile_use_case.dart';

import 'core/app_setting/theme/app_theme.dart';
import 'core/network/api_client.dart';
import 'feature/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'feature/auth/data/repository/auth_repository_impl.dart';
import 'feature/auth/domain/usecase/login_use_case.dart';
import 'feature/auth/domain/usecase/register_use_case.dart';
import 'feature/auth/presentaion /login/cubit/login_cubit.dart';
import 'feature/auth/presentaion /profile/cubit/profile_cubit.dart';
import 'feature/auth/presentaion /register/cubit/register_cubit.dart';
import 'feature/auth/presentaion /view/auth_screen.dart';
import 'feature/categories/data/datasource/categories_remote_datasource_impl.dart';
import 'feature/categories/data/repository/categories_repository_impl.dart';
import 'feature/categories/domain/usecase/create_category_use_case.dart';
import 'feature/categories/domain/usecase/delete_category_use_case.dart';
import 'feature/categories/domain/usecase/edit_category_use_case.dart';
import 'feature/categories/domain/usecase/view_admin_categories_use_case.dart';
import 'feature/categories/domain/usecase/view_categories_use_case.dart';
import 'feature/categories/presentaion/createcategory/cubit/create_category_cubit.dart';
import 'feature/categories/presentaion/deletecategory/cubit/delete_category_cubit.dart';
import 'feature/categories/presentaion/editcategory/cubit/edit_category_cubit.dart';
import 'feature/categories/presentaion/viewadmincategory/cubit/view_admin_category_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ApiClient.init();

  final authRemoteDatasource = AuthRemoteDatasourceImpl();

  final authRepository = AuthRepositoryImpl(
    authRemoteDatasource: authRemoteDatasource,
  );

  final registerUseCase = RegisterUseCase(authRepository: authRepository);
  final loginUseCase = LoginUseCase(authRepository: authRepository);
  final getProfileUseCase = GetProfileUseCase(authRepository: authRepository);
 final categoriesRemoteDatasource = CategoriesRemoteDatasourceImpl();

  final categoriesRepository = CategoriesRepositoryImpl(
    categoriesremoteDatasource: categoriesRemoteDatasource,
  );
  final viewAdminCategoriesUseCase = ViewAdminCategoriesUseCase(categoriesRepository: categoriesRepository);
  final createCategoryUseCase = CreateCategoryUseCase(categoriesRepository: categoriesRepository);
  final viewCategoriesUseCase = ViewCategoriesUseCase(categoriesRepository: categoriesRepository);
  final editCategoryUseCase = EditCategoryUseCase(categoriesRepository: categoriesRepository);
  final deleteCategoryUseCase = DeleteCategoryUseCase(categoriesRepository: categoriesRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RegisterCubit(registerUseCase: registerUseCase),
        ),
        BlocProvider(create: (_) => LoginCubit(loginUseCase: loginUseCase)),
        BlocProvider(
          create: (_) => ProfileCubit(getProfileUseCase: getProfileUseCase),
        ),
        BlocProvider(
          create: (_) => ViewAdminCategoryCubit(
            viewAdminCategoriesUseCase: viewAdminCategoriesUseCase,
          ),
        ),
        BlocProvider(
          create: (_) => CreateCategoryCubit(
            createCategoryUseCase: createCategoryUseCase,
          ),
        ),
        // BlocProvider(
        //   create: (_) => ViewCategoriesCubit(
        //     viewCategoriesUseCase: viewCategoriesUseCase,
        //   ),
        // ),
        BlocProvider(
          create: (_) => EditCategoryCubit(
            editCategoryUseCase: editCategoryUseCase,
          ),
        ),
        BlocProvider(
          create: (_) => DeleteCategoryCubit(
            deleteCategoryUseCase: deleteCategoryUseCase,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revana',
      theme: AppTheme.lightTheme,
      home: AuthScreen(),
    );
  }
}
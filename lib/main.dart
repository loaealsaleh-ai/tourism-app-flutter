import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:tourismapp/appRouter.dart';
import 'features/auth/data/datasource/api_service.dart';
import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit(AuthRepository(ApiService(Dio())));

    return BlocProvider(
      create: (_) => authCubit,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter(authCubit).router,
      ),
    );
  }
}

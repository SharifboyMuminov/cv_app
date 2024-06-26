import 'package:cv_app/bloc/auth/auth_bloc.dart';
import 'package:cv_app/bloc/user/user_bloc.dart';
import 'package:cv_app/data/api/api_provider.dart';
import 'package:cv_app/data/repositories/auth_repository.dart';
import 'package:cv_app/data/repositories/user_repository.dart';
import 'package:cv_app/screens/tab/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = ApiProvider();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => ApiProvider()),
        RepositoryProvider(create: (_) => UserRepository(apiProvider)),
        RepositoryProvider(create: (_) => AuthRepository(apiProvider)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              context.read<UserRepository>(),
            ),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(414, 896),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            ScreenUtil.init(context);
            return MaterialApp(
              title: 'Cv market',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(useMaterial3: true),
              home: child,
            );
          },
          child: const TabScreen(),
        ),
      ),
    );
  }
}

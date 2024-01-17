import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kafil/BussinessLogic/cubit/countries_cubit.dart';
import 'package:kafil/BussinessLogic/cubit/countries_state.dart';
import 'package:kafil/BussinessLogic/cubit/profile_cubit.dart';
import 'package:kafil/BussinessLogic/cubit/services_cubit.dart';
import 'package:kafil/Repositery/profilerep.dart';
import 'package:kafil/Screens/AuthScreen/loginScreen.dart';
import 'package:kafil/BussinessLogic/cubit/dependces_cubit.dart';
import 'package:kafil/BussinessLogic/cubit/register_cubit.dart';
import 'package:kafil/consts/strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApiCubit>(create: (context) => ApiCubit()),
        BlocProvider<ProductCubit>(create: (context) => ProductCubit()),
        BlocProvider<UserDetailCubit>(
            create: (context) => UserDetailCubit(UserRepositorydetails())),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}

import 'package:thanima_admin/features/auth/cubit/login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<BlocProvider> globalBlocs = [
  // BlocProvider<LanguageCodeBloc>(
  //   create: (_) => LanguageCodeBloc(
  //     localisationRepository: serviceLocator<LocalisationRepository>(),
  //     siplyDataSource: serviceLocator<SiplyRepository>(),
  //   ),
  // ),
  // BlocProvider<NetworkBloc>(
  //   create: (_) => NetworkBloc()..add(ListenConnection()),
  // ),

  BlocProvider<LoginCubit>(
    create: (_) => LoginCubit(),
  ),
];

import 'package:dafit_task/features/diet_program/presentation/cubit/program_cubit.dart';
import 'package:dafit_task/features/diet_program/presentation/pages/Home_screen.dart';
import 'package:dafit_task/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DafitTask extends StatelessWidget {
  const DafitTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
      ],
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'Dafit task',
      home: BlocProvider(
        create: (context) => sl<ProgramCubit>(),
        child: const HomeScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:romanizer/screens/loading_page.dart';
import 'package:romanizer/services/navigation/navigation_bloc.dart';
import 'package:romanizer/services/navigation/navigation_model.dart';

mainDelegate() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) => NavigationBloc()
            ..add(LoadNavigation(index: NavigationIndex.landingPage.index)),
          child: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              if (state is NavigationLoaded) {
                final int index = state.index;
                return state.screens[index].screenContent;
              }
              return const LoadingPage();
            },
          ),
        ),
      ),
    );
  }
}

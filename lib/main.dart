import 'package:fintech_prototype/shared/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/main_layout.dart';
import 'shared/bloc_observer.dart';
import 'shared/cubit/cubit.dart';

void main() async {
  // just to show branding
  // await Future.delayed(const Duration(milliseconds: 750));
  // if main() is async and there is await down here it will wait for it to finish before launching app
  WidgetsFlutterBinding.ensureInitialized();
  Widget widget;
  Bloc.observer = MyBlocObserver();

  widget = BlocProvider(
    create: (context) => AppCubit(),
    child: const MainLayout(),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp(widget)));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp(this.startWidget, {super.key});
  // constructor
  // build
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: startWidget,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          return Scaffold(
            extendBody: true,
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              elevation: 0,
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBarState(index);
              },
              items: const [
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.house),
                    icon: Icon(Icons.house_outlined),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.account_balance_wallet_sharp),
                    icon: Icon(Icons.account_balance_wallet_outlined),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.analytics_rounded),
                    icon: Icon(Icons.analytics_outlined),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.person),
                    icon: Icon(Icons.person_outline),
                    label: ''),
              ],
            ),
          );
        },
      ),
    );
  }
}

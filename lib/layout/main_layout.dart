import 'package:fintech_prototype/shared/cubit/cubit.dart';
import 'package:fintech_prototype/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

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
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 0, blurRadius: 5),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeBottomNavBarState(index);
                    },
                    items: const [
                      BottomNavigationBarItem(
                          activeIcon: Icon(Icons.home),
                          icon: Icon(Icons.home_outlined),
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
                ),
              ));
        },
      ),
    );
  }
}

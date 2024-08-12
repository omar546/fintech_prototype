import 'package:fintech_prototype/shared/components/widgets.dart';
import 'package:fintech_prototype/shared/cubit/cubit.dart';
import 'package:fintech_prototype/shared/cubit/states.dart';
import 'package:fintech_prototype/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Styles.greyColor,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: false,
                  floating: true,
                  snap: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: GestureDetector(
                    onTap: () {
                      AppCubit.get(context).changeBottomNavBarState(3);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/avatar_147133.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  title: const Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Wallet',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_rounded),
                      ),
                    )
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      GestureDetector(
                        onTap: () {},
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: buildCardsList(AppCubit.get(context).cards),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 30.0, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Transactions',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.tune_rounded))
                          ],
                        ),
                      ),
                      buildTransactionsList(AppCubit.get(context).transactions),
                      //PLACEHOLDER
                      Container(
                        height: 1000,
                        color: Colors.white24,
                        child: const Center(child: Text('Scroll down')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

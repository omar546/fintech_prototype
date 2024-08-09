import 'package:fintech_prototype/shared/cubit/cubit.dart';
import 'package:fintech_prototype/shared/cubit/states.dart';
import 'package:fintech_prototype/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  backgroundColor: Colors.white24,
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  leading: GestureDetector(
                    onTap: (){AppCubit.get(context).changeBottomNavBarState(3);},
                    child:  Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/avatar_147133.png',
                          fit: BoxFit.cover,
                        ),),
                    ),
                  ),
                  titleSpacing: 0,
                  title: GestureDetector(
                    onTap: (){AppCubit.get(context).changeBottomNavBarState(3);},
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning!',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'Client Name',
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
                        icon: const Stack(
                          children: [
                            Icon(Icons.notifications_none_outlined),
                            Positioned(
                              top: 5,
                              left: 13,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 4.5,
                                child: CircleAvatar(
                                  backgroundColor: Colors.deepOrange,
                                  radius: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
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

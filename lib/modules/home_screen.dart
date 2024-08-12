import 'package:fintech_prototype/shared/components/widgets.dart';
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
                  // floating: true,
                  // snap: true,
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
                  titleSpacing: 0,
                  title: GestureDetector(
                    onTap: () {
                      AppCubit.get(context).changeBottomNavBarState(3);
                    },
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
                                backgroundColor: Styles.greyColor,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            AppCubit.get(context).changeBottomNavBarState(1);
                          },
                          child: Stack(children: [
                            CustomPaint(
                              size: const Size(343, 144),
                              painter: BalanceCustomPainter(),
                            ),
                            const Positioned(
                              top: 15,
                              left: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Balance',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Styles.greyColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '\$25,000.40',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Styles.whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const Positioned(
                                bottom: 15,
                                right: 15,
                                child: Row(
                                  children: [
                                    Text(
                                      'My Wallet',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Styles.greyColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Styles.whiteColor,
                                      child: Icon(Icons.arrow_forward_rounded),
                                    ),
                                  ],
                                )),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Stack(children: [
                          CustomPaint(
                            size: const Size(343, 64),
                            painter: IncomeCustomPainter(),
                          ),
                          Positioned.fill(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  size: 35,
                                  color: Styles.positive,
                                ),
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Income',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Styles.greyColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '\$ 20,000',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Styles.whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Container(
                                  color: Colors.white38,
                                  width: 2,
                                  height: 35,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.arrow_upward_rounded,
                                  size: 35,
                                  color: Styles.negative,
                                ),
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Outcome',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Styles.greyColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '\$ 17,000',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Styles.whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 30.0, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Earnings',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'See All',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                      buildEarningsList(AppCubit.get(context).earnings),
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
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'See All',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Text(
                          'Today',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      buildTransactionsList(AppCubit.get(context).transactions),

                      //PLACEHOLDER
                      Container(
                        height: 1000,
                        color: Styles.greyColor,
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

class BalanceCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 10.4);
    path_0.cubicTo(0, 4.65624, 4.67532, 0, 10.4426, 0);
    path_0.lineTo(332.557, 0);
    path_0.cubicTo(338.325, 0, 343, 4.65624, 343, 10.4);
    path_0.lineTo(343, 133.6);
    path_0.cubicTo(343, 139.344, 338.325, 144, 332.557, 144);
    path_0.lineTo(10.4426, 144);
    path_0.cubicTo(4.67533, 144, 0, 139.344, 0, 133.6);
    path_0.lineTo(0, 10.4);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff242424).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(343, 46.4);
    path_1.cubicTo(330.854, 36.2755, 322.533, 32.9711, 305.246, 32);
    path_1.cubicTo(310.17, 64.4112, 322.704, 75.6321, 343, 82.4);
    path_1.lineTo(343, 46.4);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffEBB850).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(53.5612, 144);
    path_2.lineTo(10.4426, 144);
    path_2.cubicTo(4.67533, 144, 0, 139.344, 0, 133.6);
    path_2.lineTo(0, 116.404);
    path_2.cubicTo(3.47143, 115.617, 7.10406, 115.2, 10.8443, 115.2);
    path_2.cubicTo(31.017, 115.2, 48.0604, 127.341, 53.5612, 144);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff469B88).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(342.457, 6.41451);
    path_3.cubicTo(342.777, 7.32221, 342.965, 8.29234, 342.996, 9.30167);
    path_3.lineTo(342.996, 47.1689);
    path_3.cubicTo(342.996, 47.2996, 342.684, 47.0115, 342.059, 46.4349);
    path_3.cubicTo(338.659, 43.2946, 325.994, 31.5977, 304.009, 32.4187);
    path_3.cubicTo(278.538, 33.3699, 255.322, 13.6421, 255.443, 0);
    path_3.lineTo(333.361, 0);
    path_3.cubicTo(337.031, 0, 340.221, 2.04236, 341.85, 5.04803);
    path_3.cubicTo(342.092, 5.53271, 342.293, 5.99542, 342.457, 6.41451);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xff377CC8).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IncomeCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    // Path 1
    paint.color = const Color(0xffBFA2CA);
    Path path1 = Path();
    path1.moveTo(0, 11.8565);
    path1.cubicTo(0, 8.03412, 0, 6.12293, 1.30792, 4.66296);
    path1.cubicTo(2.4584, 3.37873, 4.29417, 2.33461, 6.55211, 1.68027);
    path1.cubicTo(9.11905, 0.936373, 12.4794, 0.936371, 19.2, 0.936371);
    path1.lineTo(144.8, 0.936371);
    path1.cubicTo(151.521, 0.936371, 154.881, 0.936373, 157.448, 1.68027);
    path1.cubicTo(159.706, 2.33461, 161.542, 3.37873, 162.692, 4.66296);
    path1.cubicTo(164, 6.12293, 164, 8.03412, 164, 11.8565);
    path1.lineTo(164, 52.5798);
    path1.cubicTo(164, 56.4022, 164, 58.3134, 162.692, 59.7734);
    path1.cubicTo(161.542, 61.0576, 159.706, 62.1017, 157.448, 62.7561);
    path1.cubicTo(154.881, 63.4999, 151.521, 63.4999, 144.8, 63.4999);
    path1.lineTo(19.2, 63.4999);
    path1.cubicTo(12.4794, 63.4999, 9.11905, 63.4999, 6.55211, 62.7561);
    path1.cubicTo(4.29417, 62.1017, 2.4584, 61.0576, 1.30792, 59.7734);
    path1.cubicTo(0, 58.3134, 0, 56.4022, 0, 52.5798);
    path1.lineTo(0, 11.8565);
    path1.close();
    canvas.drawPath(path1, paint);

    // Path 2
    paint.color = const Color(0xffF5D8CB);
    Path path2 = Path();
    path2.moveTo(178.946, 11.8566);
    path2.cubicTo(178.946, 8.03414, 178.946, 6.12293, 180.254, 4.66295);
    path2.cubicTo(181.405, 3.37872, 183.241, 2.33461, 185.499, 1.68026);
    path2.cubicTo(188.066, 0.936371, 191.426, 0.936371, 198.146, 0.936371);
    path2.lineTo(323.746, 0.936371);
    path2.cubicTo(330.467, 0.936371, 333.827, 0.936371, 336.394, 1.68026);
    path2.cubicTo(338.652, 2.33461, 340.488, 3.37872, 341.638, 4.66295);
    path2.cubicTo(342.946, 6.12293, 342.946, 8.03414, 342.946, 11.8566);
    path2.lineTo(342.946, 52.5798);
    path2.cubicTo(342.946, 56.4022, 342.946, 58.3135, 341.638, 59.7734);
    path2.cubicTo(340.488, 61.0577, 338.652, 62.1018, 336.394, 62.7561);
    path2.cubicTo(333.827, 63.5, 330.467, 63.5, 323.746, 63.5);
    path2.lineTo(198.146, 63.5);
    path2.cubicTo(191.426, 63.5, 188.066, 63.5, 185.499, 62.7561);
    path2.cubicTo(183.241, 62.1018, 181.405, 61.0577, 180.254, 59.7734);
    path2.cubicTo(178.946, 58.3135, 178.946, 56.4022, 178.946, 52.5798);
    path2.lineTo(178.946, 11.8566);
    path2.close();
    canvas.drawPath(path2, paint);

    // Path 3
    paint.color = const Color(0xff242424);
    Path path3 = Path();
    path3.moveTo(24, 1.5);
    path3.cubicTo(24, 12.8218, 14.8218, 22, 3.5, 22);
    path3.cubicTo(2.30678, 22, 1.13737, 21.8981, 0, 21.7024);
    path3.lineTo(0, 52.6434);
    path3.cubicTo(0, 56.4659, 0, 58.3771, 1.30792, 59.837);
    path3.cubicTo(2.4584, 61.1213, 4.29417, 62.1654, 6.55211, 62.8197);
    path3.cubicTo(9.11905, 63.5636, 12.4794, 63.5636, 19.2, 63.5636);
    path3.lineTo(321.021, 63.5636);
    path3.cubicTo(321.51, 52.6764, 330.492, 44, 341.5, 44);
    path3.cubicTo(342.004, 44, 342.505, 44.0182, 343, 44.054);
    path3.lineTo(343, 11.9202);
    path3.cubicTo(343, 8.09777, 343, 6.18656, 341.692, 4.72658);
    path3.cubicTo(340.542, 3.44235, 338.706, 2.39824, 336.448, 1.74389);
    path3.cubicTo(333.881, 1, 330.521, 1, 323.8, 1);
    path3.lineTo(23.994, 1);
    path3.cubicTo(23.998, 1.16618, 24, 1.33286, 24, 1.5);
    path3.close();
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

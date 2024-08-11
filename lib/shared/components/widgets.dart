import 'package:fintech_prototype/models/cards_model.dart';
import 'package:fintech_prototype/models/earnings_model.dart';
import 'package:fintech_prototype/models/transactions_model.dart';
import 'package:fintech_prototype/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

Widget buildProfileButton(
        {required void Function() action,
        required IconData icon,
        required String text,
        Color? iconColor}) =>
    GestureDetector(
      onTap: action,
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 0,
                blurRadius: 3),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: iconColor,
            ),
            const SizedBox(height: 5),
            Text(text),
          ],
        ),
      ),
    );

Widget buildTransactionsList(List<TransactionModel> transactions) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 64,
              width: 343,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: CircleAvatar(
                      backgroundColor: transactions[index].iconShade,
                      child: Icon(
                        transactions[index].icon,
                        size: 25,
                        color: transactions[index].iconColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(transactions[index].type,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      transactions[index].amount < 0
                          ? '-\$${transactions[index].amount.abs()}'
                          : '\$${transactions[index].amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: transactions[index].amount > 0
                              ? Styles.positive
                              : Styles.negative,
                          fontSize: 17),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 12,
            );
          },
          itemCount: transactions.length),
    );

final NumberFormat currencyFormat = NumberFormat("#,##0");

Widget buildEarningsList(List<EarningsModel> earnings) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        height: 128,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                  width: 128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: earnings[index].color,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      CircleAvatar(
                        backgroundColor: Styles.greyColor.withOpacity(.7),
                        radius: 15,
                        child: Text(
                          earnings[index].title.characters.first,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        earnings[index].title,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Styles.greyColor,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '\$ ${currencyFormat.format(earnings[index].amount.ceil())}',
                        style: const TextStyle(
                            fontSize: 17,
                            color: Styles.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ));
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 12,
              );
            },
            itemCount: earnings.length),
      ),
    );

String formatCardNumber(String cardNumber) {
  // Replace middle digits with asterisks
  String masked = cardNumber.replaceRange(
      4, cardNumber.length - 4, '*' * (cardNumber.length - 8));

  // Add spaces between every 4 digits
  String formatted = '';
  for (int i = 0; i < masked.length; i += 4) {
    formatted += '${masked.substring(i, i + 4)}    ';
  }
  return formatted.trim();
}

Widget buildCardsList(List<CardsModel> cards) => Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 30.0, right: 15.0),
      child: SizedBox(
        height: 180,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 3.0, top: 3.0, bottom: 3.0),
                  child: Container(
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Styles.whiteColor,
                        border: DashedBorder.fromBorderSide(
                            dashLength: 8,
                            side: BorderSide(
                                color: Styles.blackColor, width: 2.5)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Icon(Icons.add_circle_rounded),
                  ),
                );
              } else {
                return Stack(children: [
                  Visibility(
                    visible: cards[index - 1].operator == 'visa',
                    replacement: CustomPaint(
                        size: const Size(282, 176),
                        painter: MastercardCustomPainter()),
                    child: CustomPaint(
                      size: const Size(282, 176),
                      painter: VisaCustomPainter(),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Balance',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '\$${currencyFormat.format(cards[index - 1].balance.ceil())}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height*0.03,
                        ),
                        Text(
                          formatCardNumber(cards[index - 1].number.toString()),
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height*0.04,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Styles.greyColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  cards[index - 1].name,
                                  style: const TextStyle(
                                      color: Styles.whiteColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                width: 140,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Exp',
                                  style: TextStyle(
                                      color: Styles.greyColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  cards[index - 1].exp,
                                  style: const TextStyle(
                                      color: Styles.whiteColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]);
              }
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 12,
              );
            },
            itemCount: cards.length + 1),
      ),
    );

class MastercardCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 12);
    path_0.cubicTo(0, 5.37258, 5.37258, 0, 12, 0);
    path_0.lineTo(270, 0);
    path_0.cubicTo(276.627, 0, 282, 5.37258, 282, 12);
    path_0.lineTo(282, 164);
    path_0.cubicTo(282, 170.627, 276.627, 176, 270, 176);
    path_0.lineTo(12, 176);
    path_0.cubicTo(5.37258, 176, 0, 170.627, 0, 164);
    path_0.lineTo(0, 12);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xffFBE5A3).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, 129);
    path_1.lineTo(282, 129);
    path_1.lineTo(282, 164);
    path_1.cubicTo(282, 170.627, 276.627, 176, 270, 176);
    path_1.lineTo(12, 176);
    path_1.cubicTo(5.37258, 176, 0, 170.627, 0, 164);
    path_1.lineTo(0, 129);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff242424).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(257.645, 28.5298);
    path_2.lineTo(247.357, 28.5298);
    path_2.lineTo(247.357, 45.4672);
    path_2.lineTo(257.645, 45.4672);
    path_2.lineTo(257.645, 28.5298);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(248.417, 37);
    path_3.cubicTo(248.416, 35.3691, 248.783, 33.7592, 249.49, 32.2923);
    path_3.cubicTo(250.197, 30.8253, 251.226, 29.5398, 252.499, 28.5328);
    path_3.cubicTo(250.922, 27.284, 249.029, 26.5075, 247.035, 26.2919);
    path_3.cubicTo(245.042, 26.0764, 243.028, 26.4305, 241.225, 27.3138);
    path_3.cubicTo(239.422, 28.1972, 237.901, 29.5741, 236.838, 31.2872);
    path_3.cubicTo(235.774, 33.0003, 235.21, 34.9805, 235.21, 37.0015);
    path_3.cubicTo(235.21, 39.0225, 235.774, 41.0027, 236.838, 42.7158);
    path_3.cubicTo(237.901, 44.4289, 239.422, 45.8058, 241.225, 46.6891);
    path_3.cubicTo(243.028, 47.5725, 245.042, 47.9266, 247.035, 47.7111);
    path_3.cubicTo(249.029, 47.4955, 250.922, 46.719, 252.499, 45.4702);
    path_3.cubicTo(251.225, 44.4629, 250.196, 43.1768, 249.489, 41.7094);
    path_3.cubicTo(248.782, 40.2419, 248.415, 38.6314, 248.417, 37);
    path_3.lineTo(248.417, 37);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(268.768, 43.675);
    path_4.lineTo(268.768, 43.328);
    path_4.lineTo(268.916, 43.328);
    path_4.lineTo(268.916, 43.2562);
    path_4.lineTo(268.563, 43.2562);
    path_4.lineTo(268.563, 43.328);
    path_4.lineTo(268.702, 43.328);
    path_4.lineTo(268.702, 43.675);
    path_4.lineTo(268.768, 43.675);
    path_4.close();
    path_4.moveTo(269.453, 43.675);
    path_4.lineTo(269.453, 43.2562);
    path_4.lineTo(269.346, 43.2562);
    path_4.lineTo(269.222, 43.5554);
    path_4.lineTo(269.097, 43.2562);
    path_4.lineTo(268.99, 43.2562);
    path_4.lineTo(268.99, 43.675);
    path_4.lineTo(269.067, 43.675);
    path_4.lineTo(269.067, 43.3579);
    path_4.lineTo(269.183, 43.6302);
    path_4.lineTo(269.263, 43.6302);
    path_4.lineTo(269.379, 43.3579);
    path_4.lineTo(269.379, 43.675);
    path_4.lineTo(269.453, 43.675);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = const Color(0xffA7A7A7).withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(269.789, 37);
    path_5.cubicTo(269.789, 39.0211, 269.224, 41.0015, 268.161, 42.7146);
    path_5.cubicTo(267.097, 44.4278, 265.576, 45.8047, 263.773, 46.6879);
    path_5.cubicTo(261.969, 47.5711, 259.955, 47.925, 257.962, 47.7092);
    path_5.cubicTo(255.968, 47.4933, 254.075, 46.7164, 252.499, 45.4672);
    path_5.cubicTo(253.771, 44.4594, 254.799, 43.1734, 255.507, 41.7064);
    path_5.cubicTo(256.214, 40.2394, 256.581, 38.6296, 256.581, 36.9985);
    path_5.cubicTo(256.581, 35.3674, 256.214, 33.7577, 255.507, 32.2906);
    path_5.cubicTo(254.799, 30.8236, 253.771, 29.5377, 252.499, 28.5298);
    path_5.cubicTo(254.075, 27.2806, 255.968, 26.5037, 257.962, 26.2879);
    path_5.cubicTo(259.955, 26.072, 261.969, 26.4259, 263.773, 27.3091);
    path_5.cubicTo(265.576, 28.1923, 267.097, 29.5692, 268.161, 31.2824);
    path_5.cubicTo(269.224, 32.9956, 269.789, 34.9759, 269.789, 36.997);
    path_5.lineTo(269.789, 37);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = const Color(0xffA7A7A7).withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class VisaCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 12);
    path_0.cubicTo(0, 5.37258, 5.37258, 0, 12, 0);
    path_0.lineTo(270, 0);
    path_0.cubicTo(276.627, 0, 282, 5.37258, 282, 12);
    path_0.lineTo(282, 164);
    path_0.cubicTo(282, 170.627, 276.627, 176, 270, 176);
    path_0.lineTo(12, 176);
    path_0.cubicTo(5.37258, 176, 0, 170.627, 0, 164);
    path_0.lineTo(0, 12);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, 129);
    path_1.lineTo(282, 129);
    path_1.lineTo(282, 164);
    path_1.cubicTo(282, 170.627, 276.627, 176, 270, 176);
    path_1.lineTo(12, 176);
    path_1.cubicTo(5.37258, 176, 0, 170.627, 0, 164);
    path_1.lineTo(0, 129);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff242424).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(268.125, 26.6312);
    path_2.lineTo(235.875, 26.6312);
    path_2.cubicTo(235.391, 26.6312, 235, 27, 235, 27.455);
    path_2.lineTo(235, 46.5456);
    path_2.cubicTo(235, 47.0006, 235.391, 47.3694, 235.875, 47.3694);
    path_2.lineTo(268.125, 47.3694);
    path_2.cubicTo(268.609, 47.3694, 269, 47.0006, 269, 46.5456);
    path_2.lineTo(269, 27.455);
    path_2.cubicTo(269, 27, 268.609, 26.6312, 268.125, 26.6312);
    path_2.close();
    path_2.moveTo(237.632, 32.898);
    path_2.lineTo(241.261, 32.898);
    path_2.cubicTo(241.751, 32.9156, 242.145, 33.0623, 242.281, 33.5547);
    path_2.lineTo(243.07, 37.1269);
    path_2.cubicTo(242.295, 35.2584, 240.426, 33.7037, 237.602, 33.0601);
    path_2.lineTo(237.632, 32.898);
    path_2.close();
    path_2.moveTo(242.023, 41.0453);
    path_2.lineTo(239.927, 34.3054);
    path_2.cubicTo(241.434, 35.213, 242.717, 36.6533, 243.17, 37.6555);
    path_2.lineTo(243.414, 38.4878);
    path_2.lineTo(245.706, 32.9756);
    path_2.lineTo(248.186, 32.9756);
    path_2.lineTo(244.501, 41.0436);
    path_2.lineTo(242.023, 41.0453);
    path_2.close();
    path_2.moveTo(250.009, 41.0521);
    path_2.lineTo(247.669, 41.0521);
    path_2.lineTo(249.132, 32.9683);
    path_2.lineTo(251.474, 32.9683);
    path_2.lineTo(250.009, 41.0521);
    path_2.close();
    path_2.moveTo(254.082, 41.1728);
    path_2.cubicTo(253.033, 41.1626, 252.022, 40.9671, 251.474, 40.7411);
    path_2.lineTo(251.804, 38.932);
    path_2.lineTo(252.105, 39.0606);
    path_2.cubicTo(252.874, 39.3626, 253.372, 39.485, 254.309, 39.485);
    path_2.cubicTo(254.982, 39.485, 255.702, 39.2374, 255.709, 38.6957);
    path_2.cubicTo(255.713, 38.3416, 255.407, 38.0889, 254.496, 37.6923);
    path_2.cubicTo(253.607, 37.3059, 252.431, 36.6578, 252.445, 35.4969);
    path_2.cubicTo(252.458, 33.9258, 254.088, 32.8295, 256.402, 32.8295);
    path_2.cubicTo(257.308, 32.8295, 258.035, 33.0051, 258.498, 33.1688);
    path_2.lineTo(258.182, 34.9207);
    path_2.lineTo(257.971, 34.8272);
    path_2.cubicTo(257.54, 34.664, 256.986, 34.5065, 256.219, 34.5178);
    path_2.cubicTo(255.303, 34.5178, 254.878, 34.8771, 254.878, 35.213);
    path_2.cubicTo(254.873, 35.5915, 255.374, 35.8408, 256.193, 36.2159);
    path_2.cubicTo(257.543, 36.7926, 258.167, 37.4923, 258.159, 38.4119);
    path_2.cubicTo(258.141, 40.0889, 256.544, 41.1728, 254.082, 41.1728);
    path_2.close();
    path_2.moveTo(264.226, 41.055);
    path_2.cubicTo(264.226, 41.055, 264.012, 40.1258, 263.941, 39.8436);
    path_2.cubicTo(263.6, 39.8436, 261.212, 39.8402, 260.943, 39.8402);
    path_2.cubicTo(260.852, 40.0584, 260.451, 41.055, 260.451, 41.055);
    path_2.lineTo(257.993, 41.055);
    path_2.lineTo(261.469, 33.647);
    path_2.cubicTo(261.715, 33.1207, 262.134, 32.9762, 262.695, 32.9762);
    path_2.lineTo(264.503, 32.9762);
    path_2.lineTo(266.398, 41.0544);
    path_2.lineTo(264.226, 41.055);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(262.86, 35.1558);
    path_3.cubicTo(262.741, 35.4601, 262.535, 35.949, 262.549, 35.9275);
    path_3.cubicTo(262.549, 35.9275, 261.809, 37.7218, 261.616, 38.187);
    path_3.lineTo(263.56, 38.187);
    path_3.cubicTo(263.466, 37.7824, 263.017, 35.8527, 263.017, 35.8527);
    path_3.lineTo(262.86, 35.1558);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

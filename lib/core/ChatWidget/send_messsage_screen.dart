import 'package:flutter/material.dart';

import '../Helper/AppConstant/AppColorConstant.dart';
import '../Helper/AppConstant/AppTextStyleConstant.dart';

class SentMessageScreen extends StatelessWidget {
  final String message;
  var time;
  SentMessageScreen({
    Key? key,
    required this.message,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CustomPaint(painter: CustomShape(Colors.cyan)),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColor.deActiveColor,
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Container(
                  //  width: width,
                  padding: const EdgeInsets.only(right: 5, bottom: 5, left: 5),
                  child: Text(message, style: AppTextStyle.h4B),
                ),
                // Positioned(
                //              bottom: 1,
                //              right: 1,
                //   child: Text(
                //     time,
                //     style: AppTextStyle.h5B,
                //
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    ));
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 50, top: 10, bottom: 3),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 10),
          messageTextGroup,
        ],
      ),
    );
  }
}

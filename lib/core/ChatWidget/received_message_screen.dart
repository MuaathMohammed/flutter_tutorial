import 'package:flutter/material.dart';
import 'package:my_shop_app/app/core/Helper/AppConstant/AppColorConstant.dart';
import '../Helper/AppConstant/AppTextStyleConstant.dart';

class ReceivedMessageScreen extends StatelessWidget {
  final String message;
  var time;
  ReceivedMessageScreen({
    Key? key,
    required this.message,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Transform(
        //   alignment: Alignment.center,
        //   transform: Matrix4.rotationY(math.pi),
        //   child: CustomPaint(
        //     painter: CustomShape(Colors.grey),
        //   ),
        // ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColor.lightGrey,
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Container(
                  //  width: width,
                  padding: const EdgeInsets.only(right: 5, bottom: 5, left: 5),
                  child: Text(message, style: AppTextStyle.h4B),
                ),
                // Positioned(
                //   left: 1,
                //   bottom: 1,
                //   child: Text(
                //     time,
                //     style: AppTextStyle.h5B
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    ));

    return Padding(
      padding: const EdgeInsets.only(right: 50.0, left: 15, top: 10, bottom: 2),
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

import 'package:flutter/material.dart';
import 'package:my_shop_app/app/core/Helper/AppConstant/AppColorConstant.dart';

class CustomSwitch extends StatefulWidget {
  final bool? value;
  final ValueChanged<bool> onChanged;
  var width;
  var height;

  CustomSwitch(
      {Key? key, this.value, this.width, this.height, required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value! ? Alignment.centerLeft : Alignment.centerRight,
            end: widget.value! ? Alignment.centerRight : Alignment.centerLeft)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == true
                ? widget.onChanged(false)
                : widget.onChanged(true);
          },
          child: Row(
            children: [
              Container(
                width: widget.width ?? 70.0,
                height: widget.height ?? 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: _circleAnimation.value == Alignment.centerLeft
                      ? AppColor.primaryColorBorder.withOpacity(0.2)
                      : AppColor.primaryColorBorder.withOpacity(0.2),
                ),
                child: Container(
                  alignment: widget.value!
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _circleAnimation.value == Alignment.centerLeft
                          ? AppColor.activeColor
                          : AppColor.gray,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop_app/app/core/Helper/AppConstant/AppTextStyleConstant.dart';
import '../../Helper/AppConstant/AppColorConstant.dart';
import 'MyCustomWidgets.dart';

//==================
//  Custom AppBar
//==================
class CustomAppBar extends StatelessWidget {
  var title;
  var hasMenu;
  var imageUrl;
  final bool isLeading, isImageUrl;
  final IconData? leading;
  VoidCallback? fun;
  VoidCallback? anotherFun;
  var anoterImage;
  var isAnother;
  var paddinglt;
  var paddingrt;
  var child;
  var menu;
  var height;
  // VoidCallback? funBack;
  CustomAppBar({
    Key? key,
    this.imageUrl,
    this.child,
    this.menu,
    required this.title,
    //   required this.isBack,
    required this.isLeading,
    required this.isImageUrl,
    this.leading,
    this.height,
    this.isAnother,
    this.hasMenu,
    this.anoterImage,
    this.fun,
    this.paddingrt,
    this.paddinglt,
    this.anotherFun,
    //   this.funBack,
  });
  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Column(
        children: [
          Container(
            height: 60,
            width: width,
            padding: EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
            decoration: BoxDecoration(color: AppColor.secondaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                isImageUrl == true
                    ? CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        maxRadius: 20,
                        child: ClipOval(
                            child: MyWidget.imageView(
                          url: imageUrl,
                          builderIcon: Icons.person,
                        )))
                    : Flexible(
                        child: Container(
                        child: imageUrl,
                      )),
                // isBack == true
                //     ? Container(
                //         width: 50,
                //         height: 50,
                //         child: IconButton(
                //             icon: Icon(
                //               Icons.arrow_back,
                //               color: AppColor.white,
                //             ),
                //             onPressed: funBack),
                //       )
                //     : Container(
                //         width: 0,
                //       ),
                hasMenu == true
                    ? Container(
                        width: width / 1.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // width:title==""?10.0:width/1.7,
                              padding: EdgeInsets.only(
                                  left: paddinglt ?? 0.0,
                                  right: paddingrt ?? 0.0),
                              child: Center(
                                child: Text(
                                  title,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.h3ACT,
                                ),
                              ),
                            ),
                            Container(
                              child: menu,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      )
                    : Container(
                        // width: title == "" ? 10.0 : width / 1.7,
                        padding: EdgeInsets.only(
                            left: paddinglt ?? 0.0, right: paddingrt ?? 0.0),
                        child: Center(
                          child: Text(
                            title,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.h3W,
                          ),
                        ),
                      ),

                isLeading == true
                    ? Row(
                        children: [
                          // isAnother==true?   Container(
                          //     child: InkWell(
                          //         child:
                          //           anoterImage,
                          //         onTap: anotherFun),
                          //   ):Container(),
                          Container(
                            child: IconButton(
                                icon: Icon(
                                  leading,
                                  color: AppColor.white,
                                ),
                                onPressed: fun),
                          ),
                        ],
                      )
                    : Container(
                        child: anoterImage,
                      ),
              ],
            ),
          ),
          child != null
              ? Container(
                  height: 50,
                  color: AppColor.primaryColor,
                  child: child,
                )
              : Container(),
        ],
      ),
    );
  }
}

// //=====================
// // Responsive Widget
// //=====================
// class ResponsiveWidget {
//   static bool isScreenLarge(double width, double pixel) {
//     return width * pixel >= 1440;
//   }
//
//   static bool isScreenMedium(double width, double pixel) {
//     return width * pixel < 1440 && width * pixel >= 1080;
//   }
//
//   static bool isScreenSmall(double width, double pixel) {
//     return width * pixel <= 720;
//   }
// }
class DesignType {
  static bool isAdmin(child) {
    return child;
  }

  static bool isChild(child) {
//    type='child';
    return child;
  }

  static bool isType(type) {
    type = 'child';
    return true;
  }
}

//======================
//Custom TextField
//=====================
class CustomTextField extends StatelessWidget {
  final String hint;
  String? Function(dynamic val)? onchange;
  VoidCallback? onTap;
  final String? txtValid;
  final String? value;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? icon;
  final int? lineNumber;
  var length;
  double? height;
  double? width;
  double? _pixelRatio;
  bool? large;
  bool? medium;
  CustomTextField({
    this.lineNumber,
    this.onTap,
    this.value,
    this.length,
    required this.hint,
    this.txtValid,
    this.textEditingController,
    required this.keyboardType,
    this.icon,
    this.onchange,
    this.width,
    this.height,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    //   _width = MediaQuery.of(context).size.width;
    //height = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    // large = ResponsiveWidget.isScreenLarge(_width!, _pixelRatio!);
    // medium = ResponsiveWidget.isScreenMedium(_width!, _pixelRatio!);
    return Container(
      decoration: MyWidget.commonStyle(
          radius: 5, Os: Offset(1, 1), color: AppColor.white),
      height: height,
      width: width,
      child: TextFormField(
        initialValue: value,
        maxLines: lineNumber,
        onTap: onTap,
        maxLength: length,
        onChanged: onchange,
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColor.primaryColor, size: 20),
          fillColor: AppColor.white,
          filled: true,
          hintText: hint,
          contentPadding: EdgeInsets.all(10),
          errorStyle: AppTextStyle.h5D,
          labelStyle: TextStyle(color: AppColor.primaryColorDark),
          border: InputBorder.none,
          //
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),
          //     borderSide:
          //     BorderSide(color: AppColor.primaryColorDark, width: 2)
          // ),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),
          //     borderSide:
          //         BorderSide(color: AppColor.primaryColorDark, width: 3)
          // ),
        ),
        validator: (value) => value!.trim().isEmpty ? txtValid ?? "" : null,
        style: AppTextStyle.h4PCD,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  var title;
  var style;
  var elips;
  var padding;
  CustomText({this.title, this.style, this.elips, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding == null ? EdgeInsets.zero : EdgeInsets.all(padding),
      child: Text(
        title,
        style: style ?? AppTextStyle.h4PCD,
        softWrap: true,
        overflow: elips,
      ),
    );
  }
}

class CustomTextFieldForm extends StatelessWidget {
  String? Function(String? val) validate;
  final Function(String? val)? onChange;
  final Function(String? val)? onSave;
  final String hint;
  VoidCallback? onTap;
  FocusNode? focus;
  final double? height;
  final String? txtValid;
  var decoration;
  final String? value;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? lineNumber;
  final IconData? icon;
  double? _width;
  var suffixwidget;
  var prefixWidget;
  var left, right;
  bool? readOnly;
  var align;
  var tDirection;
  double? _pixelRatio;
  bool? large;
  bool? medium;
  bool? enabled;
  var borderColor;
  var top;
  var color;
  var isCureved;
  var cureved;
  var errorStyle;
  var inputFormater;
  var inputLength;
  CustomTextFieldForm({
    this.onTap,
    this.height,
    this.readOnly,
    this.inputLength,
    this.borderColor,
    this.enabled,
    this.inputFormater,
    this.isCureved,
    this.onSave,
    this.cureved,
    this.color,
    this.errorStyle,
    this.lineNumber,
    this.value,
    required this.validate,
    required this.hint,
    this.top,
    this.onChange,
    this.txtValid,
    this.focus,
    this.textEditingController,
    required this.keyboardType,
    this.icon,
    this.suffixwidget,
    this.prefixWidget,
    this.align,
    this.tDirection,
    this.decoration,
    this.right,
    this.left,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    // large = ResponsiveWidget.isScreenLarge(_width!, _pixelRatio!);
    // medium = ResponsiveWidget.isScreenMedium(_width!, _pixelRatio!);
    return Container(
      margin: EdgeInsets.only(
          left: left ?? 0.0, right: right ?? 0.0, top: top ?? 0.0),
      height: height,
      child: Directionality(
        textDirection: tDirection ?? TextDirection.rtl,
        child: TextFormField(
          textAlign: align ?? TextAlign.right,
          enabled: enabled,
          focusNode: focus,
          readOnly: readOnly ?? false,
          initialValue: value,
          maxLength: inputLength,
          maxLines: lineNumber,
          inputFormatters: inputFormater,
          onTap: onTap,
          controller: textEditingController,
          onSaved: onSave,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorHeight: 15,
          onChanged: onChange,
          decoration: InputDecoration(
            prefixIcon: icon != null
                ? Icon(icon, color: AppColor.activeColor, size: 30)
                : prefixWidget,
            suffixIcon: suffixwidget,
            filled: true,
            fillColor: color ?? null,
            hintText: hint,
            hintStyle: AppTextStyle.h4B,
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            errorStyle: errorStyle ?? AppTextStyle.h5D,
            labelStyle: TextStyle(color: AppColor.primaryColorBox),
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(isCureved == true ? cureved : 0),
                borderSide:
                    BorderSide(color: borderColor ?? AppColor.white, width: 2)),
            //
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(isCureved == true ? cureved : 0),
                borderSide: BorderSide(
                    color: AppColor.activeColor.withAlpha(100), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(isCureved == true ? cureved : 0),
                borderSide: BorderSide(color: AppColor.activeColor, width: 1)),
          ),
          validator: validate,
          style: AppTextStyle.h4PCD,
        ),
      ),
    );
  }
}

class CustomChatText extends StatelessWidget {
  //String? Function(String? val) validate;
  String? Function(String? val) onSave;
  final String hint;
  VoidCallback? onTap;
  final double? height;
  final String? txtValid;
  var decoration;
  final String? value;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? lineNumber;
  final IconData? icon;
  double? _width;
  var left, right;
  bool? readOnly;
  var align;
  var tDirection;
  double? _pixelRatio;
  bool? large;
  bool? medium;
  bool? enabled;
  var focusNode;
  var isCureved;
  var cureved;
  var borderColor;
  var suffixwidget;
  var prefixWidget;
  var color;
  CustomChatText({
    this.onTap,
    this.prefixWidget,
    this.suffixwidget,
    this.isCureved,
    this.cureved,
    this.borderColor,
    this.color,
    required this.onSave,
    this.height,
    this.readOnly,
    this.enabled,
    this.focusNode,
    this.lineNumber,
    this.value,
    //   required this.validate,
    required this.hint,
    this.txtValid,
    this.textEditingController,
    required this.keyboardType,
    this.icon,
    this.align,
    this.tDirection,
    this.decoration,
    this.right,
    this.left,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    // large = ResponsiveWidget.isScreenLarge(_width!, _pixelRatio!);
    // medium = ResponsiveWidget.isScreenMedium(_width!, _pixelRatio!);
    return Container(
      margin: EdgeInsets.only(left: left ?? 0.0, right: right ?? 0.0),
      height: height,
      padding: EdgeInsets.all(5),
      child: Directionality(
        textDirection: tDirection ?? TextDirection.rtl,
        child: TextFormField(
          textAlign: align ?? TextAlign.right,
          enabled: enabled,
          readOnly: readOnly ?? false,
          initialValue: value,
          maxLines: lineNumber,
          onTap: onTap,
          onSaved: onSave,
          controller: textEditingController,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: icon != null
                ? Icon(icon, color: AppColor.primaryColor, size: 30)
                : prefixWidget,
            suffixIcon: suffixwidget,
            filled: true,
            fillColor: color ?? null,
            hintText: hint,
            hintStyle: AppTextStyle.h4G,
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, -20),
            errorStyle: AppTextStyle.h5D,
            labelStyle: TextStyle(color: AppColor.primaryColorBox),
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(isCureved == true ? cureved : 0),
                borderSide:
                    BorderSide(color: borderColor ?? AppColor.white, width: 2)),
            //
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(isCureved == true ? cureved : 0),
                borderSide: BorderSide(
                    color: AppColor.activeColor.withAlpha(100), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(isCureved == true ? cureved : 0),
                borderSide: BorderSide(color: AppColor.activeColor, width: 1)),
          ),
          //      validator: validate,
          style: AppTextStyle.h4B, focusNode: focusNode,
        ),
      ),
    );
  }
}

class CustomTextFieldOTP extends StatelessWidget {
  final TextEditingController? textEditingController;
  bool? autoFoucs;
  final void Function(String)? fun;
  CustomTextFieldOTP(
      {required this.textEditingController, this.autoFoucs, required this.fun});

  @override
  Widget build(BuildContext context) {
    // _width = MediaQuery.of(context).size.width;
    // _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    // large = ResponsiveWidget.isScreenLarge(_width!, _pixelRatio!);
    // medium = ResponsiveWidget.isScreenMedium(_width!, _pixelRatio!);
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: AppColor.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: AppColor.primaryColorShadow,
            blurRadius: 10,
            offset: Offset(1, 9))
      ]),
      width: 40,
      child: TextFormField(
        autofocus: autoFoucs ?? false,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        onChanged: fun,
        maxLength: 1,
        style: AppTextStyle.h4PCD,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: AppColor.primaryColor),
          fillColor: Colors.white,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColor.primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}

// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final TextEditingController? textEditingController;
//   final TextInputType keyboardType;
//   final bool obscureText;
//   final IconData icon;
//   double? _width;
//   double? _pixelRatio;
//   bool? large;
//   bool? medium;
//   String? Function(String? val)? validate;
//   CustomTextField({
//     required this.hint,
//     this.validate,
//     this.textEditingController,
//     required this.keyboardType,
//     required  this.icon,
//     this.obscureText = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     _width = MediaQuery.of(context).size.width;
//     _pixelRatio = MediaQuery.of(context).devicePixelRatio;
//     // large = ResponsiveWidget.isScreenLarge(_width!, _pixelRatio!);
//     // medium = ResponsiveWidget.isScreenMedium(_width!, _pixelRatio!);
//     return Material(
//       borderRadius: BorderRadius.circular(10.0),
//       elevation: 10,
//       child: TextFormField(
//         controller: textEditingController,
//         keyboardType: keyboardType,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color:AppColor.primaryColor, size: 20),
//           fillColor: AppColor.white,
//           filled: true,
//           hintText: hint,
//           hintStyle: AppTextStyle.h3,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(
//               color: AppColor.primaryColor,
//               width: 2,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: AppColor.primaryColorDark,
//               )),
//           enabledBorder:  OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide:  BorderSide(
//                 color: AppColor.primaryColorDark,
//               )),
//         ),
//      //   validator: validate,
//         style: AppTextStyle.h3,
//       ),
//     );
//   }
// }
class CustomButton extends StatelessWidget {
  VoidCallback onTap;
  String title;
  double? width, height;
  Widget? icon;
  var color;
  var btcolor;
  var txtColor;
  double? right, left, top, bottom;
  var isBox;
  var isCirculer;
  CustomButton(
      {Key? key,
      this.color,
      this.txtColor,
      required this.title,
      required this.onTap,
      this.width,
      this.icon,
      this.isBox,
      this.btcolor,
      this.isCirculer,
      this.height,
      this.left,
      this.right,
      this.top,
      this.bottom});
  @override
  Widget build(BuildContext context) {
    return isBox == true
        ? RaisedButton(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: onTap,
            color: btcolor ?? AppColor.white,
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.center,
//        height: _height! / 20,
              width: width,
              height: height,
              margin: EdgeInsets.only(
                  right: right ?? 5.0,
                  left: left ?? 5.0,
                  top: top ?? 0,
                  bottom: bottom ?? 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: color ?? AppColor.primaryColorBoxTrance),
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: icon != null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  icon == null ? Container() : Container(child: icon),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Hanimation_Arabic_SemiBold",
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: txtColor ?? AppColor.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : isCirculer == true
            ? RaisedButton(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: onTap,
                textColor: AppColor.primaryColor,
                padding: EdgeInsets.all(0.0),
                child: Container(
                  alignment: Alignment.center,
//        height: _height! / 20,
                  width: width,
                  height: height,
                  //  color:color?? AppColor.primaryColorBoxTrance
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: color ?? AppColor.primaryColorBoxTrance),
                  margin: EdgeInsets.only(
                      right: right ?? 5.0,
                      left: left ?? 5.0,
                      top: top ?? 0,
                      bottom: bottom ?? 0),

                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Container(child: icon),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Hanimation_Arabic_SemiBold",
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: txtColor ?? AppColor.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: onTap,
                textColor: AppColor.primaryColor,
                padding: EdgeInsets.all(0.0),
                child: Container(
                  alignment: Alignment.center,
//        height: _height! / 20,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: color ?? AppColor.primaryColorBoxTrance),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //    Container(child: icon),
                      Container(
                        // margin: EdgeInsets.only(right: 25),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontFamily: "Hanimation_Arabic_SemiBold",
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: txtColor ?? AppColor.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}

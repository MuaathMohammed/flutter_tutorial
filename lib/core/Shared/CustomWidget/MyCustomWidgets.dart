import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop_app/app/core/Helper/AppConstant/AppColorConstant.dart';
import 'package:my_shop_app/app/core/Helper/AppConstant/AppTextStyleConstant.dart';

import 'package:url_launcher/url_launcher.dart';

class MyWidget {
  static imageView(
      {required String? url,
      var builderIcon,
      double? width,
      var iconSize,
      double? height,
      var color,
      BoxFit? box}) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url!,
      fit: box,
      placeholder: (context, url) => Center(
        child: Container(
          alignment: Alignment.center,
          color: AppColor.primaryColorShadow,
          child: CircularProgressIndicator(
            backgroundColor: AppColor.activeColor,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Center(
          child: Icon(
        builderIcon,
        color: color ?? AppColor.primaryColor,
        size: iconSize ?? 30.0,
      )),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  static appBar(
      {Key? key,
      required String title,
      double? width,
      double? height,
      var widget,
      String? imageUrl}) {
    return AppBar(
      title: Center(child: Text(title)),
      leading: imageUrl == null
          ? widget
          : MyWidget.imageView(
              url: imageUrl,
              builderIcon: Icons.person,
            ),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: AppColor.primaryColorDark),
      ),
    );
  }

  // static HtmlContenView(String content) {
  //   return Html(
  //       data: content == null ? " " : content,
  //       style: {
  //         "body": Style(
  //             fontFamily: "Hanimation_Arabic_SemiBold",
  //             fontWeight: FontWeight.w300,
  //             fontSize: FontSize.large,
  //             color: AppColor.primaryColorDark)
  //       },
  //       customImageRenders: {
  //         (attr, _) =>
  //                 attr["src"] != null && attr["src"]!.startsWith("/myfiles"):
  //             networkImageRender(mapUrl: (url) => "URLCON.mainUrl" + url!),
  //       },
  //       onLinkTap: (String? url, RenderContext context,
  //           Map<String, String> attributes, dom.Element? element) {
  //         launchURL(url);
  //       },
  //       onImageTap: (String? url, RenderContext context,
  //           Map<String, String> attributes, dom.Element? element) {
  //         launchURL(url);
  //       });
  // }

  static launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static commonStyle(
      {Color? color, double? radius, var blurRadius, Offset? Os}) {
    return BoxDecoration(
        color: color ?? AppColor.white,
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppColor.secondaryColorShadow,
              blurRadius: blurRadius ?? 5,
              offset: Os ?? Offset(5, 10))
        ]);
  }

  static commonStyleImage({
    Color? color,
    double? radius,
    var blurRadius,
    var leftRadius,
    var rightRadius,
    var topRadius,
    var bottomRadius,
    Offset? Os,
    image,
  }) {
    return BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image)),
        color: color ?? AppColor.white,
        borderRadius: radius != null
            ? BorderRadius.circular(radius)
            : BorderRadius.only(
                bottomLeft: Radius.circular(leftRadius ?? 0.0),
                bottomRight: Radius.circular(bottomRadius ?? 0.0),
                topLeft: Radius.circular(topRadius ?? 0.0),
                topRight: Radius.circular(rightRadius ?? 0.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppColor.secondaryColorShadow,
              blurRadius: blurRadius ?? 5,
              offset: Os ?? Offset(5, 10))
        ]);
  }

  static commonStyleImageWithBorder(
      {Color? color,
      double? radius,
      var blurRadius,
      Offset? Os,
      image,
      var isSelected}) {
    return BoxDecoration(
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image)),
        color: color ?? AppColor.white,
        border: Border.all(
          color:
              isSelected ? AppColor.activeColor : AppColor.primaryColorTrance,
          width: 6.0,
        ),
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppColor.secondaryColorShadow,
              blurRadius: blurRadius ?? 5,
              offset: Os ?? Offset(5, 10))
        ]);
  }

  static commonStyleWithImage(
      {Color? color, double? radius, var blurRadius, Offset? Os, image}) {
    return BoxDecoration(
        color: color ?? AppColor.white,
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        image: DecorationImage(image: imageView(url: image)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppColor.secondaryColorShadow,
              blurRadius: blurRadius ?? 5,
              offset: Os ?? Offset(5, 10))
        ]);
  }

  static borderStyle({Color? color, double? radius, var width, var mainColor}) {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      color: mainColor ?? AppColor.white,
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      border: Border.all(
        color: color ?? AppColor.profileColor,
        style: BorderStyle.solid,
        width: width ?? 0.5,
      ),
    );
  }

  static circulerStyle({Color? color, double? radius, var width, var bgColor}) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: bgColor ?? AppColor.primaryColor,
      border: Border.all(
        color: color ?? AppColor.profileColor,
        style: BorderStyle.solid,
        width: width ?? 0.5,
      ),
    );
  }

  static normalStyle({Color? c, var radius}) {
    return BoxDecoration(
      color: c ?? AppColor.white,
      borderRadius: BorderRadius.circular(radius ?? 20),
    );
  }

  static showSnackBar(
      {required String title,
      required String message,
      required Color backgroundColor,
      SnackPosition? position,
      int? duration}) {
    Get.snackbar("", "",
        snackPosition: position,
        duration: Duration(seconds: duration ?? 3),
        titleText: Text(
          title,
          style: AppTextStyle.h4W,
        ),
        messageText: Text(
          message,
          style: AppTextStyle.h5W,
        ),
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  static dialog({
    required String title,
    required String mid,
    required Color backgroundColor,
    required Color buttonColor,
    SnackPosition? position,
    Widget? widget,
    String? textCancel,
    String? textConfirm,
    VoidCallback? funCon,
    VoidCallback? funCan,
  }) {
    Get.defaultDialog(
        title: title,
        middleText: mid,
        titleStyle: AppTextStyle.h3PCD,
        middleTextStyle: AppTextStyle.h4PCD,
        backgroundColor: backgroundColor,
        content: widget,
        textCancel: textCancel,
        textConfirm: textConfirm,
        onConfirm: funCon,
        onCancel: funCan,
        cancelTextColor: AppColor.primaryColorDark,
        confirmTextColor: AppColor.white,
        buttonColor: buttonColor);
  }

  static showLoading({Color? c}) {
    return Center(
      child: CircularProgressIndicator(
        color: c ?? AppColor.activeColor,
      ),
    );
  }

  static myDivider({Color? color, double? n, double? th}) {
    return Divider(
      thickness: th ?? 3,
      indent: n ?? 10.0,
      endIndent: n ?? 10.0,
      color: color ?? AppColor.primaryColorDark,
    );
  }
}

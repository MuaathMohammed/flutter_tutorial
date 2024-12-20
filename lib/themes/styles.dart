import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/helpers/constants.dart';
import 'colors.dart';

class AppTextStyle{
 static final TextStyle h1Big= TextStyle(
  color: AppColors.text,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  );
 static final TextStyle h2Medium= TextStyle(
  color: AppColors.text,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  ); static final TextStyle h3Small= TextStyle(
  color: AppColors.text,
  fontSize: 15,
  fontWeight: FontWeight.bold,
  );
}



 // Replace with your actual path

class ThemeDecorations {
  static BoxDecoration gradientBox(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BoxDecoration(
      gradient:isDarkMode ? AppGradients.backgroundGradientDark:AppGradients.backgroundGradient,
      boxShadow: [
        BoxShadow(
          color: isDarkMode ? Colors.black54 : AppColors.accent,
          blurRadius: 20,
          blurStyle: BlurStyle.normal,
          offset: const Offset(5, 5),
        ),
      ],
    );
  }

  static BoxDecoration gradientButton(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BoxDecoration(
      gradient: AppGradients.buttonGradient,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: isDarkMode ? Colors.black45 : AppColors.accent,
          blurRadius: 10,
          offset: const Offset(3, 3),
        ),
      ],
    );
  }

  static BoxDecoration gradientRoundedButton(BuildContext context) {
    return BoxDecoration(
      gradient: AppGradients.buttonGradient,
      borderRadius: BorderRadius.all(Radius.circular(defaultRadius)),
    );
  }

  static BoxDecoration gradientBoxDecoration(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BoxDecoration(
      gradient: AppGradients.buttonGradient,
      boxShadow: [
        BoxShadow(
          color: isDarkMode ? Colors.black45 : AppColors.background,
          offset: const Offset(0, 5),
          blurRadius: 5.0,
          blurStyle: BlurStyle.inner,
        ),
      ],
      borderRadius: BorderRadius.circular(0),
    );
  }
}


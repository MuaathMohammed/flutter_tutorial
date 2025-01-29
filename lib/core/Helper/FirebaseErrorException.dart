
import '../Shared/CustomWidget/MyCustomWidgets.dart';
import 'AppConstant/AppColorConstant.dart';

class FireBaseError {
  androidExceptions(message) {
    switch (message) {
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        // errorType = authProblems.UserNotFound;
        MyWidget.showSnackBar(
            title: "خطاء",
            message: "لايوجد مستخدم بهذا الاسم",
            backgroundColor: AppColor.dangerColor);
        print(message);
        break;
      case 'The password is invalid or the user does not have a password.':
        //    errorType = authProblems.PasswordNotValid;
        MyWidget.showSnackBar(
            title: "خطاء",
            message: "تأكد كلمة المرور اوالبريد الاكتروني",
            backgroundColor: AppColor.dangerColor);
        print(message);

        break;
      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
        //   errorType = authProblems.NetworkError;
        MyWidget.showSnackBar(
            title: "خطاء",
            message: "تأكد من اتصالك بالشبكة",
            backgroundColor: AppColor.dangerColor);
        print(message);

        break;
      case 'The email address is already in use by another account.':
        //   errorType = authProblems.NetworkError;
        MyWidget.showSnackBar(
            title: "خطاء",
            message: "هذا المستخدم موجود بالفعل",
            backgroundColor: AppColor.dangerColor);
        print(message);

        break;
      case '[firebase_auth/email-already-in-use] The email address is already in use by another account.':
        //   errorType = authProblems.NetworkError;
        MyWidget.showSnackBar(
            title: "خطاء",
            message: "هذا المستخدم موجود بالفعل الرجاء تغيير البيانات",
            backgroundColor: AppColor.dangerColor);
        print(message);

        break;
      // ...
      default:
        print('Case ${message} is not yet implemented');
    }
  }

  iosExceptions(code) {
    switch (code) {
      case 'Error 17011':
        //   errorType = authProblems.UserNotFound;
        MyWidget.showSnackBar(
            title: "خطاء",
            message: "لايوجد مستخدم بهذا الاسم",
            backgroundColor: AppColor.dangerColor);
        break;
      case 'Error 17009':
        // errorType = authProblems.PasswordNotValid;
        MyWidget.showSnackBar(
            title: "خطاء",
            message: "تأكد كلمة المرور اوالبريد الاكتروني",
            backgroundColor: AppColor.dangerColor);
        break;
      case 'Error 17020':
        // errorType = authProblems.NetworkError;
        MyWidget.showSnackBar(
            title: "خطاء",
            message: "تأكد من اتصالك بالشبكة",
            backgroundColor: AppColor.dangerColor);
        break;
      // ...
      default:
        print('Case ${code} is not yet implemented');
    }
  }
}

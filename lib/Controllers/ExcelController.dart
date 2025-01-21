import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import '../Models/Users.dart';

class ExcelController extends GetxController {
  var users = <User>[].obs; // Observable list of users

  Future<void> pickExcelFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      String? filePath = file.path;
      if (filePath != null) {
        readExcelFile(filePath);
      }
    } else {
      Get.snackbar('Error', 'No file selected');
    }
  }

  void readExcelFile(String filePath) {
    try {
      var bytes = File(filePath).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table]!.rows) {
          if (row.length >= 6) {
            User user = User(
              name: row[0]?.value.toString() ?? '',
              age: int.tryParse(row[1]?.value.toString() ?? '0') ?? 0,
              gender: row[2]?.value.toString() ?? '',
              notes: row[3]?.value.toString() ?? '',
              score: int.tryParse(row[4]?.value.toString() ?? '0') ?? 0,
              date: row[5]?.value.toString() ?? '', // Store date as a string
            );
            users.add(user); // Add user to the observable list
          }
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to read the Excel file: $e');
    }
  }
}
String formatDate(String inputDate) {
  try {
    // Try to parse the date if it's in a known format
    DateTime parsedDate = DateTime.parse(inputDate);
    return "${parsedDate.day}/${parsedDate.month}/${parsedDate.year}";
  } catch (e) {
    // If parsing fails, return the original string
    return inputDate;
  }
}
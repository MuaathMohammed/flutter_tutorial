import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:device_info/device_info.dart';
//import 'package:package_info/package_info.dart';

class FireStoreHelper {
  FireStoreHelper._();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  late CollectionReference userslist;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //
  // static saveUser(User user) async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   int buildNumber = int.parse(packageInfo.buildNumber);
  //
  //   Map<String, dynamic> userData = {
  //     "name": user.displayName,
  //     "email": user.email,
  //     "last_login": user.metadata.lastSignInTime?.millisecondsSinceEpoch,
  //     "created_at": user.metadata.creationTime?.millisecondsSinceEpoch,
  //     "role": "user",
  //     "build_number": buildNumber,
  //   };
  //   final userRef = _db.collection("users").doc(user.uid);
  //   if ((await userRef.get()).exists) {
  //     await userRef.update({
  //       "last_login": user.metadata.lastSignInTime?.millisecondsSinceEpoch,
  //       "build_number": buildNumber,
  //     });
  //   } else {
  //     await _db.collection("users").doc(user.uid).set(userData);
  //   }
  //   await _saveDevice(user);
  // }
  //
  // static _saveDevice(User user) async {
  //   DeviceInfoPlugin devicePlugin = DeviceInfoPlugin();
  //   String? deviceId;
  //   Map<String, dynamic>? deviceData;
  //   if (Platform.isAndroid) {
  //     final deviceInfo = await devicePlugin.androidInfo;
  //     deviceId = deviceInfo.androidId;
  //     deviceData = {
  //       "os_version": deviceInfo.version.sdkInt.toString(),
  //       "platform": 'android',
  //       "model": deviceInfo.model,
  //       "device": deviceInfo.device,
  //     };
  //   }
  //   if (Platform.isIOS) {
  //     final deviceInfo = await devicePlugin.iosInfo;
  //     deviceId = deviceInfo.identifierForVendor;
  //     deviceData = {
  //       "os_version": deviceInfo.systemVersion,
  //       "device": deviceInfo.name,
  //       "model": deviceInfo.utsname.machine,
  //       "platform": 'ios',
  //     };
  //   }
  //   final nowMS = DateTime.now().toUtc().millisecondsSinceEpoch;
  //   final deviceRef = _db
  //       .collection("users")
  //       .doc(user.uid)
  //       .collection("devices")
  //       .doc(deviceId);
  //   if ((await deviceRef.get()).exists) {
  //     await deviceRef.update({
  //       "updated_at": nowMS,
  //       "uninstalled": false,
  //     });
  //   } else {
  //     await deviceRef.set({
  //       "updated_at": nowMS,
  //       "uninstalled": false,
  //       "id": deviceId,
  //       "created_at": nowMS,
  //       "device_info": deviceData,
  //     });
  //   }
  // }
  Future<List<QueryDocumentSnapshot>> getData(colName, pid) async {
    userslist = FirebaseFirestore.instance.collection(colName);
    var value = await userslist.where('pid', isEqualTo: pid).get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getDataByGroup(colName, pid, gid) async {
    //var s=[gid];
    //print(s);
    userslist = FirebaseFirestore.instance.collection(colName);
    var value = await userslist
        .where('pid', isEqualTo: pid)
        .where('groupId', arrayContainsAny: [gid]).get();
    print(value.docs);
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getDataByEmail(colName, pid) async {
    userslist = FirebaseFirestore.instance.collection(colName);
    var value = await userslist.where('email', isEqualTo: pid).get();
    return value.docs;
  }

  Future<QueryDocumentSnapshot> getSingle(colName, uid) async {
    userslist = FirebaseFirestore.instance.collection(colName);
    var value = await userslist.where('uid', isEqualTo: uid).get();
    return value.docs[0];
  }

  Future<QueryDocumentSnapshot> getAdmin(colName, uid) async {
    userslist = FirebaseFirestore.instance.collection(colName);
    var value = await userslist.where('uid', isEqualTo: uid).get();
    return value.docs[0];
  }

  Future<void> deleteUser(uid) async {
    userslist = FirebaseFirestore.instance.collection('users');
    // User d=uid;
    // d.delete();
    await userslist.doc(uid).delete().then((value) {
      print("User Deleted");
      print("value");
    }).catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> deleteUserByEmail(uid) async {
    userslist = FirebaseFirestore.instance.collection('users');
    // User d=uid;
    // d.delete();
    await userslist.doc(uid).delete().then((value) {
      print("User Deleted");
      print("value");
    }).catchError((error) => print("Failed to delete user: $error"));
  }

  // Future eleteUser(String email, String password) async {
  //   try {
  //     User? user = await _auth.currentUser;
  //     reauthenticateWithCredential
  //     AuthCredential credentials =
  //     EmailAuthProvider.credential(email: email, password: password);
  //     print(user);
  //     AuthCredential result = await user.reauthenticateWithCredential(credentials);
  //     await DatabaseService(uid: result.user.uid).deleteuser(); // called from database class
  //     await result.user.delete();
  //     return true;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  Future<void> deleteUserFromFireBase(colName, pid, uid) async {
    userslist = FirebaseFirestore.instance.collection('users');
    await userslist
        .doc(pid)
        .collection('children')
        .doc(uid)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> deleteTowCollection(colName1, colName2, id, id2) async {
    userslist = FirebaseFirestore.instance.collection('$colName1');
    await userslist
        .doc(id)
        .collection('$colName2')
        .doc(id2)
        .delete()
        .then((value) => print(" Deleted"))
        .catchError((error) => print("Failed to delete : $error"));
  }

  Future<void> updateUser(colName, map, uid) {
    userslist = FirebaseFirestore.instance.collection(colName);
    return userslist
        .doc(uid)
        .update(map)
        .then((value) => print(" Updated"))
        .catchError((error) => print("Failed to update : $error"));
  }

  Future<List<QueryDocumentSnapshot>> get(colName) async {
    userslist = FirebaseFirestore.instance.collection(colName);
    var value = await userslist.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getById(colName, id, whereID) async {
    userslist = FirebaseFirestore.instance.collection(colName);
    var value = await userslist.where('$whereID', isEqualTo: id).get();
    return value.docs;
  }

  Future<void> update(colName, map, id) {
    userslist = FirebaseFirestore.instance.collection(colName);
    return userslist
        .doc(id)
        .update(map)
        .then((value) => print(" Updated"))
        .catchError((error) => print("Failed to update : $error"));
  }

  Future<void> add(colName, map) {
    userslist = FirebaseFirestore.instance.collection(colName);
    return userslist
        .add(map)
        .then((value) => print(" added"))
        .catchError((error) => print("Failed to added : $error"));
  }

  Future<void> delete(colName, id) async {
    userslist = FirebaseFirestore.instance.collection('$colName');
    await userslist
        .doc(id)
        .delete()
        .then((value) => print(" Deleted"))
        .catchError((error) => print("Failed to delete: $error"));
  }
}

FireStoreHelper fireStoreHelper = FireStoreHelper._();

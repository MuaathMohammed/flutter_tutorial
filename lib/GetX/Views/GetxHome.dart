import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/Localization/AppLanguage.dart';

class GetxHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return _build();
  }




   _build() {
    final AppLanguage appLanguage = Get.find<AppLanguage>();  // Access the controller

    return  Scaffold(
        appBar: _appBar(appLanguage),
        body: _buildBody(appLanguage),

    );

  }

  _appBar(appLanguage) {
    return AppBar(
      title:  GetBuilder<AppLanguage>(  // GetBuilder to listen for updates in AppLanguage
        builder: (value) =>Text('home'.tr)),  // Translate this text using GetX translation
      actions: [
        IconButton(
          icon: Icon(Icons.language),
          onPressed: () {
            // Switch language
            appLanguage.changeLanguage(
                appLanguage.appLocal == 'ar' ? 'en' : 'ar');
          },
        ),
      ],
    );
  }

  _buildBody( appLanguage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text that updates when the language changes
          Text(
            'yaser'.tr,
            style: TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            onPressed: () {
              appLanguage.changeLanguage(
                  appLanguage.appLocal == 'ar' ? 'en' : 'ar');
            },
            child: Text('Change Language'),
          ),

          // Add ListView.builder here
          Expanded(
            child: _buildListView(),
          ),
        ],
      ),
    );
  }

  _buildListView() {
    return ListView.builder(
      itemCount: 3,  // You want 3 items in the list
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item ${index + 1}'),  // Dynamic item content
          subtitle: Text('This is item number ${index + 1}'),
        );
      },
    );
  }
}

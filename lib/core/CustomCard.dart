import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop_app/app/core/Helper/AppConstant/AppColorConstant.dart';
import 'package:my_shop_app/app/core/Helper/AppConstant/AppTextStyleConstant.dart';

class CustomCard extends StatelessWidget {
  String? txtStatus, txtName, txtAddress, imageUrl;
  VoidCallback onTap, favorite;
  CustomCard(
      {Key? key,
      required this.onTap,
      this.imageUrl,
      this.txtAddress,
      this.txtName,
      this.txtStatus,
      required this.favorite});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              new BoxShadow(
                offset: Offset(2, 2),
                color: AppColor.primaryColorShadow,
                blurRadius: 5.0,
              ),
            ]),
        height: 200,
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(7),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    imageUrl ?? "",
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              top: 10,
              left: 1,
              right: 1,
              child: Container(
                margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: AppColor.primaryColorGradientLTrance,
                ),
                // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                child: Center(
                  child: Text(
                    txtStatus!,
                    style: AppTextStyle.h3,
                  ),
                ),
              ),
            ),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              bottom: 45,
              right: 1,
              left: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: AppColor.primaryColorGradientL),
                // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                padding: EdgeInsets.all(5),
                child: Text(
                  txtName!,
                  style: AppTextStyle.h3PCD,
                ),
              ),
            ),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              bottom: 10,
              right: 50,
              left: 1,

              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: AppColor.primaryColorGradientLTrance),
                // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                padding: EdgeInsets.all(10),
                child: Text(
                  txtAddress!,
                  style: AppTextStyle.h5,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              // The Positioned widget is used to position the text inside the Stack widget
              bottom: 5,
              right: 10,
              child: IconButton(
                  icon:
                      Icon(CupertinoIcons.heart, color: AppColor.primaryColor),
                  onPressed: favorite),
            )
          ],
        ),
      ),
    );
  }
}

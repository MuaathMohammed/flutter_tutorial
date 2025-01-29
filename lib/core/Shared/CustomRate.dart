import 'package:flutter/material.dart';

class CustomRate extends StatelessWidget {
  var rating;
  final Function(dynamic)? updateRating;
   var selectedColor;
   var unSelectedColor;
   var iconSize;
   var height;
   var width;
  CustomRate({this.rating, this.updateRating,this.selectedColor,this.unSelectedColor,this.iconSize,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height:height?? 25,width: width?? 25,child: IconButton(icon: rating >= 1 ? Icon(Icons.star, color: selectedColor,size: iconSize,) : Icon(Icons.star_border, color: unSelectedColor,size: iconSize,), onPressed: () => updateRating!(1))),
        SizedBox(height:height??  25,width:width?? 25,child: IconButton(icon: rating >= 2 ? Icon(Icons.star, color: selectedColor,size: iconSize,) : Icon(Icons.star_border, color:unSelectedColor,size: iconSize,), onPressed: () => updateRating!(2))),
        SizedBox(height:height??  25,width:width?? 25,child: IconButton(icon: rating >= 3 ? Icon(Icons.star, color: selectedColor,size: iconSize,) : Icon(Icons.star_border, color: unSelectedColor,size: iconSize,), onPressed: () => updateRating!(3))),
        SizedBox(height:height??  25,width:width?? 25,child: IconButton(icon: rating >= 4 ? Icon(Icons.star, color: selectedColor,size: iconSize,) : Icon(Icons.star_border, color:unSelectedColor,size: iconSize,), onPressed: () => updateRating!(4))),
        SizedBox(height:height??  25,width:width?? 25,child: IconButton(icon: rating >= 5 ? Icon(Icons.star, color: selectedColor,size: iconSize,) : Icon(Icons.star_border, color: unSelectedColor,size: iconSize,), onPressed: () => updateRating!(5))),
      ],
    );
  }
}
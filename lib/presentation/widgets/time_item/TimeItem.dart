import 'package:eduGate_flutter/app/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../data/models/PickupDateModel/HoursModel/HoursResponse.dart';

class TimeItem extends StatelessWidget{
  bool is_selected;
  GestureTapCallback? onTap;
  Hours hours;
  TimeItem({required this.is_selected,required this.onTap,required this.hours});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        // margin: EdgeInsetsDirectional.only(end: 8,bottom: 8),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.dark4, width:1.0,),
          color: is_selected?AppColors.green: Colors.white,
        ),
        child: Center(
          child:  Text(hours.time??"",
            style: TextStyle(fontSize: 14,
                fontFamily: 'lexend_regular',
                decoration: hours.isAvailable!=true?TextDecoration.none:TextDecoration.lineThrough,
                fontWeight: FontWeight.w400,
                color:is_selected?Colors.white: AppColors.dark2),
          ),
        ),
      ),
    );
  }

}
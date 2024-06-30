import 'dart:developer';
import 'package:eduGate_flutter/app/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../data/models/PickupDateModel/PickupDateResponse.dart';


class DateItem extends StatelessWidget {
  bool is_selected;
  GestureTapCallback? onTap;
  PickUpDate pickUpDate;

  DateItem({required this.is_selected,required this.onTap,required this.pickUpDate});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 60,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsetsDirectional.only(end: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.dark4, width: 1.0,),
          color:is_selected?AppColors.primary: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pickUpDate.date??"",
              style:  TextStyle(fontSize: 14,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                  color:is_selected?Colors.white: AppColors.dark3),
            ),
            //const SizedBox(height: 8,),
            // Text("jun 21",
            //   style:  TextStyle(fontSize: 12.sp,
            //       fontFamily: 'lexend_regular',
            //       fontWeight: FontWeight.w400,
            //       color:is_selected?Colors.white: MyColors.Dark1),
            // ),
          ],
        ),
      ),
    );
  }


}
import 'package:flutter/material.dart';

import '../../app/config/app_colors.dart';
import '../../data/models/teachers/Teachers.dart';

class DrDepartmentsItem extends StatelessWidget{
  Title2? teachers;

  DrDepartmentsItem({required this.teachers});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: AppColors.dark4, width: 1.0,),
          color:  Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 3,bottom: 3),
        child: Text(teachers?.category??"",style: TextStyle(fontSize: 12,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            color: AppColors.dark2),textAlign: TextAlign.center,
        ),
      ),
    );
  }

}
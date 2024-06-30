import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/config/app_colors.dart';

class PaymentItem extends StatelessWidget{
  var img,title,subTitle;
  final bool selected;
  GestureTapCallback? onTap;

  PaymentItem({required this.img,required this.title,required this.subTitle,required this.selected,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(bottom: 10,start: 8,end: 8,top: 10),
        margin: const EdgeInsetsDirectional.only(bottom: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(
              color:selected?  AppColors.primary2: AppColors.dark4,
              width: 1.0,),
            color: Colors.white),
        child: Row(
          children: [
            Image.asset(img,width: 40,height: 40,),
            const SizedBox(width: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontSize: 16,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    color: AppColors.dark1),),
                Text(subTitle,style: TextStyle(fontSize: 14,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark2),),
              ],
            ),
            Spacer(),
            selected?SvgPicture.asset('assets/images/radio6.svg'):SvgPicture.asset('assets/images/rado5.svg'),
          ],
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../app/config/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../controllers/bookConsultationController/BookConsultationController.dart';
import '../../../widgets/button.dart';
import '../../../widgets/custom_toast/custom_toast.dart';
import '../../../widgets/date_item/DateItem.dart';
import '../../../widgets/empty_widget/empty_widget.dart';
import '../../../widgets/main_toolbar/main_toolbar.dart';
import '../../../widgets/rate_bar/rate_bar.dart';
import '../../../widgets/time_item/TimeItem.dart';
import '../pay_consultation/pay_consultation_screen.dart';

enum dateGroup{Individually,Package}
enum dateGroup2{minutes,minutes2}
class BookConsultationScreen extends StatefulWidget{
  int userId;
  String userName,userImg,userType,userRate,userPrice30,userPrice60;

  BookConsultationScreen({required this.userId,required this.userName,required this.userImg,
    required this.userType,required this.userRate,required this.userPrice30,required this.userPrice60});

  @override
  State<StatefulWidget> createState() {
    return _BookConsultationScreen();
  }
}

class _BookConsultationScreen extends State<BookConsultationScreen>{
  late AppLocalizations _local;
  late double _height;
  late double _width;
  dateGroup date=dateGroup.Individually;
  dateGroup2 date2=dateGroup2.minutes;
  var selectedFlage=0;
  var selectedFlageTime;
  var price="".obs;
  var duration=30.obs;
  final controller=Get.put(BookConsultationController());

  @override
  void initState() {
    controller.getPickUpDates(widget.userId);
    controller.PickDate=null;
    controller.PickDateHours=null;
    price.value=widget.userPrice30;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _local = AppLocalizations.of(context)!;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: buildMainToolBar(controller,
          _local.book_a_consultation,
              () => Get.back(),isMenu: false),
      body:Obx(() =>!controller.isLoading.value? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.only(top: 20,bottom: 20,start: 8,end: 8),
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8,top: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: AppColors.dark4, width: 1.0,),
                  color: Colors.white),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsetsDirectional.only(start: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image:  widget.userImg==null?
                      const DecorationImage(image:  AssetImage('assets/images/doctor_logo_blue.png')):
                      DecorationImage(image: NetworkImage(widget.userImg),fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.userName??"",style: TextStyle(fontSize: 14,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark1),),
                      Text(widget.userType??"",style: TextStyle(fontSize: 12,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          color: AppColors.dark2),),
                    ],
                  ),
                  const Spacer(),
                  StarRating(
                    rating: double.parse(widget.userRate??"0"),
                    onRatingChanged: (rating) =>
                    {} /* setState(() => this.rating = rating)*/,
                    color: AppColors.yello,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.only(top: 20,bottom: 20,start: 12,end: 12),
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8,top: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: AppColors.dark4, width: 1.0,),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 /* Text(_local.choose_book_session_or_package,style: TextStyle(fontSize: 14,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      color: AppColors.dark1),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor:AppColors.primary,
                            value: dateGroup.Individually,
                            groupValue: date,
                            onChanged: (value){
                              setState(() {
                                date = value!;
                              });

                            },),
                          const SizedBox(width: 5,),
                          Text(_local.individually)
                        ],
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              activeColor:AppColors.primary,
                              value: dateGroup.Package,
                              groupValue: date,
                              onChanged: (value){
                                setState(() {
                                  date = value!;
                                });

                              },),
                            const SizedBox(width: 5,),
                            Text(_local.package)
                          ],
                        ),
                      ),
                    ],
                  ),*/
                  Text(_local.choose_session_duration,style: TextStyle(fontSize: 14,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      color: AppColors.dark1),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Row(
                        children: [
                          Radio(
                            activeColor:AppColors.primary,
                            value: dateGroup2.minutes,
                            groupValue: date2,
                            onChanged: (value){
                              setState(() {
                                date2 = value!;
                                duration.value=30;
                                price.value=widget.userPrice30;
                              });

                            },),
                          const SizedBox(width: 5,),
                          Text(_local.minutes)
                        ],
                      ),
                      const SizedBox(width: 8,),
                       Row(
                        children: [
                          Radio(
                            activeColor:AppColors.primary,
                            value: dateGroup2.minutes2,
                            groupValue: date2,
                            onChanged: (value){
                              setState(() {
                                date2 = value!;
                                duration.value=45;
                                price.value=widget.userPrice60;
                              });

                            },),
                          const SizedBox(width: 5,),
                          Text(_local.minutes2)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.only(top: 20,bottom: 20,start: 12,end: 12),
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8,top: 20),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: AppColors.dark4, width: 1.0,),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_local.choose_date,style: TextStyle(fontSize: 14,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      color: AppColors.dark1),),
                  dateList(),
                  const SizedBox(height: 8),
                  Obx(() =>!controller.isLoading2.value? timeList()
                      : Center(child: CircularProgressIndicator(color: AppColors.primary),)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/dot1.svg'),
                          Text(_local.available,style: TextStyle(fontSize: 12,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              color: AppColors.dark2),),
                        ],
                      ),
                      const SizedBox(width: 10,),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/dot2.svg'),
                          Text(_local.specific,style: TextStyle(fontSize: 12,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              color: AppColors.dark2),),
                        ],
                      ),
                      const SizedBox(width: 10,),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/dot3.svg'),
                          Text(_local.unavailable,style: TextStyle(fontSize: 12,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              color: AppColors.dark2),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 12, end: 12, bottom: 8,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_local.selected_period,style: TextStyle(fontSize: 14,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      color: AppColors.dark1),),
                  controller.finalPickupTime.value!=""?Container(
                    padding: const EdgeInsetsDirectional.only(top: 8,bottom: 8,start: 12,end: 12),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: AppColors.primary, width: 1.0,),
                        color: Colors.white),
                    child: Text(controller.finalPickupTime.value,style: TextStyle(fontSize: 12,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary),),
                  ):Container(),
                  myButton(() {
                    if(controller.PickDate!=null&&controller.PickDateHours!=null){
                      controller.finalPickupTime.value=controller.PickDate+" "+controller.PickDateHours;
                      Get.to(
                          PayConsultationScreen(
                            userImg: widget.userImg,
                            userType: widget.userType,
                            userName: widget.userName,
                            dateTime: controller.finalPickupTime.value??"",
                            price: price.value??"",
                            sessionDuration: duration.value,
                            userId: widget.userId,
                          ),
                          duration: const Duration(
                              seconds: 0,
                              milliseconds:
                              300), //duration of transitions, default 1 sec
                          transition: Transition.downToUp);
                    }else{
                      controller.showToast(_local.please_select_date_and_time_first,
                          gravity: Toast.top,isSuccess: false);
                    }
                  }, _local.book_now+" "+((price.value=="null")?"0.0":price.value)),
                ],
              ),
            ),
          ],
        ),
      ):Center(child: CircularProgressIndicator(color: AppColors.MainColor,))),
    );
  }

  Widget dateList() {
    if(controller.pickUpDateList.isNotEmpty){
      return Container(
        height: 52,
        margin: const EdgeInsetsDirectional.only(bottom: 8),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.pickUpDateList.length,
            itemBuilder: (context,int index){
              return DateItem(
                  is_selected: selectedFlage==index,
                  onTap: () {
                    setState(() {
                      selectedFlage=index;
                      selectedFlageTime=null;
                      controller.PickDate=controller.pickupDateResponse.value.data![index].date;
                      controller.getPickUpHoursDates(widget.userId);
                    });
                  },
                  pickUpDate: controller.pickUpDateList[index]
              );
            }
        ),
      );
    }else{
      return Center(
        child: SizedBox(
            height: 250,
            child:buildEmptyWidget(context,SvgPicture.asset(Assets.imagesNoFavorites),
                _local.there_are_no_times,
                _local.your_times_will_appear_here
            )),
      );
    }

  }

  Widget timeList() {

      return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (2 / 1),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: controller.pickUpHoursList.length,
          itemBuilder: (context, int index) {
            return TimeItem(
                is_selected: selectedFlageTime == index,
                onTap: controller.hoursResponse.value.data![index]
                    .isAvailable == false ? () {
                  setState(() {
                    selectedFlageTime = index;
                    String inputTime = controller.hoursResponse.value
                        .data![index].time!;
                    final inputFormat = DateFormat('h:mm a');
                    final outputFormat = DateFormat('HH:mm');
                    DateTime dateTime = inputFormat.parse(inputTime);
                    controller.PickDateHours = outputFormat.format(dateTime);
                    controller.finalPickupTime.value=controller.PickDate+" "+controller.PickDateHours;
                  });
                } : null,
                hours: controller.pickUpHoursList[index]
            );
          });

  }

  buildEmptyWidget(BuildContext context,Widget imageWidget,String title,String description ){
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SizedBox(height: MediaQuery.of(context).size.height*0.15,),
            imageWidget,
            Text(title,style: AppTextStyles.title.copyWith(
                fontSize: 20
            ),textAlign: TextAlign.center,),
            Text(description,style: AppTextStyles.title2.copyWith(
                fontSize: 16
                ,
                color: AppColors.gray
            ),textAlign: TextAlign.center,)

          ],
        ),
      ),
    );
  }

}
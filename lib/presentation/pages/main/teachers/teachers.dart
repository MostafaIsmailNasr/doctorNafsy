import 'package:eduGate_flutter/presentation/pages/main/teachers/psychological/psychological_screen.dart';
import 'package:eduGate_flutter/presentation/pages/main/teachers/therapist/therapist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../app/config/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../controllers/teachers/teachers_controller.dart';
import '../../../widgets/custom_toast/custom_toast.dart';
import '../../../widgets/empty_widget/empty_widget.dart';
import '../../../widgets/healers_search_item/HealersSearchItem.dart';
import '../../../widgets/main_toolbar/main_toolbar.dart';
import '../../../widgets/psychiatrists_item/PsychiatristsItem.dart';
import '../../../widgets/teacher_item/teacher_item.dart';
import '../../../widgets/trainers_item/TrainersItem.dart';
import 'coach/coach_screen.dart';

class TeachersScreen extends GetView<TeachersController> {
  late AppLocalizations _local;

  @override
  Widget build(BuildContext context) {
    ToastMContext().init(context);

    
    print("my courses==>");
    ToastMContext().init(context);
    _local = AppLocalizations.of(context)!;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white24,
          appBar: buildMainToolBar(controller, isMenu: true, _local.teachers,()=>controller.toggleDrawer()),
          body: Column(
            children: [
              _buildTabBar(context),
              /*Container(
                margin: EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 10),
                child: PreferredSize(
                    preferredSize: Size.fromHeight(130),

                    ///Note: Here I assigned 40 according to me. You can adjust this size acoording to your purpose.
                    child: Align(
                        alignment: controller.store.lang=="ar"?Alignment.centerRight:Alignment.centerLeft,
                        child:
                        TabBar(
                            isScrollable: true,
                            unselectedLabelColor: AppColors.primary,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: EdgeInsets.symmetric(horizontal: 7),
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                *//*color: AppColors.primary*//*),
                            tabs: [
                              Tab(
                                  child: Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                       *//* border: Border.all(
                                          *//**//*  color: AppColors.primary, *//**//*width: 1)*//*),
                                    child: Row(
                                      children: [
                                        Text(_local.teachers,style: AppTextStyles.titleToolbar.copyWith(
                                            color: Colors.black,
                                          fontSize: 16
                                        ),),
                                        SizedBox(width: 10,),
                                    Obx(() =>Text((controller.teachersList.length??"0").toString(),style: AppTextStyles.titleToolbar.copyWith(
                                            color: AppColors.primary,
                                            fontSize: 16
                                        ),))
                                      ],
                                    ),
                                  ))
                            ])
                    )),
              ),*/
              Expanded(
                child: TabBarView(
                    children: [
                      PsychologicalScreen(),
                      TherapistScreen(),
                      CoachScreen(),
                ]),
              ),
            ],
          ),
        ));
  }

  _buildTabBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
      child: PreferredSize(
          preferredSize: Size.fromHeight(130),

          ///Note: Here I assigned 40 according to me. You can adjust this size acoording to your purpose.
          child: Align(
              alignment: Alignment.centerLeft,
              child:  Stack(
                children: [
                  /*TabBar(
                      isScrollable: true,physics: NeverScrollableScrollPhysics(),
                      indicatorColor: Colors.black,
                      unselectedLabelColor: AppColors.gray,
                      labelStyle: AppTextStyles.title2,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding:
                      EdgeInsets.symmetric(horizontal: 7),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                          border: Border.all(
                              color: Colors.white, width: 1)
                      ),
                      tabs: [
                        Tab(
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(16),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                            )),
                        Tab(
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(16),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                            )),
                        Tab(
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(16),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                            )),
                      ]),*/
                  Theme(
                    data: Theme.of(context).copyWith(colorScheme: Theme.of(context).colorScheme.copyWith(surfaceVariant: Colors.transparent)),
                    child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: AppColors.gray,
                        labelStyle: AppTextStyles.title4,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding:
                        const EdgeInsets.symmetric(horizontal: 7),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.primary,
                            border: Border.all(
                                color: Colors.white, width: 1)                      ),
                        tabs: [
                          Tab(
                              child: Container(
                                width: 120,
                                /* decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            */ /*border: Border.all(
                                                color: Colors.white, width: 1)*/ /*),*/
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(" ${_local.welcomeInEclass}"),
                                ),
                              )),
                          Tab(
                              child: Container(
                                width: 120,
                                /* decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                border: Border.all(
                                                    color: AppColors.primary, width: 1)),*/
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(" ${_local.psychotherapist2}"),
                                ),
                              )),
                          Tab(
                              child: Container(
                                width: 120,
                                /* decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                border: Border.all(
                                                    color: AppColors.primary, width: 1)),*/
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(" ${_local.trainers}"),
                                ),
                              )),
                        ]),
                  )
                ],
              ))),
    );
  }

}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../app/config/app_text_styles.dart';
import '../../../controllers/consultingController/ConsultingController.dart';
import '../../../widgets/active_item/ActiveItem.dart';
import '../../../widgets/finished_item/FinishedItem.dart';
import '../../../widgets/main_toolbar/main_toolbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'active/active_screen.dart';
import 'end/end_screen.dart';

class ConsultingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ConsultingScreen();
  }
}

class _ConsultingScreen extends State<ConsultingScreen>{
  late AppLocalizations _local;
  late double _height;
  late double _width;
  final controller=Get.put(ConsultingController());
  
  @override
  void initState() {
    //controller.getConsultantsList("active");
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    _local = AppLocalizations.of(context)!;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white24,
          appBar: buildMainToolBar(controller,
              _local.consulting,
                  () =>
              controller.toggleDrawer(),isMenu: true),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTabBar(),
              const SizedBox(height: 12,),
              Expanded(
                child: TabBarView(children: [
                  ActiveScreen(),
                  EndScreen(),
                ]),
              ),
            ],
          ),
        ));
  }

  _buildTabBar() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
      child: PreferredSize(
          preferredSize: Size.fromHeight(130),

          ///Note: Here I assigned 40 according to me. You can adjust this size acoording to your purpose.
          child: Container(
            child: Align(
                alignment: controller.store.lang=="ar"?Alignment.centerRight:Alignment.centerLeft,
                child: Stack(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(colorScheme: Theme.of(context).colorScheme.copyWith(surfaceVariant: Colors.transparent)),
                      child: TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.black,
                          unselectedLabelColor: AppColors.gray,
                          labelStyle: AppTextStyles.title4,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: const EdgeInsets.symmetric(horizontal: 7),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.primary,
                          ),
                          tabs: [
                            Tab(
                                child: Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,
                                      border:
                                      Border.all(color: Colors.white, width: 1)),
                                )),
                            Tab(
                                child: Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,
                                      border:
                                      Border.all(color: Colors.white, width: 1)),
                                )),
                          ]),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(colorScheme: Theme.of(context).colorScheme.copyWith(surfaceVariant: Colors.transparent)),
                      child: TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.white,
                          unselectedLabelColor: AppColors.gray,
                          labelStyle: AppTextStyles.title4,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.symmetric(horizontal: 7),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.primary,
                          ),
                          tabs: [
                            Tab(
                                child: Container(
                                  width: 120,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(_local.active),
                                  ),
                                )),
                            Tab(
                                child: Container(
                                  width: 120,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(_local.finished),
                                  ),
                                )),
                          ]),
                    )
                  ],
                )),
          )),
    );
  }

  //  _active() {
  //   return ListView.builder(
  //       //  physics: ClampingScrollPhysics(),
  //       shrinkWrap: true,
  //       scrollDirection: Axis.vertical,
  //       itemCount: controller.consultantsList.length,
  //       itemBuilder: (context, position) {
  //         return ActiveItem(
  //           consultant: controller.consultantsList[position],
  //         );
  //       });
  // }
  //
  // _finished() {
  //   return ListView.builder(
  //     //  physics: ClampingScrollPhysics(),
  //       shrinkWrap: true,
  //       scrollDirection: Axis.vertical,
  //       itemCount: 5,
  //       itemBuilder: (context, position) {
  //         return FinishedItem();
  //       });
  // }

}


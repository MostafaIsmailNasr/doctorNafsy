import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/app_text_styles.dart';
import '../../../data/models/home/course_details/Course.dart';
import '../../../data/models/search/SearchListModel/SearchListResponse.dart';
import '../../../generated/assets.dart';
import '../../controllers/course_details/course_details_binding.dart';
import '../../controllers/search/search_controller.dart';
import '../../widgets/custom_toast/custom_toast.dart';
import '../../widgets/empty_widget/empty_widget.dart';
import '../../widgets/main_toolbar/main_toolbar.dart';
import '../../widgets/psychiatrists_item/PsychiatristsItem.dart';
import '../../widgets/rate_bar/rate_bar.dart';
import '../../widgets/search_input.dart';
import '../../widgets/sold_course_item/sold_course_item.dart';
import '../../widgets/teacher_item/teacher_item.dart';
import '../../widgets/trainers_item/TrainersItem.dart';
import '../course_details/course_details.dart';
import '../main/teachers/therapist/therapist_screen.dart';

class SearchScreen extends GetView<MySearchController> {
  late AppLocalizations _local;

  SearchScreen(){
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    ToastMContext().init(context);
    // itemId=0;
    // isSelected=true;
    _local = AppLocalizations.of(context)!;

    return Obx(
      () => Scaffold(
          backgroundColor: Colors.white24,
          appBar: buildMainToolBar(controller, _local.search, () => Get.back()),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: MySearchTextFieldForm(
                  onFieldSubmitted: (value) =>
                      {
                        if(controller.type=="course"){
                          controller.getSearchList("course")
                        }else{
                          controller.getSearchList("user")
                        }
                      },
                  controller: controller.searcTextController,
                  assetNamePrefex: Assets.imagesSearch,
                  hint: _local.what_will_you_find,
                ),
              ),
              controller.isFirstShow.value
                  ? Expanded(
                      child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20, top: 15),
                              child: Text(
                                _local.suggested,
                                style: AppTextStyles.titleToolbar,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            controller.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : _buildSuggested(
                                    controller.mySuggestedCoursesList.value)
                          ]),
                    ))
                  : Expanded(
                      child: Column(
                        children: [
                          //_buildTabBar(),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.type.value = "course";
                                  controller.isSelected.value = true;
                                  controller.itemId.value = 0;
                                  controller.getSearchList("course");
                                },
                                child: Container(
                                  width: 120,
                                  height: 50,
                                  margin: const EdgeInsetsDirectional.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color:
                                          controller.isSelected.value == true && controller.itemId.value == 0
                                                  ? AppColors.primary4
                                                  : Colors.white,
                                          width: 1),
                                      color: controller.isSelected.value == true && controller.itemId.value == 0
                                          ? AppColors.primary4
                                          : Colors.white),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(style:
                                        TextStyle(color:controller.isSelected.value == true && controller.itemId.value == 0
                                            ? Colors.white:Colors.black54),
                                        "(${controller.searchCoursesList2.length}) ${_local.the_courses}"),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.type.value = "user";
                                  controller.isSelected.value = true;
                                  controller.itemId.value = 1;
                                  controller.getSearchList("user");
                                },
                                child: Container(
                                  width: 120,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color:
                                          controller.isSelected.value == true && controller.itemId.value == 1
                                                  ? AppColors.primary4
                                                  : Colors.white,
                                          width: 1),
                                      color: controller.isSelected.value == true && controller.itemId.value == 1
                                          ? AppColors.primary4
                                          : Colors.white),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      style: TextStyle(color:controller.isSelected.value == true && controller.itemId.value == 1
                                          ? Colors.white:Colors.black54),
                                        "(${controller.searchTeachersList2.length}) ${_local.teachers}"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          controller.isLoading.value?
                const Expanded(child: Center(child: CircularProgressIndicator()))
                    :Expanded(
                  child:controller.type.value=="course"? _buildTabCourses(controller.searchCoursesList2.value,context)
                      :_buildTabTeacher(controller.searchTeachersList2.value,context),
                ),
              ],),
            )

          ],
        )),);
  }

  _buildTabBar() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
      child: PreferredSize(
          preferredSize: Size.fromHeight(130),

          ///Note: Here I assigned 40 according to me. You can adjust this size acoording to your purpose.
          child: Align(
              alignment: Alignment.centerLeft,
              child:  Stack(
                children: [
                  TabBar(
                    isScrollable: true,
                      indicatorColor: Colors.black,
                      unselectedLabelColor: AppColors.gray,
                      labelStyle: AppTextStyles.title2,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding:
                      EdgeInsets.symmetric(horizontal: 7),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primary,
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
                      ]),
                  TabBar(
                    isScrollable: true,
                      indicatorColor: Colors.white,
                      unselectedLabelColor: AppColors.gray,
                      labelStyle: AppTextStyles.title2,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding:
                      EdgeInsets.symmetric(horizontal: 7),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primary,
                      ),
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
                                child: Text("(${controller.searchCoursesList2.length}) ${_local.the_courses}"),
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
                                child: Text("(${controller.searchTeachersList2.length}) ${_local.teachers}"),
                              ),
                            )),
                      ])
                ],
              ))),
    );
  }

  _buildTabCourses(List<dynamic> courses,BuildContext context) {
    return courses.isEmpty? buildEmptyWidget(context,SvgPicture.asset(Assets.imagesNoSearch),
        _local.no_result_found,
        _local.try_more_accurate_words_to_get_results
    ):ListView.builder(
      // physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: courses.length,
      itemBuilder: (context, position) {
        return _buildSearchCourseItem(courses[position], ()=>Get.to(CourseDetailsScreen(courses[position].id.toString()),binding: CourseDetailsBinding())
        );
      },
    );
  }

  _buildTabTeacher(List<dynamic> courses,BuildContext context) {
    return courses.isEmpty? buildEmptyWidget(context,SvgPicture.asset(Assets.imagesNoSearch),
        _local.there_is_no_teacher,
        _local.there_are_no_teachers_yet
    ):ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: controller.searchTeachersList2.length,
        itemBuilder: (context, position) {
          return PsychiatristsItem(
              null,
              null,
              controller.searchTeachersList2[position],
              "search"
          );
        });
  }


  Widget _buildSearchCourseItem(Webinars2 course,GestureTapCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 2,left: 20,right: 20),
        child: Row(
          children: [
            Container(
              height: 70,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
              width: 90,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    height: 70,

                    course.image??""/*"https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"*/,
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, loadingProgress) =>
                    (loadingProgress == null)
                        ? child
                        : const Padding(
                        padding: EdgeInsets.all(15),
                        child: CircularProgressIndicator()),
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Image(image: AssetImage('assets/images/doctor_logo_blue.png'))),
                  )),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title??"",
                    style: AppTextStyles.authTitleStyle.copyWith(fontSize: 14,
                        color: Colors.black),
                  ),
               Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                 Row(
                   children: [
                     SvgPicture.asset(Assets.imagesUser),
                     Text(course!.teacher?.fullName??"",
                       style: AppTextStyles.body.copyWith(fontSize: 13),
                     ),
                   ],
                 ),
                 Container(
                   width: 100,
                   child: StarRating(
                     rating: double.parse(//course.rate??
                         "0"),
                     onRatingChanged: (rating) =>
                     {} /* setState(() => this.rating = rating)*/,
                     color: AppColors.yello,
                   ),
                 ),
                     const SizedBox(width: 1,)
               ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(Assets.imagesClock,
                              ),
                            const SizedBox(width: 5,),
                            Text(
                              course.duration.toString()??"",
                              style: AppTextStyles.body
                                  .copyWith(fontSize: 13, color: AppColors.gray2),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "${course.price??"0.0"} ${_local.egp}",
                        style: AppTextStyles.body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: AppColors.primary),
                      ),
                      const SizedBox(width: 10,)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  _buildSuggested(List<dynamic> courses) {
    return ListView.builder(
       physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: courses.length,
      itemBuilder: (context, position) {
        return getSoldCourseItem(_local, courses[position]);
      },
    );
  }
}

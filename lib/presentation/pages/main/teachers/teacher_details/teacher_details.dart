import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../app/config/app_colors.dart';
import '../../../../../app/config/app_text_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../controllers/teachers/teachers_controller.dart';
import '../../../../widgets/DrDepartmentsItem.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/custom_toast/custom_toast.dart';
import '../../../../widgets/main_toolbar/main_toolbar.dart';
import '../../book_consultation/book_consultation_screen.dart';
import 'teacher_bio.dart';
import 'teacher_courses.dart';

class TeacherDetailsScreen extends GetView<TeachersController> {
  late AppLocalizations _local;
  late double _height;
  late double _width;
  String teacherID;

  TeacherDetailsScreen(this.teacherID);

  @override
  Widget build(BuildContext context) {
    ToastMContext().init(context);
    
    // RegisterBinding().dependencies();
    ToastMContext().init(context);

    Future.delayed(Duration.zero, () {
      //your code goes here
      controller.getTeacherDetails(teacherID);
    });

    _local = AppLocalizations.of(context)!;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.height;
    return Obx(() => controller.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : DefaultTabController(
            length: 3,
            child: Scaffold(
                backgroundColor: Colors.white24,
                appBar: buildMainToolBar(controller,_local.profile_personly, () => {Get.back()}),
                body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                          titleSpacing: 0,
                          backgroundColor: AppColors.pagbackground,
                          automaticallyImplyLeading: true,
                          //   expandedHeight: 10.0,
                          toolbarHeight: 0,
                          expandedHeight: 0.0,
                          floating: false,
                          pinned: false,
                          stretch: false,
                          bottom: PreferredSize(
                              preferredSize: Size.fromHeight(_height * 0.59),
                              child: Container(
                                /* margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),*/
                                child: _buildHeader(context),
                              ))),
                    ];
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildTabBar(context),
                      Expanded(
                        child: TabBarView(children: [
                          TeacherCourses((controller.teachers?.value?.webinars)??[]),
                          ///الفديوهات/////
                          //Container(),
                          ///الشهادات/////
                          TeacherBio((controller.teachers?.value?.certificate ?? "").toString()),
                          ///نبذة//////
                          TeacherBio((controller.teachers?.value?.about ?? "").toString()),
                        ]),
                      ),
                      /*Container(
                          height: 100,
                          // color: Colors.black,
                          child: Stack(
                            children: [
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ]),
                                    child: Obx(()=>Padding(
                                      padding: EdgeInsets.all(10),
                                      child: myButton(() {
                                        controller.isFollow.value =
                                            !controller.isFollow.value;
                                        controller.followTeacher(teacherID,controller.isFollow.value);
                                      },
                                          ( controller.isFollow.value)
                                              ? _local.followed
                                              : _local.follow,
                                          isFilled:  controller.isFollow.value),
                                    )),
                                  ))
                            ],
                          ))*/
                      /* Container(
                margin: EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 100),
                child: myButton(() {

                }, _local.save),
              )*/
                    ],
                  ),
                ))));
  }

  _buildTabBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
      child: PreferredSize(
          preferredSize: Size.fromHeight(130),

          ///Note: Here I assigned 40 according to me. You can adjust this size acoording to your purpose.
          child: Container(
            //    color: Colors.white,
            child: Align(
                alignment: controller.store.lang=="ar"?Alignment.centerRight:Alignment.centerLeft,
                child: Theme(
                  data: Theme.of(context).copyWith(colorScheme: Theme.of(context).colorScheme.copyWith(surfaceVariant: Colors.transparent)),
                  child: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.white,
                      unselectedLabelColor: AppColors.gray,
                      labelStyle: AppTextStyles.title4,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 7),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primary2,
                      ),
                      tabs: [
                        Tab(
                            child: SizedBox(
                              width: 120,
                              /* decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              */ /*border: Border.all(
                              color: Colors.white, width: 1)*/ /*),*/
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(_local.the_courses),),
                            )),
                        // Tab(
                        //     child: SizedBox(
                        //       width: 120,
                        //       /* decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(16),
                        //       border: Border.all(
                        //       color: AppColors.primary, width: 1)),*/
                        //       child: Align(
                        //         alignment: Alignment.center,
                        //         child: Text(_local.videos),),
                        //     )),
                        Tab(
                            child: SizedBox(
                              width: 120,
                              /* decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                              color: AppColors.primary, width: 1)),*/
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(_local.certificates),),
                            )),
                        Tab(
                            child: SizedBox(
                              width: 120,
                              /* decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                              color: AppColors.primary, width: 1)),*/
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(_local.brief),),
                            )),
                      ]),
                )),
          )),
    );
  }

  _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                height: 80,
                width: 80,
                controller.teachers?.value?.avatar ?? "",
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) =>
                    (loadingProgress == null)
                        ? child
                        : const Center(child: CircularProgressIndicator()),
                errorBuilder: (context, error, stackTrace) => const Center(
                    child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image(image: AssetImage('assets/images/doctor_logo_blue.png'),))),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            controller.teachers?.value?.fullName ?? "",
            style: AppTextStyles.title.copyWith(color: AppColors.gray),
            maxLines: 1,
          ),
        ),
        const SizedBox(height: 10,),
        DrDepartmentsList(),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/money.svg'),
            const SizedBox(width: 8,),
            Text((((controller.teachers.value!.price30.toString())=="null"?
            "0.0"
                :(controller.teachers.value!.price30.toString()))+_local.e_minutes)
              +" - "
                +(((controller.teachers.value!.price45.toString())=="null"?
                "0.0"
                    :(controller.teachers.value!.price45.toString()))+_local.ee_minutes)
              ,style: TextStyle(fontSize: 13,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w400,
                color: AppColors.primary),textAlign: TextAlign.center,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
                child: myButton(() {
                  Get.to(BookConsultationScreen(
                    userId: controller.teachers.value!.id!,
                    userImg: controller.teachers.value!.avatar!,
                    userName: controller.teachers.value!.fullName!,
                    userType: controller.teachers.value!.teacherType!,
                    userRate: controller.teachers.value!.rate!,
                    userPrice30: controller.teachers.value!.price30.toString()??"",
                    userPrice60: controller.teachers.value!.price45.toString()??"",
                  ),
                      duration: const Duration(
                          seconds: 0,
                          milliseconds:
                          300), //duration of transitions, default 1 sec
                      transition: Transition.downToUp); //transition effect);
                }, _local.book_a_consultation)),
            Expanded(
                flex: 2,
                child: Obx(()=>Padding(
                  padding: const EdgeInsets.all(10),
                  child: myButton(() {
                    controller.isFollow.value =
                    !controller.isFollow.value;
                    controller.followTeacher(teacherID,controller.isFollow.value);
                  },
                      ( controller.isFollow.value)
                          ? _local.followed
                          : _local.follow,
                      isFilled:  controller.isFollow.value),
                ))
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SvgPicture.asset(Assets.imagesTeachersStudents),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    _local.number_of_sessions,
                    style: AppTextStyles.title2.copyWith(color: AppColors.gray),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    (controller.teachers?.value?.consultationsCount ?? "").toString(),
                    style: AppTextStyles.title
                        .copyWith(color: AppColors.gray, fontSize: 14),
                    maxLines: 1,
                  ),
                )
              ],
            ),
            Column(
              children: [
                SvgPicture.asset(Assets.imagesTeacherCourses),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    _local.the_courses,
                    style: AppTextStyles.title2.copyWith(color: AppColors.gray),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    (controller.teachers?.value?.coursesCount ?? "").toString(),
                    style: AppTextStyles.title
                        .copyWith(color: AppColors.gray, fontSize: 14),
                    maxLines: 1,
                  ),
                )
              ],
            ),
            Column(
              children: [
                SvgPicture.asset(Assets.imagesTeachersFollowers),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    _local.the_date_of_join,
                    style: AppTextStyles.title2.copyWith(color: AppColors.gray),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    (controller.teachers?.value?.createdAt ?? "").toString(),
                    style: AppTextStyles.title
                        .copyWith(color: AppColors.gray, fontSize: 14),
                    maxLines: 1,
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 10,),
      ],
    );
  }

  Widget DrDepartmentsList(){
    return SizedBox(
      height: 30,
      child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount:controller.teachers.value!.categories2!.title?.length,
            itemBuilder: (context,int index){
              return DrDepartmentsItem(
                  teachers: controller.teachers.value!.categories2!.title?[index],
              );
            }
        ),
    );
  }
}

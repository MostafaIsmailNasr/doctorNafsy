import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:video_player/video_player.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/app_text_styles.dart';
import '../../../domain/usecases/splash_use_case.dart';
import '../../../generated/assets.dart';
import '../../controllers/splash/splash_controller.dart';
import '../../widgets/custom_toast/custom_toast.dart';
import '../../widgets/jumping_dot.dart';

class SplashScreen extends GetView<SplashController> {
  late AppLocalizations _local;

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastMContext().init(context);

    ToastMContext().init(context);
    _local = AppLocalizations.of(context)!;
    return Material(
      color: AppColors.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                  height: 250,
                  child: Image.asset(Assets.imagesDoctorLogoWhite),),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 50),
            child: Center(
              child: JumpingDots(
                color: Colors.white,
                radius: 10,
                numberOfDots: 3,
                animationDuration: Duration(milliseconds: 200),
              ),
            ),
          )
        ],
      ),
    );
  }
}

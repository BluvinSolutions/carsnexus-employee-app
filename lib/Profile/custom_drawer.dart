import 'package:carsnexus_employee/Authentication/login_screen.dart';
import 'package:carsnexus_employee/Earning/earning_history_screen.dart';
import 'package:carsnexus_employee/Localization/localization_constant.dart';
import 'package:carsnexus_employee/Profile/notification_screen.dart';
import 'package:carsnexus_employee/Profile/reviews_screen.dart';
import 'package:carsnexus_employee/Profile/settings_screen.dart';
import 'package:carsnexus_employee/Service%20Request/service_request_screen.dart';
import 'package:carsnexus_employee/Theme/Theme.dart';
import 'package:carsnexus_employee/Theme/colors.dart';
import 'package:carsnexus_employee/Utils/lang_const.dart';
import 'package:carsnexus_employee/Utils/preferences_names.dart';
import 'package:carsnexus_employee/Utils/shared_preferences.dart';
import 'package:carsnexus_employee/Widget/app_bar_back_icon.dart';
import 'package:carsnexus_employee/Widget/custom_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .8,
      child: ListView(
        padding: const EdgeInsets.only(left: 8, right: 8),
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  const Align(alignment: Alignment.topLeft, child: AppBarBack()),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: Amount.screenMargin,
                    child: Column(
                      children: [
                        ExtendedImage.network(
                          SharedPreferenceHelper.getString(PreferencesNames.imageUrl),
                          clipBehavior: Clip.hardEdge,
                          fit: BoxFit.cover,
                          shape: BoxShape.circle,
                          height: 65,
                          width: 65,
                          loadStateChanged: (ExtendedImageState state) {
                            switch (state.extendedImageLoadState) {
                              case LoadState.loading:
                                return const SizedBox(
                                  height: 0,
                                  width: 0,
                                );
                              case LoadState.completed:
                                return ExtendedImage.network(
                                  SharedPreferenceHelper.getString(PreferencesNames.imageUrl),
                                  width: 65,
                                  height: 65,
                                  clipBehavior: Clip.hardEdge,
                                  fit: BoxFit.cover,
                                  shape: BoxShape.circle,
                                );
                              case LoadState.failed:
                                return Image.asset("assets/app/profile.png");
                            }
                          },
                        ),
                        Text(
                          SharedPreferenceHelper.getString(PreferencesNames.userName),
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                        Text(
                          SharedPreferenceHelper.getString(PreferencesNames.email),
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.subText),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          const HeightBox(Amount.screenMargin),

          ///Service requests
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ServiceRequestScreen(),
                ),
              );
            },
            shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.k08, side: BorderSide(color: AppColors.stroke)),
            leading: const Icon(
              CupertinoIcons.briefcase_fill,
              size: 22,
              color: AppColors.primary,
            ),
            contentPadding: const EdgeInsets.only(left: Amount.screenMargin, right: Amount.screenMargin, top: 5, bottom: 5),
            visualDensity: const VisualDensity(vertical: -4, horizontal: 4),
            minLeadingWidth: 0,
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
              color: AppColors.stroke,
            ),
            title: Text(
              getTranslated(context, LangConst.serviceRequests).toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, color: AppColors.bodyText),
            ),
          ),
          const HeightBox(Amount.screenMargin),

          ///Earning history
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EarningHistoryScreen(),
                ),
              );
            },
            shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.k08, side: BorderSide(color: AppColors.stroke)),
            leading: const Icon(
              CupertinoIcons.money_dollar_circle_fill,
              size: 22,
              color: AppColors.primary,
            ),
            contentPadding: const EdgeInsets.only(left: Amount.screenMargin, right: Amount.screenMargin, top: 5, bottom: 5),
            visualDensity: const VisualDensity(vertical: -4, horizontal: 4),
            minLeadingWidth: 0,
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
              color: AppColors.stroke,
            ),
            title: Text(
              getTranslated(context, LangConst.earningHistory).toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, color: AppColors.bodyText),
            ),
          ),
          const HeightBox(Amount.screenMargin),

          ///Review
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ReviewsScreen()));
            },
            shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.k08, side: BorderSide(color: AppColors.stroke)),
            leading: const Icon(
              CupertinoIcons.star_fill,
              size: 22,
              color: AppColors.primary,
            ),
            contentPadding: const EdgeInsets.only(left: Amount.screenMargin, right: Amount.screenMargin, top: 5, bottom: 5),
            visualDensity: const VisualDensity(vertical: -4, horizontal: 4),
            minLeadingWidth: 0,
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
              color: AppColors.stroke,
            ),
            title: Text(
              getTranslated(context, LangConst.review).toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, color: AppColors.bodyText),
            ),
          ),
          const HeightBox(Amount.screenMargin),

          ///notification
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationScreen()));
            },
            shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.k08, side: BorderSide(color: AppColors.stroke)),
            leading: const Icon(
              Icons.notifications,
              size: 22,
              color: AppColors.primary,
            ),
            contentPadding: const EdgeInsets.only(left: Amount.screenMargin, right: Amount.screenMargin, top: 5, bottom: 5),
            visualDensity: const VisualDensity(vertical: -4, horizontal: 4),
            minLeadingWidth: 0,
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
              color: AppColors.stroke,
            ),
            title: Text(
              getTranslated(context, LangConst.notification).toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, color: AppColors.bodyText),
            ),
          ),
          const HeightBox(Amount.screenMargin),

          ///settings
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingScreen()));
            },
            shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.k08, side: BorderSide(color: AppColors.stroke)),
            leading: const Icon(
              Icons.settings,
              size: 22,
              color: AppColors.primary,
            ),
            contentPadding: const EdgeInsets.only(left: Amount.screenMargin, right: Amount.screenMargin, top: 5, bottom: 5),
            visualDensity: const VisualDensity(vertical: -4, horizontal: 4),
            minLeadingWidth: 0,
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
              color: AppColors.stroke,
            ),
            title: Text(
              getTranslated(context, LangConst.settings).toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, color: AppColors.bodyText),
            ),
          ),
          const HeightBox(Amount.screenMargin),

          ///logout
          ListTile(
            onTap: () {
              showSignOut(context);
            },
            selectedTileColor: Colors.red.withAlpha(50),
            selected: true,
            shape: const RoundedRectangleBorder(
              borderRadius: AppBorderRadius.k08,
            ),
            leading: SvgPicture.asset(
              "assets/app/logout.svg",
            ),
            contentPadding: const EdgeInsets.only(left: Amount.screenMargin, right: Amount.screenMargin, top: 5, bottom: 5),
            visualDensity: const VisualDensity(vertical: -4, horizontal: 4),
            minLeadingWidth: 0,
            title: Text(
              getTranslated(context, LangConst.logout).toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, color: Colors.red),
            ),
          ),
          const HeightBox(Amount.screenMargin),
        ],
      ),
    );
  }

  showSignOut(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shadowColor: AppColors.white,
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            actionsPadding: const EdgeInsets.only(
              right: 16,
              bottom: 16,
              left: 16,
            ),
            title: Text(
              getTranslated(context, LangConst.logout).toString(),
            ),
            content: Text(
              getTranslated(context, LangConst.areYouSureToLogoutThisAccount).toString(),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.stroke,
                ),
                child: Text(getTranslated(context, LangConst.cancel).toString()),
              ),
              ElevatedButton(
                onPressed: () {
                  SharedPreferenceHelper.remove(PreferencesNames.phoneNo);
                  SharedPreferenceHelper.remove(PreferencesNames.authToken);
                  SharedPreferenceHelper.remove(PreferencesNames.email);
                  SharedPreferenceHelper.remove(PreferencesNames.imageUrl);
                  SharedPreferenceHelper.remove(PreferencesNames.isLogin);
                  SharedPreferenceHelper.remove(PreferencesNames.userName);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4D4F),
                ),
                child: Text(
                  getTranslated(context, LangConst.logout).toString(),
                ),
              ),
            ],
          );
        });
  }
}

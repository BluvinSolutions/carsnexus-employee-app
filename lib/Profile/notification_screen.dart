import 'package:carsnexus_employee/Localization/localization_constant.dart';
import 'package:carsnexus_employee/Profile/Model/notification_response.dart';
import 'package:carsnexus_employee/Profile/Provider/notification_provider.dart';
import 'package:carsnexus_employee/Theme/Theme.dart';
import 'package:carsnexus_employee/Theme/colors.dart';
import 'package:carsnexus_employee/Utils/lang_const.dart';
import 'package:carsnexus_employee/Widget/app_bar_back_icon.dart';
import 'package:carsnexus_employee/Widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationProvider notificationProvider;

  @override
  void initState() {
    super.initState();
    notificationProvider = Provider.of<NotificationProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      notificationProvider.callNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    notificationProvider = Provider.of<NotificationProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: notificationProvider.notificationLoader,
      opacity: 0.5,
      progressIndicator: const SpinKitPulsingGrid(
        color: AppColors.primary,
        size: 50.0,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: const AppBarBack(),
          title: Text(getTranslated(context, LangConst.notifications).toString()),
        ),
        body: notificationProvider.notificationData.isEmpty
            ? Center(
                child: Text(
                  getTranslated(context, LangConst.noDataFound).toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(Amount.screenMargin),
                itemCount: notificationProvider.notificationData.length,
                separatorBuilder: (context, index) => const Divider(
                  endIndent: 0,
                  indent: 0,
                ),
                itemBuilder: (context, index) {
                  NotificationData data = notificationProvider.notificationData[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primary.withAlpha(20),
                        child: const Icon(
                          Icons.notifications,
                          color: AppColors.primary,
                        ),
                      ),
                      const WidthBox(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data.title}",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                            ),
                            const HeightBox(4),
                            Text(
                              "${data.subTitle}",
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: AppColors.subText,
                                    fontWeight: FontWeight.w500,
                                  ),
                              maxLines: 3,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}

import 'package:carsnexus_employee/Localization/localization_constant.dart';
import 'package:carsnexus_employee/Profile/Model/reviews_response.dart';
import 'package:carsnexus_employee/Profile/Provider/review_provider.dart';
import 'package:carsnexus_employee/Theme/Theme.dart';
import 'package:carsnexus_employee/Theme/colors.dart';
import 'package:carsnexus_employee/Utils/device_utils.dart';
import 'package:carsnexus_employee/Utils/lang_const.dart';
import 'package:carsnexus_employee/Widget/app_bar_back_icon.dart';
import 'package:carsnexus_employee/Widget/custom_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late ReviewProvider reviewProvider;

  @override
  void initState() {
    super.initState();
    reviewProvider = Provider.of<ReviewProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      reviewProvider.callReviews();
    });
  }

  @override
  Widget build(BuildContext context) {
    reviewProvider = Provider.of<ReviewProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: reviewProvider.reviewLoader,
      opacity: 0.5,
      progressIndicator: const SpinKitPulsingGrid(
        color: AppColors.primary,
        size: 50.0,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: const AppBarBack(),
          title: Text(getTranslated(context, LangConst.review).toString()),
        ),
        body: reviewProvider.notificationData.isEmpty
            ? Center(
                child: Text(
                  getTranslated(context, LangConst.noDataFound).toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            : ListView.separated(
                itemCount: reviewProvider.notificationData.length,
                separatorBuilder: (context, index) => const Divider(
                  indent: 0,
                  endIndent: 0,
                ),
                padding: const EdgeInsets.all(Amount.screenMargin),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  ReviewData data = reviewProvider.notificationData[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExtendedImage.network(
                        data.user!.imageUri!,
                        clipBehavior: Clip.hardEdge,
                        fit: BoxFit.cover,
                        shape: BoxShape.circle,
                        height: 60,
                        width: 60,
                        loadStateChanged: (ExtendedImageState state) {
                          switch (state.extendedImageLoadState) {
                            case LoadState.loading:
                              return const SizedBox(
                                height: 0,
                                width: 0,
                              );
                            case LoadState.completed:
                              return ExtendedImage.network(
                                data.user!.imageUri!,
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.hardEdge,
                                fit: BoxFit.cover,
                                shape: BoxShape.circle,
                              );
                            case LoadState.failed:
                              return Image.asset("assets/app/profile.png");
                          }
                        },
                      ),
                      const WidthBox(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.user!.name!,
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.bodyText,
                                      ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: AppBorderRadius.k06,
                                    color: const Color(0xFFFFF7E6),
                                    border: Border.all(
                                      color: const Color(0xFFFFD591),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.star_rounded,
                                        color: AppColors.warningMedium,
                                        size: 20,
                                      ),
                                      const WidthBox(8),
                                      Text(
                                        "${data.star}",
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                              color: AppColors.warningMedium,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const WidthBox(4),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "${DeviceUtils.formatDate(data.createdAt!)}",
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: AppColors.subText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              "${data.cmt!.isEmpty ? "-" : data.cmt}",
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
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

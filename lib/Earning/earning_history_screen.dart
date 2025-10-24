import 'package:voyzo_employee/Earning/Provider/earning_history_provider.dart';
import 'package:voyzo_employee/Localization/localization_constant.dart';
import 'package:voyzo_employee/Service%20Request/Model/service_request_response.dart';
import 'package:voyzo_employee/Service%20Request/service_request_details_screen.dart';
import 'package:voyzo_employee/Theme/Theme.dart';
import 'package:voyzo_employee/Theme/colors.dart';
import 'package:voyzo_employee/Utils/device_utils.dart';
import 'package:voyzo_employee/Utils/lang_const.dart';
import 'package:voyzo_employee/Widget/app_bar_back_icon.dart';
import 'package:voyzo_employee/Widget/custom_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class EarningHistoryScreen extends StatefulWidget {
  const EarningHistoryScreen({super.key});

  @override
  State<EarningHistoryScreen> createState() => _EarningHistoryScreenState();
}

class _EarningHistoryScreenState extends State<EarningHistoryScreen> {
  late EarningHistoryProvider earningHistoryProvider;
  var startDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day - 7,
  );
  var endDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    earningHistoryProvider = Provider.of<EarningHistoryProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      Map<String, dynamic> body = {
        "from": startDate.toString(),
        "to": endDate.toString(),
      };
      if (kDebugMode) {
        print(body);
      }
      earningHistoryProvider.callEarningHistoryRequest(body);
    });
  }

  @override
  Widget build(BuildContext context) {
    earningHistoryProvider = Provider.of<EarningHistoryProvider>(
      context,
    );
    return ModalProgressHUD(
      inAsyncCall: earningHistoryProvider.serviceRequestLoader,
      opacity: 0.5,
      progressIndicator: const SpinKitPulsingGrid(
        color: AppColors.primary,
        size: 50.0,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: const AppBarBack(),
          title: Text(getTranslated(context, LangConst.earningHistory).toString()),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(Amount.screenMargin),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(Amount.screenMargin),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6FF),
                  border: Border.all(
                    color: const Color(0xFFC8CFFF),
                  ),
                  borderRadius: AppBorderRadius.k16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: AppBorderRadius.k06,
                              border: Border.all(
                                color: AppColors.stroke,
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: startDate,
                                  firstDate: DateTime(1999),
                                  lastDate: DateTime.now(),
                                );

                                if (pickedDate != null) {
                                  if (kDebugMode) {
                                    print(pickedDate);
                                  }
                                  startDate = pickedDate;
                                  Map<String, dynamic> body = {
                                    "from": startDate.toString(),
                                    "to": endDate.toString(),
                                  };
                                  if (kDebugMode) {
                                    print(body);
                                  }
                                  earningHistoryProvider.callEarningHistoryRequest(body);
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getTranslated(context, LangConst.startDate).toString(),
                                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.subText, fontWeight: FontWeight.w500, fontSize: 12),
                                        ),
                                        Text(
                                          DeviceUtils.bookingDate(startDate.toString().split(" ")[0]),
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500, fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.calendar_month_sharp,
                                    color: AppColors.icon,
                                  ),
                                  const WidthBox(5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const WidthBox(10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: AppBorderRadius.k06,
                              border: Border.all(
                                color: AppColors.stroke,
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: endDate,
                                  firstDate: DateTime(1999),
                                  lastDate: DateTime.now(),
                                );

                                if (pickedDate != null) {
                                  if (kDebugMode) {
                                    print(pickedDate);
                                  }
                                  endDate = pickedDate;
                                  Map<String, dynamic> body = {
                                    "from": startDate.toString(),
                                    "to": endDate.toString(),
                                  };
                                  if (kDebugMode) {
                                    print(body);
                                  }
                                  earningHistoryProvider.callEarningHistoryRequest(body);
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getTranslated(context, LangConst.endDate).toString(),
                                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.subText, fontWeight: FontWeight.w500, fontSize: 12),
                                        ),
                                        Text(
                                          DeviceUtils.bookingDate(endDate.toString().split(" ")[0]),
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500, fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.calendar_month_sharp,
                                    color: AppColors.icon,
                                  ),
                                  const WidthBox(5),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const HeightBox(8),
                    Text(
                      getTranslated(context, LangConst.earningLabel).toString(),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500, color: AppColors.subText),
                    ),
                    const HeightBox(3),
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6FFED),
                        border: Border.all(
                          color: const Color(0xFF95DE64),
                        ),
                        borderRadius: AppBorderRadius.k06,
                      ),
                      child: Text(
                        "${earningHistoryProvider.currency} ${earningHistoryProvider.totalAmount.toInt()}",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.complete, fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              earningHistoryProvider.serviceRequestLoader == false && earningHistoryProvider.bookings.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Text(getTranslated(context, LangConst.noDataFound).toString()),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: earningHistoryProvider.bookings.length,
                      padding: const EdgeInsets.only(
                        top: Amount.screenMargin,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(
                        endIndent: 0,
                        indent: 0,
                      ),
                      itemBuilder: (context, index) {
                        ServiceRequestData data = earningHistoryProvider.bookings[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ServiceRequestDetailsScreen(
                                  data: data,
                                ),
                              ),
                            );
                          },
                          child: Row(
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
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${data.user!.name}",
                                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                  color: AppColors.bodyText,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          "${data.currency}${data.amount}",
                                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                color: AppColors.complete,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${data.address}",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: AppColors.subText,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      maxLines: 2,
                                    ),
                                    const HeightBox(4),
                                    Text(
                                      "${DeviceUtils.twentyFourHourFormatWithDate(data.startTime!)} to ${DeviceUtils.twentyFourHourFormatWithDate(data.endTime!)}",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: AppColors.subText,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}

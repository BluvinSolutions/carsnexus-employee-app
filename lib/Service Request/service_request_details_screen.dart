import 'package:carsnexus_employee/Localization/localization_constant.dart';
import 'package:carsnexus_employee/Service%20Request/Model/service_request_response.dart';
import 'package:carsnexus_employee/Service%20Request/Model/single_service_request.dart';
import 'package:carsnexus_employee/Service%20Request/Provider/service_request_provider.dart';
import 'package:carsnexus_employee/Theme/colors.dart';
import 'package:carsnexus_employee/Theme/theme.dart';
import 'package:carsnexus_employee/Utils/device_utils.dart';
import 'package:carsnexus_employee/Utils/lang_const.dart';
import 'package:carsnexus_employee/Widget/app_bar_back_icon.dart';
import 'package:carsnexus_employee/Widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ServiceRequestDetailsScreen extends StatefulWidget {
  final ServiceRequestData data;

  const ServiceRequestDetailsScreen({super.key, required this.data});

  @override
  State<ServiceRequestDetailsScreen> createState() => _ServiceRequestDetailsScreenState();
}

class _ServiceRequestDetailsScreenState extends State<ServiceRequestDetailsScreen> {
  late ServiceRequestProvider serviceRequestProvider;

  @override
  void initState() {
    super.initState();
    serviceRequestProvider = Provider.of<ServiceRequestProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      serviceRequestProvider.callSingleRequest(widget.data.id!.toInt());
    });
  }

  SingleServiceData? requestData;

  @override
  Widget build(BuildContext context) {
    serviceRequestProvider = Provider.of<ServiceRequestProvider>(context);
    if (serviceRequestProvider.singleServiceData != null) {
      requestData = serviceRequestProvider.singleServiceData;
    }
    return ModalProgressHUD(
      inAsyncCall: serviceRequestProvider.singleServiceRequest,
      opacity: 0.5,
      progressIndicator: const SpinKitPulsingGrid(
        color: AppColors.primary,
        size: 50.0,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: const AppBarBack(),
          title: Text(getTranslated(context, LangConst.bookingDetails).toString()),
        ),
        body: requestData == null
            ? const SizedBox()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(Amount.screenMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    requestData!.status == 1
                        ? Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Map<String, dynamic> body = {
                                      "status": 2,
                                    };
                                    Provider.of<ServiceRequestProvider>(context, listen: false)
                                        .callBookingRequestComplete(
                                      widget.data.id!.toInt(),
                                      body,
                                    )
                                        .then((value) {
                                      if (value.data!.success == true) {
                                        setState(() {
                                          requestData!.status = 2;
                                        });
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: AppColors.white,
                                  ),
                                  label: Text(
                                    getTranslated(context, LangConst.completeLabel).toString(),
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white,
                                        ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(30),
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    backgroundColor: AppColors.complete,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: AppBorderRadius.k08,
                                      side: BorderSide(color: AppColors.stroke),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    widget.data.status == 1 ? const HeightBox(5) : const SizedBox(),

                    ///vehicle details
                    Text(
                      getTranslated(context, LangConst.vehicleType).toString(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const HeightBox(8),
                    Container(
                      padding: const EdgeInsets.all(Amount.screenMargin),
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: AppBorderRadius.k16, border: Border.all(color: AppColors.stroke)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated(context, LangConst.shopName).toString(),
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                          ),
                          Text(
                            "${requestData!.shop == null ? "-" : requestData!.shop!.name}",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
                          ),
                          const HeightBox(5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getTranslated(context, LangConst.carModel).toString(),
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                                  ),
                                  Text(
                                    "${requestData!.model == null ? "" : requestData!.model != null ? requestData!.model!.model!.name : "-"}",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getTranslated(context, LangConst.regNumber).toString(),
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                                  ),
                                  Text(
                                    "${requestData!.model == null ? "" : requestData!.model != null ? requestData!.model!.regNumber : "-"}",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text(
                                    getTranslated(context, LangConst.color).toString(),
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                                  ),
                                  Text(
                                    "${requestData!.model == null ? "" : requestData!.model != null ? requestData!.model!.color : "-"}",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const HeightBox(8),

                    ///booking details
                    Text(
                      getTranslated(context, LangConst.bookingDetails).toString(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const HeightBox(8),
                    Container(
                      padding: const EdgeInsets.all(Amount.screenMargin),
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: AppBorderRadius.k16, border: Border.all(color: AppColors.stroke)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated(context, LangConst.orderId).toString(),
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                          ),
                          Text(
                            "${requestData!.bookingId}",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
                          ),
                          const HeightBox(5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getTranslated(context, LangConst.date).toString(),
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                                  ),
                                  Text(
                                    DeviceUtils.bookingDate(requestData!.startTime!),
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getTranslated(context, LangConst.time).toString(),
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                                  ),
                                  Text(
                                    "${DeviceUtils.twentyFourHourFormatWithDate(requestData!.startTime!)} to ${DeviceUtils.twentyFourHourFormatWithDate(requestData!.endTime!)}",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ))
                            ],
                          ),
                          const HeightBox(5),
                          Text(
                            getTranslated(context, LangConst.address).toString(),
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                          ),
                          Text(
                            "${requestData!.address}",
                            maxLines: 3,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const HeightBox(8),

                    ///service Details
                    Text(
                      getTranslated(context, LangConst.serviceDetails).toString(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const HeightBox(8),
                    Container(
                      padding: const EdgeInsets.all(Amount.screenMargin),
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: AppBorderRadius.k16, border: Border.all(color: AppColors.stroke)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated(context, LangConst.servicePlace).toString(),
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                          ),
                          Text(
                            "${getTranslated(context, LangConst.at).toString()} ${requestData!.serviceType == 0 ? {getTranslated(context, LangConst.home).toString()} : getTranslated(context, LangConst.shop).toString()}",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
                          ),
                          const HeightBox(5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getTranslated(context, LangConst.serviceName).toString(),
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: requestData == null ? 0 : requestData!.serviceData!.length,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      ServiceData data = requestData!.serviceData![index];
                                      return Text(
                                        "• ${data.name!}",
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
                                      );
                                    },
                                  ),
                                ],
                              )),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      getTranslated(context, LangConst.amount).toString(),
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.subText),
                                    ),
                                    Text(
                                      "${requestData!.currency} ${requestData!.amount}",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const HeightBox(8),
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:carsnexus_employee/Localization/localization_constant.dart';
import 'package:carsnexus_employee/Service Request/service_request_details_screen.dart';
import 'package:carsnexus_employee/Service%20Request/Model/service_request_response.dart';
import 'package:carsnexus_employee/Service%20Request/Provider/service_request_provider.dart';
import 'package:carsnexus_employee/Theme/colors.dart';
import 'package:carsnexus_employee/Theme/theme.dart';
import 'package:carsnexus_employee/Utils/lang_const.dart';
import 'package:carsnexus_employee/Widget/custom_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceRequestListTile extends StatefulWidget {
  final ServiceRequestData data;

  const ServiceRequestListTile({super.key, required this.data});

  @override
  State<ServiceRequestListTile> createState() => _ServiceRequestListTileState();
}

class _ServiceRequestListTileState extends State<ServiceRequestListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ServiceRequestDetailsScreen(
              data: widget.data,
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExtendedImage.network(
            widget.data.user!.imageUri!,
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
                    widget.data.user!.imageUri!,
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
                    Container(
                      padding: const EdgeInsets.only(
                        top: 4,
                        bottom: 4,
                        left: 10,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: AppBorderRadius.k06,
                        border: Border.all(
                          color: widget.data.serviceType == 0 ? const Color(0xffD3ADF7) : const Color(0xFFFFD591),
                        ),
                        color: widget.data.serviceType == 0 ? const Color(0xFFF9F0FF) : const Color(0xFFFFF7E6),
                      ),
                      child: Text(
                        widget.data.serviceType == 0 ? getTranslated(context, LangConst.home).toString() : getTranslated(context, LangConst.shop).toString(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: widget.data.serviceType == 0 ? const Color(0xFF9254DE) : const Color(0xFFFA8C16),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Text(
                      "${widget.data.bookingId}",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.subText,
                          ),
                    ),
                  ],
                ),
                const HeightBox(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.data.user!.name}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.bodyText,
                          ),
                    ),
                    Text(
                      "${widget.data.currency} ${widget.data.amount}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                    ),
                  ],
                ),
                Text(
                  "${widget.data.address}",
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.subText,
                      ),
                ),
                widget.data.status == 1
                    ? Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Map<String, dynamic> body = {
                                  "status": 2,
                                };
                                Provider.of<ServiceRequestProvider>(context, listen: false).callBookingRequestComplete(
                                  widget.data.id!.toInt(),
                                  body,
                                );
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
                                  side: BorderSide(
                                    color: AppColors.stroke,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

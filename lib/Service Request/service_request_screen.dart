import 'package:voyzo_employee/Localization/localization_constant.dart';
import 'package:voyzo_employee/Service%20Request/Model/service_request_response.dart';
import 'package:voyzo_employee/Service%20Request/Provider/service_request_provider.dart';
import 'package:voyzo_employee/Utils/lang_const.dart';
import 'package:voyzo_employee/Widget/app_bar_back_icon.dart';
import 'package:voyzo_employee/Widget/service_request_listtile.dart';
import 'package:voyzo_employee/Theme/colors.dart';
import 'package:voyzo_employee/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ServiceRequestScreen extends StatefulWidget {
  const ServiceRequestScreen({super.key});

  @override
  State<ServiceRequestScreen> createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ServiceRequestProvider serviceRequestProvider;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    serviceRequestProvider = Provider.of<ServiceRequestProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      serviceRequestProvider.callServiceRequest();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    serviceRequestProvider = Provider.of<ServiceRequestProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: serviceRequestProvider.serviceRequestLoader,
      opacity: 0.5,
      progressIndicator: const SpinKitPulsingGrid(
        color: AppColors.primary,
        size: 50.0,
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            leading: const AppBarBack(),
            title: Text(
              getTranslated(context, LangConst.serviceRequests).toString(),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: SizedBox(
                height: 40,
                child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  indicatorPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      text: getTranslated(context, LangConst.upcoming).toString(),
                    ),
                    Tab(
                      text: getTranslated(context, LangConst.complete).toString(),
                    ),
                    Tab(
                      text: getTranslated(context, LangConst.cancel).toString(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              serviceRequestProvider.upcomingList.isEmpty
                  ? Center(
                      child: Text(
                        getTranslated(context, LangConst.noDataFound).toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  : ListView.separated(
                      itemCount: serviceRequestProvider.upcomingList.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(Amount.screenMargin),
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Divider(
                          indent: 0,
                          endIndent: 0,
                          color: AppColors.stroke,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        ServiceRequestData data = serviceRequestProvider.upcomingList[index];
                        return ServiceRequestListTile(
                          data: data,
                        );
                      },
                    ),
              serviceRequestProvider.completeList.isEmpty
                  ? Center(
                      child: Text(
                        getTranslated(context, LangConst.noDataFound).toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  : ListView.separated(
                      itemCount: serviceRequestProvider.completeList.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(Amount.screenMargin),
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Divider(
                          indent: 0,
                          endIndent: 0,
                          color: AppColors.stroke,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        ServiceRequestData data = serviceRequestProvider.completeList[index];
                        return ServiceRequestListTile(
                          data: data,
                        );
                      },
                    ),
              serviceRequestProvider.cancelList.isEmpty
                  ? Center(
                      child: Text(
                        getTranslated(context, LangConst.noDataFound).toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  : ListView.separated(
                      itemCount: serviceRequestProvider.cancelList.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(Amount.screenMargin),
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Divider(
                          indent: 0,
                          endIndent: 0,
                          color: AppColors.stroke,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        ServiceRequestData data = serviceRequestProvider.cancelList[index];
                        return ServiceRequestListTile(
                          data: data,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

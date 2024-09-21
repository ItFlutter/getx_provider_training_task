import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:task_1/core/class/status_request.dart';
import '../constant/app_imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final Future<void> Function() onRefresh;
  const HandlingDataView(
      {Key? key,
      required this.statusRequest,
      required this.widget,
      required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? CustomRefreshHandlindDataView(
            onRefresh: onRefresh,
            statusRequest: statusRequest,
            imageAsset: AppImageAsset.loading)
        : statusRequest == StatusRequest.offlineFailure
            ? CustomRefreshHandlindDataView(
                onRefresh: onRefresh,
                statusRequest: statusRequest,
                imageAsset: AppImageAsset.offline)
            : statusRequest == StatusRequest.serverFailure
                ? CustomRefreshHandlindDataView(
                    onRefresh: onRefresh,
                    statusRequest: statusRequest,
                    imageAsset: AppImageAsset.server)
                : statusRequest == StatusRequest.failure
                    ? CustomRefreshHandlindDataView(
                        onRefresh: onRefresh,
                        statusRequest: statusRequest,
                        imageAsset: AppImageAsset.noData)
                    : widget;
  }
}

class HandlingDataViewRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final Future<void> Function() onRefresh;
  const HandlingDataViewRequest(
      {Key? key,
      required this.statusRequest,
      required this.widget,
      required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? CustomRefreshHandlindDataView(
            onRefresh: onRefresh,
            statusRequest: statusRequest,
            imageAsset: AppImageAsset.loading)
        : statusRequest == StatusRequest.offlineFailure
            ? CustomRefreshHandlindDataView(
                onRefresh: onRefresh,
                statusRequest: statusRequest,
                imageAsset: AppImageAsset.offline)
            : statusRequest == StatusRequest.serverFailure
                ? CustomRefreshHandlindDataView(
                    onRefresh: onRefresh,
                    statusRequest: statusRequest,
                    imageAsset: AppImageAsset.server)
                : widget;
  }
}

class CustomRefreshHandlindDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final String imageAsset;
  final Future<void> Function() onRefresh;
  const CustomRefreshHandlindDataView({
    Key? key,
    required this.statusRequest,
    required this.imageAsset,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        children: [
          SizedBox(
            height: 150.h,
          ),
          Center(child: Lottie.asset(imageAsset, width: 250.w, height: 250.h))
        ],
      ),
    );
  }
}

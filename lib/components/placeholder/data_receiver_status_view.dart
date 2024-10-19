import 'package:flutter/material.dart';
import 'package:plate_perks/utils/states/data_status.dart';
import 'package:plate_perks/utils/styles/app_colors.dart';

class DataReceiverStateView extends StatelessWidget {
  const DataReceiverStateView({super.key, required this.child, required this.status});
  final Widget child;
  final DataStatus status;

  @override
  Widget build(BuildContext context) {
    if (status == DataStatus.offline){
      return const LinearProgressIndicator(color: AppColors.kPrimaryColor,);
    }else {
      if (status == DataStatus.loading){
        return const LinearProgressIndicator(color: AppColors.kPrimaryColor,);
      }else if (status == DataStatus.error){
        return const Center(child: Text("Error"),);
      }else if (status == DataStatus.failed){
        return const Center(child: Text("Failed"),);
      }else{
        return child;
      }
    }
  }
}
